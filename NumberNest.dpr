program NumberNest;

uses
  Vcl.Forms,
  Classes,
  SysUtils,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  Grids,
  uShellSort in 'uShellSort.pas',
  uMainForm in 'uMainForm.pas' {Form1},
  uArrayHelper in 'uArrayHelper.pas',
  ifIntegerSort in 'ifIntegerSort.pas',
  uHeapSort in 'uHeapSort.pas',
  uBaseLogger in 'Logging\uBaseLogger.pas',
  uBaseLoggerProvider in 'Logging\uBaseLoggerProvider.pas',
  uLogging in 'Logging\uLogging.pas',
  uThreading in 'uThreading.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
