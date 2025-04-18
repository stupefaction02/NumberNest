unit uBaseLoggerProvider;

interface

uses
  uLogging, Vcl.ComCtrls,  Vcl.StdCtrls;

type
  TBaseLoggerProvider = class
    public
      procedure LogMessage(const Msg: string); Virtual; Abstract;
  end;

type
  TListBoxLogProvider = class(TBaseLoggerProvider)
    public
      procedure LogMessage(const Msg: string); override;

      constructor Create(RichEdit: TRichEdit);

    private
       Output: TRichEdit;
  end;

implementation

constructor TListBoxLogProvider.Create(RichEdit: TRichEdit);
begin
  Output := RichEdit;
end;

procedure TListBoxLogProvider.LogMessage(const Msg: string);
begin
//   if Output <> nil then
     Output.Lines.Add(Msg);
end;
end.
