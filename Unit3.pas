unit Unit3;

interface

uses
  uLogging;

type
  TBaseLogProvider = class
    public
      procedure LogMessage(const Msg: string; const logLevel: TLogLevel); Virtual; Abstract;
  end;

type
  TListBoxLogProvider = class(TBaseLogProvider)
    public
      procedure LogMessage(const Msg: string; const logLevel: TLogLevel); override;
  end;

implementation

procedure TListBoxLogProvider.LogMessage(const Msg: string; const logLevel: TLogLevel);
begin

end;
end.
