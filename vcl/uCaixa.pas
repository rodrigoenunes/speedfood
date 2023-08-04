unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DateUtils, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons;
  Function AberturaDeCaixa(lExibe:Boolean=False): Integer;
  Function FechamentoDeCaixa: Boolean;
  Procedure CalculaSaldoCaixa(pTurno:Integer);

type
  TFuCaixa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbTurno: TDBText;
    edInicio: TDBEdit;
    edFinal: TDBEdit;
    edSaldoIni: TDBEdit;
    LabRotina: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    LabSaldoFim: TLabel;
    edSaldoFim: TDBEdit;
    btLctCaixa: TBitBtn;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure edInicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSaldoIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSaldoFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btLctCaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuCaixa: TFuCaixa;
  dhIni,dhFim: TDateTime;
  AA,MM,DD,Hr,Mi,Se,Ms: Word;
  wrkOperacao: Integer;

implementation

{$R *.dfm}

uses uDados, uPrincipal, uCaixaMovto;
{
    O 'Caixa' é considerado por sequencia de abertura, compreendendo um período entre
    uma data/hora de abertura e uma data/hora de encerramento
    - Abertura do caixa
       Informar: Sequencia (automaticamente última + 1)
                 data/hora de início
                 data/hora de fim
                 Saldo inicial
       Antes de gerar nova sequencia, verifica se a data/hora já existe

    - Encerramento do caixa
       Informar: 'Fechamento'

  Operacao: array[1..5] of String = ('Saldo','Suprim','Receb','Pagto','Sangria');
  xMeioPgt: array[1..5] of String = ('R$', 'CDeb','CCred','PIX','Outros');
}


Procedure AdicionaRegCaixa(pSeq:Integer);
begin
  DecodeDateTime(Now,AA,MM,DD,Hr,Mi,Se,Ms);
  dhIni := EncodeDateTime(AA,MM,DD,Hr,Mi,Se,0);
  dhFim := dhIni + 1;
  dhFim := IncSecond(dhFim, -1);
  uDM.RegCaixa.Append;
  uDM.RegCaixaTurno.AsInteger         := pSeq;
  uDM.RegCaixaDtHrInicio.AsDateTime   := dhIni;
  uDM.RegCaixaDtHrFim.AsDateTime      := dhFim;    // Registro de caixa para 24 h
  uDM.RegCaixaSaldoInicial.AsCurrency := 0;
  uDM.RegCaixa.Post;

end;

Procedure CalculaSaldoCaixa(pTurno:Integer);
var nMeioPgt: array[0..4] of integer;        // R$, CDeb, cCred, PIX, Outros
    vMeioPgt: array[0..4] of Currency;
    nMisto: Integer;
    nOper: array[1..4] of Integer;           // Pedido-Recebimento, Suprimento, Pagamento, Sangria
    vOper: array[1..4] of Currency;
    nOp,i: Integer;
    wSdoInicial,wSdoFinal: Currency;
