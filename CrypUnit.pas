unit CrypUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFormCryp = class(TForm)
    ButtonCryp: TButton;
    ButtonReCryp: TButton;
    EditPass: TEdit;
    ProgressBar1: TProgressBar;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    Label1: TLabel;
    procedure ButtonCrypClick(Sender: TObject);
    Function  Password:integer;
    procedure ButtonReCrypClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCryp: TFormCryp;

implementation

{$R *.dfm}

Function TFormCryp.Password:integer;
  var i:integer;
begin
  If EditPass.Text='' then result:= 0
  else
    for i:=0 to Length(EditPass.Text) do
      result:=result+Ord(EditPass.Text[i]);
end;

procedure TFormCryp.ButtonCrypClick(Sender: TObject);
var
  d, PasswordLength: byte;
  i: integer;
  Files,NewFiles: TStream;
begin
  ButtonCryp.Enabled:=false;
  ButtonReCryp.Enabled:=false;
  if OpenDialog1.Execute then
    begin
      Files:=TFileStream.Create(OpenDialog1.FileName,fmOpenRead);
      NewFiles:=TFileStream.Create(OpenDialog1.FileName+'.sfr',fmCreate);
      ProgressBar1.Max:=Files.Size;
      PasswordLength := Length(EditPass.Text);
      for i:=0 to Files.Size - 1 do
         begin
           Files.Position:=i;
           NewFiles.Position:=i;
           Files.Read(d,1);
           If PasswordLength>0 then d:=d+ord(EditPass.Text[i mod PasswordLength + 1]);
           NewFiles.Write(d,1);
           ProgressBar1.Position:=i;
           Application.ProcessMessages;
           if Application.Terminated then Break;
         end;
      ProgressBar1.Position:=i;
      NewFiles.Free;
      Files.Free;
     end;
  ProgressBar1.Position:=0;
  ShowMessage('װאיכ ַארטפנמגאם!');
  ButtonCryp.Enabled:=true;
  ButtonReCryp.Enabled:=true;
end;


procedure TFormCryp.ButtonReCrypClick(Sender: TObject);
var
  d, PasswordLength: byte;
  i : integer;
  Files,NewFiles: TStream;
begin
  ButtonCryp.Enabled:=false;
  ButtonReCryp.Enabled:=false;
  if OpenDialog1.Execute then
    if SaveDialog1.Execute then
      begin
        Files:=TFileStream.Create(OpenDialog1.FileName,fmOpenRead);
        NewFiles:=TFileStream.Create(SaveDialog1.FileName,fmCreate);
        ProgressBar1.Max:=Files.Size;
        PasswordLength := Length(EditPass.Text);

        for i:=0 to Files.Size-1 do
          begin
            Files.Position:=i;
            NewFiles.Position:=i;
            Files.Read(d,1);
            If PasswordLength>0 then d:=d-ord(EditPass.Text[i mod PasswordLength + 1]);
            NewFiles.Write(d,1);
            ProgressBar1.Position:=i;
            Application.ProcessMessages;
            if Application.Terminated then Break;
          end;
        ProgressBar1.Position:=i;
        NewFiles.Free;
        Files.Free;
      end;
  ProgressBar1.Position:=0;
  ShowMessage('װאיכ ׀אסרטפנמגאם!');
  ButtonCryp.Enabled:=true;
  ButtonReCryp.Enabled:=true;

end;


procedure TFormCryp.Button1Click(Sender: TObject);
var a, b, c, d : Byte;
begin
  a:=250;
  b:=9;
  c:=a+b;
  d:=c-b;
  a:=a-b;
  Label1.Caption:=IntToStr(c)+'  '+IntToStr(d);
end;


end.
