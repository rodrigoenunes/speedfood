unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DateUtils, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons;
  Function AberturaDeCaixa(lExibe:Boolean=False): Boolean;
  Function FechamentoDeCaixa: Boolean;

type
  TFuCaixa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
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

uses uDados;
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
  xMeioPgt: array[1..5] of String = ('R$', 'CCred','CDeb','PIX','Outros');
}


Procedure AdicionaRegCaixa(pSeq:Integer);
begin
  DecodeDateTime(Now,AA,MM,DD,Hr,Mi,Se,Ms);
  dhIni := EncodeDateTime(AA,MM,DD,Hr,Mi,Se,0);
  dhFim := dhIni + 1;
  dhFim := IncSecond(dhFim, -1);
  //
  uDM.RegCaixa.Append;
  uDM.RegCaixaSequencia.AsInteger := pSeq;
  uDM.RegCaixaDtHrInicio.AsDateTime := dhIni;
  uDM.RegCaixaDtHrFim.AsDateTime := dhFim;    // Registro de caixa para 24 h
  uDM.RegCaixaSaldoInicial.AsCurrency := 0;
  uDM.RegCaixa.Post;

end;

Function CalculaSaldoCaixa(pSeq:Integer): Boolean;
var nMeioPgt: array[1..5] of integer;
    vMeioPgt: array[1..5] of Currency;
    nOper: array[1..5] of Integer;
    vOper: array[1..5] of Currency;
    nOp,i: Integer;
    vSdoIni,vSdoFim: Currency;
begin
  Result := False;
  if not uDM.RegCaixa.FindKey([pSeq]) then Exit;

  for i := 1 to 5 do
  begin
    nMeioPgt[i] := 0;
    vMeioPgt[i] := 0;
    nOper[i] := 0;
    vOper[i] := 0;
  end;
  vSdoIni := 0;
  vSdoFim := 0;

  uDM.LctCaixa.Refresh;
  uDM.LctCaixa.First;
  while not uDM.LctCaixa.Eof do
  begin
    nOp := uDM.LctCaixaOperacao.AsInteger;
    nOper[nOp] := nOper[nOp] + 1;
    vOper[nOp] := vOper[nOp] + uDM.LctCaixaValor.AsCurrency;
    uDM.LctCaixa.Edit;
    case uDM.LctCaixaOperacao.AsInteger of
      1:begin                // Saldo inicial
          uDM.LctCaixaSaldo.AsCurrency := uDM.LctCaixaValor.AsCurrency;
          vSdoIni := uDM.LctCaixaValor.AsCurrency;
          vSdoFim := uDM.LctCaixaSaldo.AsCurrency;
        end;
      2:begin                // Suprimento
          uDM.LctCaixaSaldo.AsCurrency := uDM.LctCaixaSaldo.AsCurrency + uDM.LctCaixaValor.AsCurrency;
          vSdoFim := vSdoFim + uDM.LctCaixaValor.AsCurrency;
        end;
      3:begin                // Recebimento
          uDM.LctCaixaSaldo.AsCurrency := uDM.LctCaixaSaldo.AsCurrency + uDM.LctCaixaValor.AsCurrency;
          vSdoFim := vSdoFim + uDM.LctCaixaValor.AsCurrency;
          i := uDM.LctCaixaMeioPgt.AsInteger;
          if (i < 1) or (i > 5) then i := 5;
          nMeioPgt[i] := nMeioPgt[i] + 1;
          vMeioPgt[i] := vMeioPgt[i] + uDM.LctCaixaValor.AsCurrency;
        end;
      4:begin                // Pagamento
          uDM.LctCaixaSaldo.AsCurrency := uDM.LctCaixaSaldo.AsCurrency - uDM.LctCaixaValor.AsCurrency;
          vSdoFim := vSdoFim - uDM.LctCaixaValor.AsCurrency;
        end;
      5:begin                // Sangria
          uDM.LctCaixaSaldo.AsCurrency := uDM.LctCaixaSaldo.AsCurrency - uDM.LctCaixaValor.AsCurrency;
          vSdoFim := vSdoFim - uDM.LctCaixaValor.AsCurrency;
        end;
    end;
    uDM.LctCaixa.Post;
    //
    uDM.LctCaixa.Next;
  end;
  uDM.RegCaixa.Edit;
  uDM.RegCaixaSaldoInicial.AsCurrency := vSdoIni;
  uDM.RegCaixaE_Dinheiro.AsCurrency := vMeioPgt[1];
  uDM.RegCaixaE_CartaoCredito.AsCurrency := vMeioPgt[2];
  uDM.RegCaixaE_CartaoDebito.AsCurrency := vMeioPgt[3];
  uDM.RegCaixaE_PIX.AsCurrency := vMeioPgt[4];
  uDM.RegCaixaE_Outros.AsCurrency := vMeioPgt[5];
  uDM.RegCaixaE_Suprimento.AsCurrency := vOper[2];
  uDM.RegCaixaS_Saidas.AsCurrency := vOper[4];
  uDM.RegCaixaS_Sangria.AsCurrency := vOper[5];
  uDM.RegCaixaSaldoFinal.AsCurrency := vSdoFim;
  uDM.RegCaixaQtd_Dinheiro.AsInteger := nMeioPgt[1];
  uDM.RegCaixaQtd_CartaoCredito.AsInteger := nMeioPgt[2];
  uDM.RegCaixaQtd_CartaoDebito.AsInteger := nMeioPgt[3];
  uDM.RegCaixaQtd_PIX.AsInteger := nMeioPgt[4];
  uDM.RegCaixaQtd_Outros.AsInteger := nMeioPgt[5];
  uDM.RegCaixaQtd_Suprimento.AsInteger := nOper[2];
  uDM.RegCaixaQtd_Saidas.AsInteger := nOper[4];
  uDM.RegCaixaQtd_Sangria.AsInteger := nOper[5];
  uDM.RegCaixa.Post;