begin
  if not uDM.RegCaixa.FindKey([pTurno]) then Exit;            // Posiciona o reg.de caixa da sequencia
  for i := 0 to 4 do
  begin
    nMeioPgt[i] := 0;
    vMeioPgt[i] := 0;
    if i > 0 then
    begin
      nOper[i] := 0;
      vOper[i] := 0;
    end;
  end;
  nMisto := 0;

  // Somente os lançamentos do caixa referenciado (Sequencia)
  uDM.LctCaixa.Refresh;
  uDM.LctCaixa.First;
  //  O primeiro registro deve OBRIGATORIAMENTE ser de saldo inicial e somente um registro '0'
  //  Se não for, cria o registro
  if uDM.LctCaixaOperacao.AsInteger <> 0 then
  begin
    uDM.LctCaixa.Append;
    uDM.LctCaixaTurno.AsInteger     := uDM.RegCaixaTurno.AsInteger;
    uDM.LctCaixaSequencia.AsInteger := 0;
    uDM.LctCaixaOperacao.AsInteger  := 0;         // Informação saldo inicial
    uDM.LctCaixaValor.AsCurrency    := 0;
    uDM.LctCaixaMeioPgt.AsInteger   := 0;
    uDM.LctCaixaSaldo.AsCurrency    := 0;
    uDM.LctCaixaHistorico.AsString  := 'Saldo inicial';
    uDM.LctCaixaDtHrLcto.AsDateTime := uDM.RegCaixaDtHrInicio.AsDateTime;
    uDM.LctCaixa.Post;
    uDM.LctCaixa.First;
  end;
  //
  wSdoInicial := uDM.LctCaixaSaldo.AsCurrency;
  wSdoFinal   := uDM.LctCaixaSaldo.AsCurrency;
  uDM.LctCaixa.Next;
  while not uDM.LctCaixa.Eof do
  begin
    nOp := uDM.LctCaixaOperacao.AsInteger;
    nOper[nOp] := nOper[nOp] + 1;
    vOper[nOp] := vOper[nOp] + uDM.LctCaixaValor.AsCurrency;
    uDM.LctCaixa.Edit;
    case uDM.LctCaixaOperacao.AsInteger of
      1:begin                // Recebimento
          wSdoFinal  := wSdoFinal + uDM.LctCaixaValor.AsCurrency;
          uDM.LctCaixaSaldo.AsCurrency := wSdoFinal;
          i := uDM.LctCaixaMeioPgt.AsInteger;
          if (i >= 0) and (i <= 4) then
          begin
            nMeioPgt[i] := nMeioPgt[i] + 1;
            vMeioPgt[i] := vMeioPgt[i] + uDM.LctCaixaValor.AsCurrency;
          end
          else begin
            nMisto := nMisto + 1;
            vMeioPgt[0] := vMeioPgt[0] + uDM.LctCaixaPgtReais.AsCurrency;
            vMeioPgt[1] := vMeioPgt[1] + uDM.LctCaixaPgtCDeb.AsCurrency;
            vMeioPgt[2] := vMeioPgt[2] + uDM.LctCaixaPgtCCred.AsCurrency;
            vMeioPgt[3] := vMeioPgt[3] + uDM.LctCaixaPgtPIX.AsCurrency;
            vMeioPgt[4] := vMeioPgt[4] + uDM.LctCaixaPgtOutros.AsCurrency;
          end;
        end;
      2:begin                // ( Suprimento
          wSdoFinal := wSdoFinal + uDM.LctCaixaValor.AsCurrency;
          uDM.LctCaixaSaldo.AsCurrency := wSdoFinal;
        end;
      3:begin                // Pagamento
          wSdoFinal := wSdoFinal - uDM.LctCaixaValor.AsCurrency;
          uDM.LctCaixaSaldo.AsCurrency := wSdoFinal;
        end;
      4:begin                // Sangria
          wSdoFinal := wSdoFinal - uDM.LctCaixaValor.AsCurrency;
          uDM.LctCaixaSaldo.AsCurrency := wSdoFinal;
        end;
    end;
    uDM.LctCaixa.Post;
    uDM.LctCaixa.Next;
  end;
  uDM.RegCaixa.Edit;
  uDM.RegCaixaSaldoInicial.AsCurrency     := wSdoInicial;
  uDM.RegCaixaE_Dinheiro.AsCurrency       := vMeioPgt[0];
  uDM.RegCaixaE_CartaoDebito.AsCurrency   := vMeioPgt[1];
  uDM.RegCaixaE_CartaoCredito.AsCurrency  := vMeioPgt[2];
  uDM.RegCaixaE_PIX.AsCurrency            := vMeioPgt[3];
  uDM.RegCaixaE_Outros.AsCurrency         := vMeioPgt[4];
  uDM.RegCaixaE_Suprimento.AsCurrency     := vOper[2];
  uDM.RegCaixaS_Saidas.AsCurrency         := vOper[3];
  uDM.RegCaixaS_Sangria.AsCurrency        := vOper[4];
  uDM.RegCaixaSaldoFinal.AsCurrency       := wSdoFinal;
  uDM.RegCaixaQtd_Dinheiro.AsInteger      := nMeioPgt[0];
  uDM.RegCaixaQtd_CartaoDebito.AsInteger  := nMeioPgt[1];
  uDM.RegCaixaQtd_CartaoCredito.AsInteger := nMeioPgt[2];
  uDM.RegCaixaQtd_PIX.AsInteger           := nMeioPgt[3];
  uDM.RegCaixaQtd_Outros.AsInteger        := nMeioPgt[4];
  uDM.RegCaixaQtd_Misto.AsInteger         := nMisto;
  uDM.RegCaixaQtd_Suprimento.AsInteger    := nOper[2];
  uDM.RegCaixaQtd_Saidas.AsInteger        := nOper[3];
  uDM.RegCaixaQtd_Sangria.AsInteger       := nOper[4];
  uDM.RegCaixaVlrPedidos.AsCurrency       := vOper[1];
  uDM.RegCaixaQtdPedidos.AsInteger        := nOper[1];
  uDM.RegCaixa.Post;

end;


