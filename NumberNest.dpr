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
  uNumberNestCore in 'uNumberNestCore.pas',
  uMainForm in 'uMainForm.pas' {Form1},
  uArrayHelper in 'uArrayHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
