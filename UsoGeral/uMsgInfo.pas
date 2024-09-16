unit uMsgInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;
  Function MsgInformacao(pInfo:String;
                         pTitulo:String;
                         pMens:String;
                         xCap:array of String;
                         lBotoes:Integer;
                         lFoco: Integer): Integer;

type
  TFuMsgInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LabMsg: TLabel;
    btUm: TBitBtn;
    btDois: TBitBtn;
    btTres: TBitBtn;
    LabTitulo: TLabel;
    procedure btUmClick(Sender: TObject);
    procedure btDoisClick(Sender: TObject);
    procedure btTresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuMsgInfo: TFuMsgInfo;
  wFoco,wResposta: Integer;

implementation

{$R *.dfm}

Function MsgInformacao(pInfo:String;
                       pTitulo:String;
                       pMens:String;
                       xCap:array of String;
                       lBotoes:Integer;
                       lFoco: Integer): Integer;
var nWidth,nHeight: Integer;
begin
  FuMsgInfo  := TFuMsgInfo.Create(nil);
  with FuMsgInfo
  do begin
    Caption                := pInfo;
    LabTitulo.Caption      := pTitulo;
    nWidth                 := LabTitulo.Width;
    LabMsg.Caption         := pMens;
    if LabMsg.Width > nWidth  then nWidth := LabMsg.Width;
    FuMsgInfo.ClientWidth  := nWidth + 24;
    if FuMsgInfo.ClientWidth < 386 then FuMsgInfo.ClientWidth := 386;
    FuMsgInfo.ClientHeight := 120 + LabMsg.Height;
    if FuMsgInfo.ClientHeight < 180 then FuMsgInfo.ClientHeight := 180;
    //
    btUm.Caption           := xCap[0];
    btDois.Caption         := xCap[1];
    btTres.caption         := xCap[2];
    if (lBotoes = 1) or (lBotoes = 3) or (lBotoes = 5) or (lBotoes = 7)
       then btUm.Visible    := True;
    if (lBotoes = 2) or (lBotoes = 3) or (lBotoes = 6) or (lBotoes = 7)
       then btDois.Visible  := True;
    if (lBotoes = 4) or (lBotoes = 5) or (lBotoes = 6) or (lBotoes = 7)
       then btTres.Visible  := True;
    //
    btUm.Left   := 8;
    btDois.Left := (Panel1.Width - btDois.Width) div 2;
    btTres.Left := Panel1.Width - (btTres.Width + 8);
    wFoco       := lFoco;
    ShowModal;
    Result := wResposta;
    Free;
  end;

end;

procedure TFuMsgInfo.btUmClick(Sender: TObject);
begin
  wResposta := 1;
  FuMsgInfo.Close;

end;

procedure TFuMsgInfo.btDoisClick(Sender: TObject);
begin
  wResposta := 2;
  FuMsgInfo.Close;

end;

procedure TFuMsgInfo.btTresClick(Sender: TObject);
begin
  wResposta := 3;
  FuMsgInfo.Close;

end;

procedure TFuMsgInfo.FormShow(Sender: TObject);
begin
  case wFoco of
    1:btUm.SetFocus;
    2:btDois.SetFocus;
    3:btTres.SetFocus;
  end;

end;

end.
