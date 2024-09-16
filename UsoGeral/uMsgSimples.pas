unit uMsgSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
  Function ExibeMensagem(pMensagem:String): Boolean;
  Function FechaMensagem: Boolean;


type
  TFuMsgSimples = class(TForm)
    LabAcao: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuMsgSimples: TFuMsgSimples;

implementation

{$R *.dfm}

Function ExibeMensagem(pMensagem:String): Boolean;
begin
  Result := False;
  with FuMsgSimples
  do begin
    Color           := clYellow;
    LabAcao.Caption := pMensagem;
    Width           := LabAcao.Width + 28;
    Height          := LabAcao.Height + 40;
    Top             := (Screen.Height - Height) div 2;
    Left            := (Screen.Width - Width) div 2;
    Show;
    Application.ProcessMessages;
  end;
  Result := True;

end;

Function FechaMensagem: Boolean;
begin
  Result := False;
  Try
    FuMsgSimples.Close;
    Result := True;
  Except
  End;

end;

end.