end;


Function AberturaDeCaixa(lExibe:Boolean=False): Boolean;
var nSeq: Integer;
begin
  Result := False;
  FuCaixa := TFuCaixa.Create(nil);
  with FuCaixa
  do begin
    Top := 60;
    Left := 60;
    Width := 292;
    Height := 282;
    LabRotina.Caption := 'Abertura de caixa';
    edInicio.Enabled := True;
    edFinal.Enabled := True;
    edSaldoIni.Enabled := True;
    LabSaldoFim.Visible := False;
    edSaldoFim.Visible := False;
    //
    DecodeDateTime(Now,AA,MM,DD,Hr,Mi,Se,Ms);
    dhIni := EncodeDateTime(AA,MM,DD,Hr,Mi,Se,0);
    nSeq := 0;
    uDM.RegCaixa.First;
    while (not uDM.RegCaixa.Eof) and (nSeq = 0) 
    do begin
      if (dhIni >= uDM.RegCaixaDtHrInicio.AsDateTime)
          and (dhIni <= uDM.RegCaixaDtHrFim.AsDateTime)
      then nSeq := uDM.RegCaixaSequencia.AsInteger          // Registro de caixa já existe
      else uDM.RegCaixa.Next;
    end;
    if nSeq = 0
    then begin
      uDM.RegCaixa.Last;
      nSeq := uDM.RegCaixaSequencia.AsInteger + 1;
      AdicionaRegCaixa(nSeq);
      lExibe := True;
    end;
    if lExibe
    then begin
      uDM.RegCaixa.FindKey([nSeq]);
      uDM.RegCaixa.Edit;
      wrkOperacao := 1;      // Abertura do caixa ou correção de saldo inicial
      ShowModal;
    end;
    Result := True;
  end;
  FuCaixa.Free;

end;

Function FechamentoDeCaixa: Boolean;
begin
  Result := False;
  FuCaixa := TFuCaixa.Create(nil);
  with FuCaixa
  do begin
    Top := 60;
    Left := 200;
    Width := 292;
    Height := 282;
    LabRotina.Caption := 'Fechamento de caixa';
    edInicio.Enabled := False;
    edFinal.Enabled := False;
    edSaldoIni.Enabled := True;
    LabSaldoFim.Visible := True;
    edSaldoFim.Visible := True;
    edSaldoFim.Enabled := False;
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

procedure TFuCaixa.btOkClick(Sender: TObject);
begin
  if wrkOperacao = 1 then
  begin   // Abertura do caixa ou correção de saldo inicial
    uDM.RegCaixa.Post;
    uDM.LctCaixa.Refresh;
    if uDM.LctCaixa.RecordCount = 0 then
    begin     // Se não há lançamentos para o dia (sequencia)
      uDM.LctCaixa.Append;
      uDM.LctCaixaSeqCaixa.AsInteger := uDM.RegCaixaSequencia.AsInteger;
      uDM.LctCaixaDtHrLcto.AsDateTime := Now;
      uDM.LctCaixaOperacao.AsInteger := 1;      // Saldo
      uDM.LctCaixaValor.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency;
      uDM.LctCaixaMeioPgt.AsInteger := 1;         // R$
      uDM.LctCaixaNrCartao.Clear;
      uDM.LctCaixaSaldo.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency;
      uDM.LctCaixaHistorico.AsString := 'Saldo inicial';
      uDM.LctCaixa.Post;
    end
    else begin
      uDM.LctCaixa.First;
      uDM.LctCaixa.Edit;
      uDM.LctCaixaValor.AsCurrency := uDM.RegCaixaSaldoInicial.AsCurrency; 
      uDM.LctCaixa.Post;
    end;
    CalculaSaldoCaixa(uDM.RegCaixaSequencia.AsInteger);
  end
  else begin                 // Fechamento do caixa
    ShowMessage('Fechamento do caixa');
  end;
  FuCaixa.Close;

end;

end.
