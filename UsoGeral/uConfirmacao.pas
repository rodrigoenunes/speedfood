unit uConfirmacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;
  Function Confirmacao(pCaption:String;
                       pMensag:String;
                       pTamMens:Integer;
                       pTexto:TStringList;
                       pCapBotoes:Array of String
                       ): Integer;


type
  TFuConfirmacao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuConfirmacao: TFuConfirmacao;
  nBotoes,nrOpcao: Integer;

implementation

{$R *.dfm}

Function Confirmacao(pCaption:String;                 // Caption da janela
                       pMensag:String;
                       pTamMens:Integer;
                       pTexto:TStringList;
                       pCapBotoes:Array of String
                     ): Integer;
var i: Integer;

begin
  FuConfirmacao := TFuConfirmacao.Create(nil);
  with FuConfirmacao
  do begin
    Caption := pCaption;
    Label1.Font.Size := pTamMens;
    Label1.Caption := pMensag;
    Memo1.Lines.Clear;
    for i := 0 to pTexto.Count-1
      do Memo1.Lines.Add(pTexto[i]);
    bitBtn1.Visible := False;
    bitBtn2.Visible := False;
    bitBtn3.Visible := False;
    bitBtn4.Visible := False;
    nBotoes := Length(pCapBotoes);
    bitBtn1.Caption := pCapBotoes[1];
    bitBtn1.Visible := True;
    if nBotoes > 1 then
    begin
      bitBtn2.Caption := pCapBotoes[2];
      bitBtn2.Visible := True;
      if nBotoes > 2 then
      begin
        bitBtn3.Caption := pCapBotoes[3];
        bitBtn3.Visible := True;
        if nBotoes > 3 then
        begin
          bitBtn4.Caption := pCapBotoes[4];
          bitBtn4.Visible := True;
        end;
      end;
    end;
    ShowModal;
    Result := nrOpcao;
  end;
  FuConfirmacao.Free;

end;

procedure TFuConfirmacao.BitBtn1Click(Sender: TObject);
begin
  nrOpcao := 1;
  FuConfirmacao.Close;

end;

procedure TFuConfirmacao.BitBtn2Click(Sender: TObject);
begin
  nrOpcao := 2;
  FuConfirmacao.Close;

end;

procedure TFuConfirmacao.BitBtn3Click(Sender: TObject);
begin
  nrOpcao := 3;
  FuConfirmacao.Close;

end;

procedure TFuConfirmacao.BitBtn4Click(Sender: TObject);
begin
  nrOpcao := 4;
  FuConfirmacao.Close;

end;

procedure TFuConfirmacao.FormActivate(Sender: TObject);
begin
  FormResize(nil);
  nrOpcao := 0;

end;

procedure TFuConfirmacao.FormResize(Sender: TObject);
var tLeft,tGap,tGapTotal: Integer;
begin
  if nBotoes = 1
  then begin
    bitBtn1.Width := 135;
    bitBtn1.Left := (FuConfirmacao.ClientWidth - bitBtn1.Width) div 2;
    Exit;
  end;
  tLeft := 64;
  tGap := 12;
  tGapTotal := tGap * (nBotoes - 1) + tLeft;

  bitBtn1.Width := (FuConfirmacao.ClientWidth - tGapTotal)  div nBotoes;
  bitBtn1.Left := 64;
  bitBtn2.Visible := True;
  bitBtn2.Width := bitBtn1.Width;
  bitBtn2.Left := bitBtn1.Left + bitBtn1.Width + tGap;
  if nBotoes > 2 then
  begin
    bitBtn3.Width := bitBtn2.Width;
    bitBtn3.Left := bitBtn2.Left + bitBtn2.Width + tGap;
    if nBotoes > 3 then
    begin
      bitBtn4.Width := bitBtn2.Width;
      bitBtn4.Left := bitBtn3.Left + bitBtn3.Width + tGap;
    end;
  end;

end;

end.
