unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DateUtils, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls;
  Function AbreCaixa(pTurno,pCaixa:Integer): Boolean;
  Function FechaCaixa: Boolean;

  //Function VerificaCaixa(pIniFim:String;pNrTurno:Integer): Integer;
  Procedure CalculaSaldoCaixa(pTurno,pNroCaixa,pSeqCaixa:Integer; pFechaCaixa:Boolean=False);

  //Function AbreFechaCaixa(pmtAbreFecha:String): Integer;
 // Function AberturaDeCaixa: Integer;
 // Function FechamentoDeCaixa: Integer;

type
  TFuCaixa = class(TForm)
    LabRotina: TLabel;
    PanCaixa: TPanel;
    Label2: TLabel;
    dbNrCaixa: TDBText;
    LabSaldoIni: TLabel;
    edSaldoIni: TDBEdit;
    LabSaldoFim: TLabel;
    edSaldoFim: TDBEdit;
    PanControle: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    LabTurnoAtual: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    dbFechamento: TDBText;
    Label1: TLabel;
    LabFechamento: TLabel;
    Label4: TLabel;
    dbTurno: TDBText;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure edSaldoIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSaldoFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuCaixa: TFuCaixa;
  wRetorno: Boolean;
  wAcao: String;

  dhIni,dhFim: TDateTime;
  AA,MM,DD,Hr,Mi,Se,Ms: Word;
  wStatusCaixa,wrkAbreFecha: Integer;
  opAbreFecha: String;     // 'A'brir  ou  'F'echar

implementation

{$R *.dfm}

uses uDados, uGenericas;

Function AbreCaixa(pTurno,pCaixa:Integer): Boolean;
var nSeq: Integer;
    lNovo: Boolean;
begin
  Result := False;
  uDM.RegCaixa.Last;
  if uDM.RegCaixa.RecordCount = 0 then
  begin
    nSeq := 0;
    lNovo := True;
  end
  else begin
    nSeq := uDM.RegCaixaCaixaSeq.AsInteger;
    if uDM.RegCaixaSituacao.AsString = 'F' then
      lNovo := True
    else if uDM.RegCaixaTurno.AsInteger <> pTurno
         then begin
           uDM.RegCaixa.Edit;
           uDM.RegCaixaDtHrFim.AsDateTime := Now;
           uDM.RegCaixaSituacao.AsString := 'F';
           uDM.RegCaixa.Post;
           lNovo := True;
         end
         else lNovo := False;
  end;
  if lNovo then
  begin
    uDM.RegCaixa.Append;
    uDM.RegCaixaTurno.AsInteger := pTurno;
    uDM.RegCaixaNrCaixa.AsInteger := pCaixa;
    uDM.RegCaixaCaixaSeq.AsInteger := nSeq + 1;
    uDM.RegCaixaSaldoInicial.AsCurrency := 0;
    uDM.RegCaixaSaldoFinal.Clear;
    uDM.RegCaixaDtHrInicio.AsDateTime := Now;
    uDM.RegCaixaDtHrFim.Clear;
  end
  else uDM.RegCaixa.Edit;
  //
  wRetorno := False;
  wAcao := 'Abrir';
  if lNovo then
  begin
    FuCaixa.LabRotina.Caption := 'Abertura de caixa';
    FuCaixa.btOk.Caption := 'Abrir caixa';
    FuCaixa.btOk.Hint := 'Abrir novo caixa';
    FuCaixa.btCancel.Caption := 'Cancelar abertura';
    FuCaixa.btCancel.Hint := 'Cancelar a abertura de caixa';
  end
  else begin
    FuCaixa.LabRotina.Caption := 'Utilização de caixa';
    FuCaixa.btOk.Caption := 'Prosseguir caixa';
    FuCaixa.btOk.Hint := 'Utilizar caixa corrente';
    FuCaixa.btCancel.Caption := 'Cancelar utilização';
    FuCaixa.btCancel.Hint := 'Cancelar a utilização do caixa';
  end;
  FuCaixa.edSaldoIni.Enabled := True;
  FuCaixa.LabFechamento.Visible := False;
  FuCaixa.dbFechamento.Visible := False;
  FuCaixa.LabSaldoFim.Visible := False;
  FuCaixa.edSaldoFim.Visible := False;
  FuCaixa.ShowModal;
  Result := wRetorno;

end;

