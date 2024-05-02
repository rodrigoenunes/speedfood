unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DateUtils, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls;
  Function VerificaStatusCaixa: Integer;
  Function AberturaDeCaixa: Integer;
  Function FechamentoDeCaixa: Integer;
  Procedure CalculaSaldoCaixa(pTurno:Integer; pFinaliza:Boolean=False);

type
  TFuCaixa = class(TForm)
    Label1: TLabel;
    LabInicio: TLabel;
    LabFim: TLabel;
    LabSaldoIni: TLabel;
    dbTurno: TDBText;
    edInicio: TDBEdit;
    edFinal: TDBEdit;
    edSaldoIni: TDBEdit;
    LabRotina: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    LabSaldoFim: TLabel;
    edSaldoFim: TDBEdit;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure edInicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  dhIni,dhFim: TDateTime;
  AA,MM,DD,Hr,Mi,Se,Ms: Word;
  wrkOperacao: Integer;
  wStatusCaixa: Integer;

implementation

{$R *.dfm}

uses uDados, uPrincipal;
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
  //dhFim := dhIni + 1;
  //dhFim := IncSecond(dhFim, -1);
  uDM.RegCaixa.Append;
  uDM.RegCaixaTurno.AsInteger         := pSeq;
  uDM.RegCaixaDtHrInicio.AsDateTime   := dhIni;
  uDM.RegCaixaDtHrFim.Clear;
  uDM.RegCaixaSaldoInicial.AsCurrency := 0;
  uDM.RegCaixa.Post;

end;

Procedure CalculaSaldoCaixa(pTurno:Integer; pFinaliza:Boolean=False);
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
  if pFinaliza then
  begin
    uDM.RegCaixaDtHrFim.AsDateTime := Now;
    uDM.RegCaixaSituacao.AsString := 'F';
  end;
  uDM.RegCaixa.Post;

end;

Function VerificaStatusCaixa: Integer;
begin
{  Retorno:  0=Abrir novo turno
             1=Prosseguir com o turno atual      }
  uDM.RegCaixa.Last;
  if uDM.RegCaixaSituacao.AsString = 'F' then
  begin                // Turno 'F'inalizado
    Result := 0;       // Abrir novo caixa/turno
    Exit;
  end;
  //FuCaixa := TFuCaixa.Create(nil);
  with FuCaixa
  do begin
    LabRotina.Caption := 'Turno aberto';
    LabFim.Visible := False;
    edFinal.Visible := False;
    LabSaldoFim.Visible := False;
    edSaldoFim.Visible := False;
    btOk.Caption := 'Prosseguir' + #13 + 'com o turno';
    btCancel.Caption := 'Fechar turno' + #13 + 'e iniciar novo';
    wrkOperacao := 3;           // Caixa aberto
    ShowModal;
    Result := wStatusCaixa;     // 0-Abrir novo; 1-Prosseguir
  end;
  //FuCaixa.Free;

end;


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

Function FechamentoDeCaixa: Integer;
begin
  //FuCaixa := TFuCaixa.Create(nil);
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

end;


procedure TFuCaixa.btCancelClick(Sender: TObject);
begin
  case wrkOperacao of
    1:begin     // Abertura de turno
        uDM.RegCaixa.Cancel;
        wStatusCaixa := -1;
      end;
    2:begin     // Fechamento de turno
        uDM.RegCaixa.Edit;
        uDM.RegCaixaDtHrFim.Clear;
        uDM.RegCaixaSituacao.Clear;
        uDM.RegCaixa.Post;
        MessageDlg('Fechamento de turno cancelado' + #13 +
                   'prosseguindo com o turno atual [' + uDM.RegCaixaTurno.AsString + ' ]',
                   mtInformation,[mbOk],0);
        wStatusCaixa := 1;       // Fechamento cancelado, segue com turno atual
      end;
    3:begin     // Verificação do Status atual do caixa
        wStatusCaixa := 0;       // Fechar o caixa e abrir novo
      end;
  end;
  FuCaixa.Close;

end;

procedure TFuCaixa.btOkClick(Sender: TObject);
begin
  case wrkOperacao of
    1:begin                 // Abertura do caixa ou correção de saldo inicial
        uDM.RegCaixa.Post;
        uDM.LctCaixa.Refresh;
        if uDM.LctCaixa.RecordCount = 0 then
        begin             // Se não há lançamentos para o turno, cria o registro de saldo inicial
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
        wStatusCaixa := 1;
      end;
    2:begin                 // Fechamento do caixa
        CalculaSaldoCaixa(uDM.RegCaixaTurno.AsInteger,True);
        uDM.RegCaixa.Edit;
        uDM.RegCaixaDtHrFim.AsDateTime := Now;
        uDM.RegCaixaSituacao.AsString := 'F';     // Finalizado
        uDM.RegCaixa.Post;
        wStatusCaixa := 0;      // Indica 'abrir' novo turno
      end;
    3:begin           // Prosseguir com o caixa/turno aberto
        wStatusCaixa := 1;
      end;
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

procedure TFuCaixa.FormActivate(Sender: TObject);
begin
  case wrkOperacao of
    2:begin      // Fechamento de caixa
        btOk.SetFocus;   // Fechamento de caixa
      end;
    3:begin
        btOk.SetFocus;   // Caixa aberto
      end;
  end;

end;

procedure TFuCaixa.FormCreate(Sender: TObject);
begin
    Height := 370;
    Width := 375;
    Top := (Screen.Height - Height) div 2;
    Left := (Screen.Width - Width) div 2;

end;

end.
