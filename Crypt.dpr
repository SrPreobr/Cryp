program Crypt;

uses
  Forms,
  CrypUnit in 'CrypUnit.pas' {FormCryp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCryp, FormCryp);
  Application.Run;
end.
