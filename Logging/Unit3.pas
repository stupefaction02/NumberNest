unit Unit3;

interface

uses
  uLogging;

type
  TBaseLogProvider = class
    public
      procedure LogMessage(const Msg: string); Virtual; Abstract;
  end;

type
  TListBoxLogProvider = class(TBaseLogProvider)
    public
      procedure LogMessage(const Msg: string); override;
  end;

implementation

procedure TListBoxLogProvider.LogMessage(const Msg: string);
begin

end;
end.