Function FechaCaixa: Boolean;
begin
  wRetorno := False;
  wAcao := 'Fechar';
  uDM.RegCaixa.Edit;
  uDM.RegCaixaDtHrFim.AsDateTime := Now;
  FuCaixa.LabRotina.Caption := 'Fechamento de caixa';
  FuCaixa.edSaldoIni.Enabled := False;
  FuCaixa.LabFechamento.Visible := True;
  FuCaixa.dbFechamento.Visible := True;
  FuCaixa.LabSaldoFim.Visible := True;
  FuCaixa.edSaldoFim.Visible := True;
  FuCaixa.btOk.Caption := 'Fechar caixa';
  FuCaixa.btOk.Hint := 'Efetivar o fechamento do caixa';
  FuCaixa.btCancel.Caption := 'Manter aberto';
  FuCaixa.btCancel.Hint := 'Cancelar o fechamento do caixa';
  FuCaixa.ShowModal;
  Result := wRetorno;

end;

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

{
Procedure AdicionaRegCaixa(pSeq:Integer);
begin
  DecodeDateTime(Now,AA,MM,DD,Hr,Mi,Se,Ms);
  dhIni := EncodeDateTime(AA,MM,DD,Hr,Mi,Se,0);
  //dhFim := dhIni + 1;
  //dhFim := IncSecond(dhFim, -1);
  uDM.RegCaixa.Append;
  uDM.RegCaixaNrCaixa.AsInteger       := uDM.sysNrCaixa;
  uDM.RegCaixaTurno.AsInteger         := pSeq;
  uDM.RegCaixaDtHrInicio.AsDateTime   := dhIni;
  uDM.RegCaixaDtHrFim.Clear;
  uDM.RegCaixaSaldoInicial.AsCurrency := 0;
  uDM.RegCaixa.Post;

end;
}
{
Function AbreFechaCaixa(pmtAbreFecha:String): Integer;
var nrSeq: Integer;
begin
  // Result  0-Cancelar execução   1-Abertura ou Fechamento OK   2-Prosseguir
  Result := 0;
  wrkOperacao := pmtAbreFecha;
  with FuCaixa
  do begin
    LabTurnoAtual.Caption := 'Turno: ' + IntToStr(uDM.turnoCorrente);
    if pmtAbreFecha = 'Abrir'
    then begin
      LabRotina.Caption := 'Abertura';
      uDM.RegCaixa.Last;
      if uDM.RegCaixa.RecordCount = 0 then
        nrSeq := StrToIntDef(ObtemParametro('CaixaSeq_Inicial','1001'),1001)
      else
        nrSeq := uDM.RegCaixaCaixaSeq.AsInteger + 1;
      uDM.RegCaixa.Append;
      uDM.RegCaixaNrCaixa.AsInteger := uDM.sysNrCaixa;
      uDM.RegCaixaCaixaSeq.AsInteger := nrSeq;
      uDM.RegCaixaDtHrInicio.AsDateTime := Now;
      uDM.RegCaixaDtHrFim.Clear;
      uDM.RegCaixaSituacao.AsString := '';
      edSaldoIni.Enabled := True;
      edSaldoFim.Enabled := False;
      btOk.Caption := '&Abrir caixa';
      btCancel.Caption := '&Cancelar abertura';
    end
    else begin
      LabRotina.Caption := 'Fechar / Prosseguir';
      edSaldoIni.Enabled := False;
      edSaldoFim.Enabled := False;
      uDM.RegCaixa.Edit;
      uDM.RegCaixaDtHrFim.AsDateTime := Now;
      uDM.RegCaixaSituacao.AsString := 'F';
      btOk.Caption := '&Fechar caixa';
      btCancel.Caption := '&Prosseguir' + #13 + 'sem fechar';
    end;
    ShowModal;
    Result := wrkRetorno;

  end;


end;
}
{
Function VerificaCaixa(pIniFim:String; pNrTurno:Integer): Integer;
begin
  // pIniFim: 'I'nicio  'F'im
  // Result 0-Erro de caixa, cancela execução  1-Abertura/Fechamento OK   2-Prossegue com o caixa
  // RegCaixa: Filtro/Seleção: Somente os registros do caixa (uDM.sysNrCaixa)
  Result := 0;
  uDM.RegCaixa.Last;
  if uDM.RegCaixa.RecordCount = 0               // Não há registros para o caixa nr. sysNrCaixa
  then begin
    Result := AbreFechaCaixa('Abrir');
    Exit;
  end;
  if (uDM.RegCaixaSituacao.AsString = 'F')      // Caixa 'F'inalizado
     or (pIniFim = 'I')                         // Inicialização
  then Result := AbreFechaCaixa('Abrir')        // Abre novo caixa
  else Result := AbreFechaCaixa('Fechar');      // Prossegue ou Fechar

end;
}