Function AberturaDeCaixa(lExibe:Boolean=False): Integer;
var wTurno: Integer;
begin
  Result  := 0;
  FuCaixa := TFuCaixa.Create(nil);
  with FuCaixa
  do begin
    Top    := 60;
    Left   := 60;
    Height := 320;
    btCancel.Caption := '&Cancelar';
    btLctCaixa.Visible := lExibe;
    if lExibe then
       btCancel.Caption := '&Sair';
    Width  := 284;
    LabRotina.Caption   := 'Abertura de caixa';
    edInicio.Enabled    := True;
    edFinal.Enabled     := True;
    edSaldoIni.Enabled  := True;
    LabSaldoFim.Visible := False;
    edSaldoFim.Visible  := False;
    //
    DecodeDateTime(Now,AA,MM,DD,Hr,Mi,Se,Ms);
    dhIni  := EncodeDateTime(AA,MM,DD,Hr,Mi,Se,0);
    wTurno := 0;
    uDM.RegCaixa.First;
    while (not uDM.RegCaixa.Eof) and (wTurno = 0)
    do if (dhIni >= uDM.RegCaixaDtHrInicio.AsDateTime) and (dhIni <= uDM.RegCaixaDtHrFim.AsDateTime)
         then wTurno := uDM.RegCaixaTurno.AsInteger          // Registro de caixa já existe
         else uDM.RegCaixa.Next;
    //
    if wTurno = 0
    then begin        // Não existe o registro de caixa do turno (Turno de 1 a .....)
      uDM.RegCaixa.Last;
      wTurno := uDM.RegCaixaTurno.AsInteger + 1;
      AdicionaRegCaixa(wTurno);
      lExibe := True;
    end;
    if lExibe
    then begin
      uDM.RegCaixa.FindKey([wTurno]);
      uDM.RegCaixa.Edit;
      wrkOperacao := 1;           // Abertura do caixa ou correção de saldo inicial
      ShowModal;
    end;
    Result := wTurno;

  end;


  FuCaixa.Free;

end;

Function FechamentoDeCaixa: Boolean;
begin
  Result := False;
  FuCaixa := TFuCaixa.Create(nil);
  with FuCaixa
  do begin
    Top    := 60;
    Left   := 200;
    Width  := 284;
    Height := 284;
    LabRotina.Caption   := 'Fechamento de caixa';
    edInicio.Enabled    := False;
    edFinal.Enabled     := False;
    edSaldoIni.Enabled  := True;
    LabSaldoFim.Visible := True;
    edSaldoFim.Visible  := True;
    edSaldoFim.Enabled  := False;
    //
    wrkOperacao := 2;      // Fechamento do caixa
    ShowModal;
    Result := True;
  end;             
  FuCaixa.Free;

end;


procedure TFuCaixa.btCancelClick(Sender: TObject);
begin
  uDM.RegCaixa.Cancel;
  FuCaixa.Close;

end;

procedure TFuCaixa.btLctCaixaClick(Sender: TObject);
begin
  CaixaMovimentacao;
  FuCaixa.Close;

end;

procedure TFuCaixa.btOkClick(Sender: TObject);
begin
  if wrkOperacao = 1 then
  begin                 // Abertura do caixa ou correção de saldo inicial
    uDM.RegCaixa.Post;
    uDM.LctCaixa.Refresh;
    if uDM.LctCaixa.RecordCount = 0 then
    begin             // Se não há lançamentos para o dia (sequencia), cria o registro de saldo inicial
      uDM.LctCaixa.Append;
      uDM.LctCaixaTurno.AsInteger     := uDM.RegCaixaTurno.AsInteger;
      uDM.LctCaixaSequencia.AsInteger := 0;
      uDM.LctCaixaOperacao.AsInteger  := 0;         // Informação de saldo
      uDM.LctCaixaValor.AsCurrency    := uDM.RegCaixaSaldoInicial.AsCurrency;
      uDM.LctCaixaMeioPgt.AsInteger   := 0;         // R$
      uDM.LctCaixaSaldo.AsCurrency    := uDM.RegCaixaSaldoInicial.AsCurrency;
      uDM.LctCaixaHistorico.AsString  := 'Saldo inicial';
      uDM.LctCaixaDtHrLcto.AsDateTime := Now;
      uDM.LctCaixa.Post;
    end
    else begin        // Corrige o registro de saldo inicial
      uDM.LctCaixa.First;
      uDM.LctCaixa.Edit;
      uDM.LctCaixaValor.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency;
      uDM.LctCaixaSaldo.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency;
      uDM.LctCaixa.Post;
    end;
    CalculaSaldoCaixa(uDM.RegCaixaTurno.AsInteger);
  end
  else begin                 // Fechamento do caixa
    ShowMessage('Fechamento do caixa, emite relatorio de fechamento');
    CalculaSaldoCaixa(uDM.RegCaixaTurno.AsInteger);
  end;
  FuCaixa.Close;

end;

procedure TFuCaixa.edFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuCaixa.edInicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuCaixa.edSaldoFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuCaixa.edSaldoIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

end.
