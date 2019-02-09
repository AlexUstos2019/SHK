program Setting;

uses
  Forms,
  option in 'option.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Bot 4 HustleCastle';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