Procedure CalculaSaldoCaixa(pTurno,pNroCaixa,pSeqCaixa:Integer; pFechaCaixa:Boolean=False);
var nMeioPgt: array[0..4] of integer;        // R$, CDeb, cCred, PIX, Outros
    vMeioPgt: array[0..4] of Currency;
    nMisto: Integer;
    nOper: array[0..4] of Integer;           // Recebimentos diversos, Recebimentos pedidos, Suprimento, Pagamento, Sangria
    vOper: array[0..4] of Currency;
    nOp,i: Integer;
    wSdoInicial,wSdoFinal: Currency;
    wNrCaixa,wCaixaSeq,wLctoSeq: Integer;

begin
  if not uDM.RegCaixa.FindKey([pTurno,pNroCaixa,pSeqCaixa]) then
  begin
    MessageDlg('Registro de caixa não encontrado' + #13 +
               'Turno: ' + IntToStr(pTurno) + '  Caixa: ' + IntToStr(pNroCaixa) + '  Seq: ' + IntToStr(pSeqCaixa),
               mtError,[mbOk],0);
    Exit;
  end;
  //
  for i := 0 to 4 do
  begin
    nMeioPgt[i] := 0;
    vMeioPgt[i] := 0;
    nOper[i] := 0;
    vOper[i] := 0;
  end;
  nMisto := 0;
  // Somente os lançamentos do caixa referenciado (Sequencia)
  uDM.LctCaixa.Refresh;
  wNrCaixa := uDM.LctCaixaNrCaixa.AsInteger;
  wCaixaSeq := uDM.LctCaixaCaixaSeq.AsInteger;
  wLctoSeq := uDM.LctCaixaLctoSeq.AsInteger;
  uDM.LctCaixa.First;
  // O primeiro registro deve OBRIGATORIAMENTE ser de saldo inicial
  // NroCaixa,SeqCaixa,LctoSeq=0 e Operacao=0, se não for, cria o registro
  if (uDM.LctCaixaLctoSeq.AsInteger <> 0) and (uDM.LctCaixaOperacao.AsInteger <> 0) then
  begin
    uDM.LctCaixa.Append;
    uDM.LctCaixaNrCaixa.AsInteger := pNroCaixa;
    uDM.LctCaixaCaixaSeq.AsInteger := pSeqCaixa;
    uDM.LctCaixaLctoSeq.AsInteger := 0;
    uDM.LctCaixaOperacao.AsInteger := 0;         // Informação saldo inicial
    uDM.LctCaixaValor.AsCurrency := 0;
    uDM.LctCaixaMeioPgt.AsInteger := 0;
    uDM.LctCaixaSaldo.AsCurrency := 0;
    uDM.LctCaixaHistorico.AsString := 'Saldo inicial';
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
    if (uDM.LctCaixaOperacao.AsInteger = 1) and (uDM.LctCaixaTipo.AsString = 'M') then
        nOp := 0;                  // Recebimentos diversos, sem pedido
    nOper[nOp] := nOper[nOp] + 1;
    vOper[nOp] := vOper[nOp] + uDM.LctCaixaValor.AsCurrency;
    //
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
  uDM.RegCaixaVlrRecebDiv.AsCurrency      := vOper[0];
  uDM.RegCaixaQtdRecebDiv.AsInteger       := nOper[0];

  if pFechaCaixa then
  begin
    uDM.RegCaixaDtHrFim.AsDateTime := Now;
    uDM.RegCaixaSituacao.AsString := 'F';
  end;
  uDM.RegCaixa.Post;
  //
  uDM.LctCaixa.FindNearest([wNrCaixa,wCaixaSeq,wLctoSeq]);

end;



