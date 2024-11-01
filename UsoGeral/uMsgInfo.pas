unit uMsgInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;
  Function MsgInformacao(pCaption:String;
                         pTitulo:String;
                         pMens:String;
                         pCapBotoes:array of String;
                         pBotoes:Integer;
                         pFoco: Integer;
                         pTempo:Integer=0;
                         pEsq:Integer=0;
                         pTop:Integer=0): Integer;

type
  TFuMsgInfo = class(TForm)
    PanBotoes: TPanel;
    Panel2: TPanel;
    btUm: TBitBtn;
    btDois: TBitBtn;
    btTres: TBitBtn;
    LabTitulo: TLabel;
    Timer1: TTimer;
    MemMsg: TMemo;
    LabTmp: TLabel;
    LabExit: TLabel;
    procedure btUmClick(Sender: TObject);
    procedure btDoisClick(Sender: TObject);
    procedure btTresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LabExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuMsgInfo: TFuMsgInfo;
  wTempo,wFoco,wResp: Integer;

implementation

{$R *.dfm}

Function MsgInformacao(pCaption:String;
                       pTitulo:String;
                       pMens:String;
                       pCapBotoes:array of String;
                       pBotoes:Integer;
                       pFoco: Integer;
                       pTempo:Integer=0;
                       pEsq:Integer=0;
                       pTop:Integer=0): Integer;
var nPos: Integer;
begin
  Result := -1;
  wFoco := pFoco;
  wTempo := pTempo;
  FuMsgInfo  := TFuMsgInfo.Create(nil);
  with FuMsgInfo
  do begin
    if (pEsq = 0) and (pTop = 0) then
      Position := poScreenCenter
    else begin
      Left := pEsq;
      Top := pTop;
      Position := poDesigned;
    end;
    //
    Caption := pCaption;
    LabTitulo.Caption := pTitulo;
    MemMsg.Lines.Clear;
    nPos := Pos(#13,pMens);
    while nPos > 0 do
    begin
      MemMsg.Lines.Add(Copy(pMens,1,nPos-1));
      pMens := Copy(pMens,nPos+1,Length(pMens)-nPos);
      nPos := Pos(#13,pMens);
    end;
    MemMsg.Lines.Add(pMens);
    //
    btUm.Caption   := pCapBotoes[0];
    btDois.Caption := pCapBotoes[1];
    btTres.caption := pCapBotoes[2];
    if (pBotoes = 1) or (pBotoes = 3) or (pBotoes = 5) or (pBotoes = 7)
       then btUm.Visible    := True;
    if (pBotoes = 2) or (pBotoes = 3) or (pBotoes = 6) or (pBotoes = 7)
       then btDois.Visible  := True;
    if (pBotoes = 4) or (pBotoes = 5) or (pBotoes = 6) or (pBotoes = 7)
       then btTres.Visible  := True;
    //
    ShowModal;
  end;
  FuMsgInfo.Free;
  Result := wResp;

end;

procedure TFuMsgInfo.btUmClick(Sender: TObject);
begin
  wResp := 1;
  FuMsgInfo.Close;

end;

procedure TFuMsgInfo.btDoisClick(Sender: TObject);
begin
  wResp := 2;
  FuMsgInfo.Close;

end;

procedure TFuMsgInfo.btTresClick(Sender: TObject);
begin
  wResp := 3;
  FuMsgInfo.Close;

end;

procedure TFuMsgInfo.FormShow(Sender: TObject);
begin
  btUm.Font.Style := [];
  btDois.Font.Style := [];
  btTres.Font.Style := [];
  case wFoco of
    1:begin
        btUm.SetFocus;
        btUm.Font.Style := [fsBold];
      end;
    2:begin
        btDois.SetFocus;
        btDois.Font.Style := [fsBold];
      end;
    3:begin
        btTres.SetFocus;
        btTres.Font.Style := [fsBold];
      end;
  end;
  if wTempo > 0 then
  begin
    LabTmp.Caption := IntToStr(wTempo);
    LabTmp.Visible := True;
    Timer1.Enabled := True;
  end;

end;

procedure TFuMsgInfo.LabExitClick(Sender: TObject);
begin
  wResp := -1;
  FuMsgInfo.Close;

end;

procedure TFuMsgInfo.Timer1Timer(Sender: TObject);
begin
  wTempo := wTempo - 1;
  LabTmp.Caption := IntToStr(wTempo);
  if wTempo = 0 then
  begin
    wResp := wFoco;
    FuMsgInfo.Close;
  end;


end;

end.
