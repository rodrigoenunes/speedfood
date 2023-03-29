unit uUserPwd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Touch.Keyboard;
  Function ObtemUsuario(var pmtUser:String): Boolean;

type
  TFuUserPwd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Panel1: TPanel;
    LabMsg: TLabel;
    LabTentativas: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure edUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuUserPwd: TFuUserPwd;
  nTentativas: Integer;
  wUsuario: String;

implementation

{$R *.dfm}

uses uDados;

Function ObtemUsuario(var pmtUser:String): Boolean;
begin
  Result := False;
  FuUserPwd := TFuUserPwd.Create(nil);
  FuUserPwd.Top := 100;
  FuUserPwd.Left := 80;
  nTentativas := 5;
  wUsuario := '';
  uDM.Usuarios.Active := True;
  FuUserPwd.edUsuario.Text := '';
  FuUserPwd.edSenha.Text := '';
  FuUserPwd.LabTentativas.Caption := '';
  FuUserPwd.LabMsg.Caption := '';
  FuUserPwd.ShowModal;
  uDM.Usuarios.Active := False;
  FuUserPwd.Free;
  if wUsuario <> '' then
  begin
    pmtUser := wUsuario;
    Result := True;
  end;

end;

procedure TFuUserPwd.btCancelClick(Sender: TObject);
begin
  FuUserPwd.Close;

end;

procedure TFuUserPwd.btOkClick(Sender: TObject);
var nErro: Integer;
begin
  nErro := 0;
  if not uDM.Usuarios.FindKey([edUsuario.Text]) then
  begin
    LabMsg.Caption := 'Usuário inexistente';
    nErro := 1;
  end
  else
    if edSenha.Text <> uDM.UsuariosSenha.AsString then
    begin
      LabMsg.Caption := 'Senha inválida';
      nErro := 2;
    end;
  //
  if nErro <> 0 then
  begin
    nTentativas := nTentativas - 1;
    if nTentativas > 0 then
    begin
      Application.ProcessMessages;
      LabTentativas.Caption := 'Restam ' + IntToStr(nTentativas) + ' tentativas';
      if nErro = 1 then
        edUsuario.SetFocus
      else
        edSenha.SetFocus;
    end
    else begin
      edUsuario.Text := '';
      edSenha.Text := '';
      LabTentativas.Caption := '';
      LabMsg.Caption := 'Tentativas esgotadas' + #13 + 'aplicação cancelada';
      btOk.Enabled := False;
      btCancel.SetFocus;
    end;
    Exit;
  end;
  //
  wUsuario := edUsuario.Text;
  FuUserPwd.Close;

end;

procedure TFuUserPwd.edSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinCOntrol),true,true);

end;

procedure TFuUserPwd.edUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinCOntrol),true,true);

end;

procedure TFuUserPwd.FormActivate(Sender: TObject);
begin
  edUsuario.Text := '';
  edUsuario.SetFocus;

end;

end.
