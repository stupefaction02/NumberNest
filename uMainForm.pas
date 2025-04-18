unit uMainForm;

interface

uses
  uBaseLogger, uBaseLoggerProvider, uThreading, uArrayHelper, ifIntegerSort,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  uHeapSort, uShellSort, Vcl.ExtCtrls, System.TimeSpan, System.Math, System.Diagnostics;

type
  TForm1 = class(TForm)
    ShellSortButton: TButton;
    SetLengthTextBox: TEdit;
    Label1: TLabel;
    HeapSortButton: TButton;
    GenerateSetButton: TButton;
    SetPanel: TRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    LogsRichEdit: TRichEdit;
    SortingVisualiser: TPaintBox;

    procedure GenerateSetButtonClick(Sender: TObject);
    procedure HeapSortButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SortingVisualiserPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StartSort(SortProc: TProc);
    procedure ShellSortButtonClick(Sender: TObject);

  private
    TargetSet: TArray<Integer>;
    ShellSort1: TShellSort;
    HeapSort1: THeapSort;
    Logger: TBaseLogger;
    LargestSetElement: Integer;
    MaxVisualiserLength: Integer;
    TaskScheduler: TThreadScheduler;

    procedure SortIterationCallbackHandler();

    procedure EnableUI(IsEnable: BOOLEAN);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.GenerateSetButtonClick(Sender: TObject);
var
  SetLength: Integer;
begin
  EnableUI(false);

  SetLength := StrToIntDef(SetLengthTextBox.Text, 0);

  TargetSet := nil;
  TargetSet := TArrayHelper.CreateRandom(SetLength);

  Logger.Log( Format('Set of %d elements was generated', [ SetLength ]) );

  LargestSetElement := MaxIntValue( TargetSet );

  Form1.SetPanel.Text := TArrayHelper.ArrayTostring(TargetSet);

  SortingVisualiser.Invalidate;

  EnableUI(true);
end;

procedure TForm1.HeapSortButtonClick(Sender: TObject);
begin
  StartSort(procedure
    begin
       HeapSort1.Sort(TargetSet);
    end
  );
end;

procedure TForm1.ShellSortButtonClick(Sender: TObject);
begin
  StartSort(procedure
    begin
       ShellSort1.Sort(TargetSet);
    end
  );
end;

procedure TForm1.StartSort(SortProc: TProc);
var
  Stopwatch: TStopwatch;
  Elapsed: TTimeSpan;

begin
   EnableUI(false);

   Stopwatch := TStopwatch.StartNew;

   TaskScheduler.ExecuteNow(procedure
       begin
             SortProc();

             EnableUI(true);

             Elapsed := Stopwatch.Elapsed;
             Logger.Log( Format('Sorted %d elements, Took %g ms', [ Length(TargetSet), Elapsed.TotalSeconds ]));
       end);
end;



procedure TForm1.SortingVisualiserPaint(Sender: TObject);
var
  X, Y, I, Width, Height: Integer;
begin

  if ( Length(TargetSet) < 1 ) then Exit();

  SetRoundMode(rmTruncate);

  Width := Round( SortingVisualiser.Width / Length(TargetSet) );
  Height := SortingVisualiser.Height;

  for I := 0 to Length(TargetSet) - 1 do
    begin
      X := I * Width;
      Y := Height - (TargetSet[i] * Round(Height / LargestSetElement));
      SortingVisualiser.Canvas.Rectangle(X, Y, X + Width, Height);
    end;

end;

procedure TForm1.EnableUI(IsEnable: BOOLEAN);
begin
  SetLengthTextBox.Enabled := IsEnable;
  ShellSortButton.Enabled := IsEnable;
  HeapSortButton.Enabled := IsEnable;
  GenerateSetButton.Enabled := IsEnable;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Logger.Log('Closing.');

  Logger.Free;

  TaskScheduler.Free;

  TargetSet := nil;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShellSort1 := TShellSort.Create;
  HeapSort1 := THeapSort.Create;

  ShellSort1.SortIterationCallback := SortIterationCallbackHandler;
  HeapSort1.SortIterationCallback := SortIterationCallbackHandler;

  Form1.DoubleBuffered := true;

  SortingVisualiser.Canvas.Brush.Color := clBlack;

  MaxVisualiserLength := SortingVisualiser.Width;

  // TODO: Make with factory
  Logger := TBaseLogger.Create('Main');

  Logger.AddProvider( TListBoxLogProvider.Create(LogsRichEdit) );

  TaskScheduler := TThreadScheduler.Create();
end;

procedure TForm1.SortIterationCallbackHandler();
begin
   // Post execution to UI thread
   TThread.Synchronize(nil,
     procedure
       begin
        Form1.SetPanel.Text := TArrayHelper.ArrayTostring(TargetSet);

        if Length(TargetSet) <= MaxVisualiserLength then
          SortingVisualiser.Invalidate;
       end
   );

   Sleep(10);
end;

end.