{
Function AberturaDeCaixa: Integer;
var wTurno: Integer;
begin
  Result  := 0;
  //FuCaixa := TFuCaixa.Create(nil);
  with FuCaixa
  do begin
    LabRotina.Caption := 'Abertura de turno';
    edInicio.Enabled := True;
    edSaldoIni.Enabled  := True;
    LabFim.Visible := False;
    edFinal.Visible := False;
    LabSaldoFim.Visible := False;
    edSaldoFim.Visible := False;
    btOk.Caption := 'Abrir turno';
    btCancel.Caption := 'Cancelar' + #13 + 'abertura';
    //
    uDM.RegCaixa.Last;
    wTurno := uDM.RegCaixaTurno.AsInteger + 1;
    uDM.RegCaixa.Append;
    uDM.RegCaixaNrCaixa.AsInteger := uDM.sysNrCaixa;
    uDM.RegCaixaTurno.AsInteger := wTurno;
    uDM.RegCaixaDtHrInicio.AsDateTime := Now;
    uDM.RegCaixaDtHrFim.Clear;
    uDM.RegCaixaSituacao.AsString := 'A';
    wrkOperacao := 1;           // Abertura do caixa ou correção de saldo inicial
    ShowModal;
    if wStatusCaixa > 0 then
      Result := wTurno
    else
      Result := -1;
  end;
  //FuCaixa.Free;

end;
}

Function FechamentoDeCaixa: Integer;
begin
  //FuCaixa := TFuCaixa.Create(nil);
{
  with FuCaixa do
  begin
    uDM.RegCaixa.Edit;
    uDM.RegCaixaDtHrFim.AsDateTime := Now;
    uDM.RegCaixa.Post;
    LabRotina.Caption := 'Fechamento de Turno/Caixa';
    edInicio.Enabled := False;
    edFinal.Enabled := False;
    edSaldoIni.Enabled := False;
    LabFim.Visible := True;
    edFinal.Visible := True;
    LabSaldoFim.Visible := True;
    edSaldoFim.Visible := True;
    edSaldoFim.Enabled := False;
    btOk.Caption := 'Fechar';
    btCancel.Caption := 'Não fechar';
    wrkOperacao := 2;      // Fechamento do caixa
    ShowModal;
    Result := wStatusCaixa;
  end;
  //FuCaixa.Free;
}
end;


procedure TFuCaixa.btCancelClick(Sender: TObject);
begin
  // Abrir ou Fechar, retorna FALSE
  uDM.RegCaixa.Cancel;
  wRetorno := False;
  FuCaixa.Close;

end;

procedure TFuCaixa.btOkClick(Sender: TObject);
begin
  // Abrir ou Fechar, retorna TRUE
  if wAcao = 'Abrir' then
  begin
    uDM.RegCaixaSaldoFinal.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency;
    uDM.RegCaixa.Post;
    uDM.LctCaixa.Refresh;
    if not uDM.LctCaixa.FindKey([uDM.RegCaixaNrCaixa.AsInteger,uDM.RegCaixaCaixaSeq.AsInteger,0]) then
    begin
      uDM.LctCaixa.Append;
      uDM.LctCaixaNrCaixa.AsInteger := uDM.RegCaixaNrCaixa.AsInteger;
      uDM.LctCaixaCaixaSeq.AsInteger := uDM.RegCaixaCaixaSeq.AsInteger;
      uDM.LctCaixaLctoSeq.AsInteger := 0;
    end
    else uDM.LctCaixa.Edit;
    uDM.LctCaixaOperacao.AsInteger := 0;         // Informação de saldo
    uDM.LctCaixaValor.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency;
    uDM.LctCaixaMeioPgt.AsInteger := 0;         // R$
    uDM.LctCaixaSaldo.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency;
    uDM.LctCaixaHistorico.AsString := 'Saldo inicial';
    uDM.LctCaixaDtHrLcto.AsDateTime := Now;
    uDM.LctCaixa.Post;
  end
  else begin
    uDM.RegCaixaSituacao.AsString := 'F';
    uDM.RegCaixa.Post;
  end;
  uDM.sysCaixaSeq := uDM.RegCaixaCaixaSeq.AsInteger;
  wRetorno := True;
  FuCaixa.Close;

end;

procedure TFuCaixa.edSaldoFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuCaixa.edSaldoIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuCaixa.FormActivate(Sender: TObject);
begin
  if wAcao = 'Abrir' then
    edSaldoIni.SetFocus
  else
    btCancel.SetFocus;         // edSaldoFim.SetFocus;

end;

procedure TFuCaixa.FormCreate(Sender: TObject);
begin
  Height := 410;
  Width := 400;
  Top := (Screen.Height - Height) div 2;
  Left := (Screen.Width - Width) div 2;

end;

end.
