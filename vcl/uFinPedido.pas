unit uFinPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.UITypes;
  Function FinalizaPedido: Integer;

type
  TFuFinPedido = class(TForm)
    PanRodape: TPanel;
    PanInform: TPanel;
    PanTexto: TPanel;
    MemPedido: TMemo;
    PanTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabTaman: TLabel;
    dbNro: TDBEdit;
    dbLcts: TDBEdit;
    dbValor: TDBEdit;
    PanCliente: TPanel;
    Label4: TLabel;
    dbCPF: TDBEdit;
    Label9: TLabel;
    dbNome: TDBEdit;
    PanCtle: TPanel;
    btCancelar: TBitBtn;
    btRetornar: TBitBtn;
    btGravar: TBitBtn;
    PanPagto: TPanel;
    PanDetPgto: TPanel;
    LabReais: TLabel;
    LabCDeb: TLabel;
    LabCRed: TLabel;
    LabPix: TLabel;
    LabOutros: TLabel;
    edReais: TDBEdit;
    edCDeb: TDBEdit;
    edCCred: TDBEdit;
    edPIX: TDBEdit;
    edOutros: TDBEdit;
    dbMeioPagto: TDBRadioGroup;
    Label10: TLabel;
    procedure btGravarClick(Sender: TObject);
    procedure btRetornarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dbCPFExit(Sender: TObject);
    procedure dbCPFEnter(Sender: TObject);
    procedure dbMeioPagtoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuFinPedido: TFuFinPedido;
  nRetorno,nrPedido: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas, uPedidos, uImpressoes;

Function FinalizaPedido: Integer;
var linHifen: String;
    xDescr,xTotal,wTxtAux: String;
    i,tMax: Integer;
    strItem: TStringList;
begin
  with FuFinPedido
  do begin
    Width := Trunc(Screen.Width * 0.70);
    Left := (Screen.Width - Width) div 2;
    Height := Trunc(Screen.Height * 0.80);
    Top := (Screen.Height - Height) div 2;
    linHifen := stringFiller('-',70);
    LabTaman.Font.Name := 'Lucida Console';
    LabTaman.Font.Size := 8;
    LabTaman.Caption := linHifen;
    PanTexto.Width := LabTaman.Width + 32;
    MemPedido.Font.Name := LabTaman.Font.Name;
    MemPedido.Font.Size := LabTaman.Font.Size;
    //
    strItem := TStringList.Create;
    uDM.Pedidos.Last;
    nrPedido := uDM.PedidosNumero.AsInteger + 1;
    uDM.Pedidos.Append;
    uDM.PedidosNumero.AsInteger := nrPedido;
    uDM.PedidosData.AsDateTime := Now;
    uDM.PedidosCPF_CNPJ.Clear;
    uDM.PedidosLanctos.AsInteger := FuPedidos.itensPedido;
    uDM.PedidosValor.AsCurrency := FuPedidos.totalPedido;
    uDM.PedidosMeioPagto.AsInteger := 0;      // Reais
    uDM.PedidosVlrReais.AsCurrency := FuPedidos.totalPedido;
    uDM.PedidosVlrCDeb.Clear;
    uDM.PedidosVlrCCred.Clear;
    uDM.PedidosVlrPIX.Clear;
    uDM.PedidosVlrOutros.Clear;
    uDM.PedidosNrNFCe.Clear;
    uDM.PedidosSrNFCe.Clear;
    uDM.PedidosArqXML.Clear;
    uDM.PedidosCPF_CNPJ.EditMask := '';
{
<     D e s c r i ç ã o     >                                < Total >
123456789.123456789.123456789.123456789.123456789.123456789. 999999,99
----------------------------------------------------------------------
123456789.123456789.123456789.123456789.123456789.123456789.123456789.
}
    MemPedido.Lines.Clear;
    MemPedido.Lines.Add(StringCompleta('<     D e s c r i ç ã o     >','D',' ',60) + ' < Total >');
    MemPedido.Lines.Add(linHifen);
    uDM.PedWrk.First;
    while not uDM.PedWrk.Eof
    do begin
      strItem.Clear;
      tMax := 60;
      if (uDM.PedWrkTpProd.AsInteger = 3) or                 // Bebidas ou Diversos
         (uDM.PedWrkTpProd.AsInteger = 4) then tMax := 49;
      xDescr := Trim(uDM.PedWrkDescricao.AsString);
      if Length(xDescr) > tMax then xDescr := Copy(xDescr,1,tMax);
      if (uDM.PedWrkTpProd.AsInteger = 3) or            // Bebidas
         (uDM.PedWrkTpProd.AsInteger = 4)               // Diversos
      then xDescr := xDescr + '(' + uDM.PedWrkQuant.AsString + ' X ' +
                     FloatToStrF(uDM.PedWrkVlrUnit.AsCurrency,ffNumber,6,2) + ')';
      xDescr := stringCompleta(xDescr,'D','.',60);
      xTotal := StringCompleta(FloatToStrF(uDM.PedWrkVlrTotal.AsCurrency,ffNumber,8,2),'E','.',10);
      strItem.Add(xDescr + xTotal);
      // Extras
      if uDM.PedWrkTxtExtras.AsString <> '' then
      begin
        strItem.Add(' Acrescentar');
        wTxtAux := uDM.PedWrkTxtExtras.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add('    ' + Copy(wTxtAux,1,56));
          wTxtAux := Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add('    ' + wTxtAux);
      end;
      // Excecoes
      if uDM.PedWrkTxtExtras.AsString <> '' then
      begin
        strItem.Add('  Excluir');
        wTxtAux := uDM.PedWrkTxtExclus.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add('    ' + Copy(wTxtAux,1,56));
          wTxtAux := Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add('    ' + wTxtAux);
      end;
      // Observações
      if uDM.PedWrkObserv.AsString <> '' then
      begin
        strItem.Add('  Observações');
        wTxtAux := uDM.PedWrkObserv.AsString;
        while Length(wTxtAux) >= 56
        do begin
          strItem.Add('    ' + Copy(wTxtAux,1,56));
          wTxtAux := Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add('    ' + wTxtAux);
      end;
      //
      strItem.Add(' ');
      for i := 0 to strItem.Count-1
        do MemPedido.Lines.Add(strItem[i]);
      uDM.PedWrk.Next;
    end;
    MemPedido.Lines.Add(linHifen);
    xDescr := IntToStr(FuPedidos.itensPedido) + ' ítens' +
              '     Total: R$ ' + FloatToStrF(FuPedidos.totalPedido,ffNumber,15,2);
    MemPedido.Lines.Add(stringCompleta(xDescr,'C',' ',70));
    MemPedido.Lines.Add(linHifen);
    //
    nRetorno := 1;
    ShowModal;
  end;
  Result := nRetorno;

end;

procedure TFuFinPedido.btCancelarClick(Sender: TObject);
begin
  uDM.Pedidos.Cancel;
  nRetorno := 2;
  FuFinPedido.Close;

end;

procedure TFuFinPedido.btGravarClick(Sender: TObject);
var somaVlr,wSaldo: Currency;
    newSeq: Integer;
    vlrEntradas,vlrSaidas: Currency;
begin
  somaVlr := uDM.PedidosVlrReais.AsCurrency + uDM.PedidosVlrCDeb.AsCurrency +
             uDM.PedidosVlrCCred.AsCurrency + uDM.PedidosVlrPIX.AsCurrency +
             uDM.PedidosVlrOutros.AsCurrency;
  if uDM.PedidosValor.AsCurrency <> somaVlr then
  begin
    MessageDlg('Somatório dos valores difere do total do pedido',mtError,[mbOk],0);
    dbMeioPagto.SetFocus;
    Exit;
  end;
  //
  uDM.Pedidos.Post;
  uDM.PedWrk.First;
  while not uDM.PedWrk.Eof do
  begin
    uDM.PedItens.Append;
    uDM.PedItensNumero.AsInteger := nrPedido;
    uDM.PedItensNrLcto.AsInteger := uDM.PedWrkNrLcto.AsInteger;
    uDM.PedItensTpProd.AsInteger := uDM.PedWrkTpProd.AsInteger;
    uDM.PedItensCodProd.AsInteger := uDM.PedWrkCodProd.AsInteger;
    uDM.PedItensVlrUnitario.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency;
    uDM.PedItensCod01.AsInteger := uDM.PedWrkCod01.AsInteger;
    uDM.PedItensVlr01.AsCurrency := uDM.PedWrkVlr01.AsCurrency;
    uDM.PedItensCod02.AsInteger := uDM.PedWrkCod02.AsInteger;
    uDM.PedItensVlr02.AsCurrency := uDM.PedWrkVlr02.AsCurrency;
    uDM.PedItensCod03.AsInteger := uDM.PedWrkCod03.AsInteger;
    uDM.PedItensVlr03.AsCurrency := uDM.PedWrkVlr03.AsCurrency;
    uDM.PedItensVlrTotal.AsCurrency := uDM.PedWrkVlrTotal.AsCurrency;
    uDM.PedItensExtras.AsString := uDM.PedWrkExtras.AsString;
    uDM.PedItensTxtExtras.AsString := uDM.PedWrkTxtExtras.AsString;
    uDM.PedItensTxtExclus.AsString := uDM.PedWrkTxtExclus.AsString;
    uDM.PedItensObservacao.AsString := uDM.PedWrkObserv.AsString;
    uDM.PedItens.Post;
    uDM.Pedwrk.Next;
  end;
  // Atualiza caixa
  uDM.LctCaixa.Last;
  wSaldo := uDM.LctCaixaSaldo.AsCurrency;
  newSeq := uDM.LctCaixaSequencia.AsInteger + 1;
  uDM.LctCaixa.Append;
  uDM.LctCaixaTurno.AsInteger      := uDM.RegCaixaTurno.AsInteger;
  uDM.LctCaixaSequencia.AsInteger  := newSeq;
  uDM.LctCaixaOperacao.AsInteger   := 1;               // Recebimento
  uDM.LctCaixaValor.AsCurrency     := uDM.PedidosValor.AsCurrency;
  uDM.LctCaixaMeioPgt.AsInteger    := uDM.PedidosMeioPagto.AsInteger;
  uDM.LctCaixaSaldo.AsCurrency     := wSaldo + uDM.PedidosValor.AsCurrency;
  uDM.LctCaixaHistorico.AsString   := 'Pedido: ' + uDM.PedidosNumero.AsString;
  uDM.LctCaixaPgtReais.AsCurrency  := uDM.PedidosVlrReais.AsCurrency;
  uDM.LctCaixaPgtCDeb.AsCurrency   := uDM.PedidosVlrCDeb.AsCurrency;
  uDM.LctCaixaPgtCCred.AsCurrency  := uDM.PedidosVlrCCred.AsCurrency;
  uDM.LctCaixaPgtPIX.AsCurrency    := uDM.PedidosVlrPIX.AsCurrency;
  uDM.LctCaixaPgtOutros.AsCurrency := uDM.PedidosVlrOutros.AsCurrency;
  uDM.LctCaixaNroPedido.AsInteger  := uDM.PedidosNumero.AsInteger;
  uDM.LctCaixaDtHrLcto.AsDateTime  := Now;
  uDM.LctCaixa.Post;
  //
  uDM.RegCaixa.Edit;
  uDM.RegCaixaE_Dinheiro.AsCurrency      := uDM.RegCaixaE_Dinheiro.AsCurrency + uDM.PedidosVlrReais.AsCurrency;
  uDM.RegCaixaE_CartaoDebito.AsCurrency  := uDM.RegCaixaE_CartaoDebito.AsCurrency + uDM.PedidosVlrCDeb.AsCurrency;
  uDM.RegCaixaE_CartaoCredito.AsCurrency := uDM.RegCaixaE_CartaoCredito.AsCurrency + uDM.PedidosVlrCCred.AsCurrency;
  uDM.RegCaixaE_PIX.AsCurrency           := uDM.RegCaixaE_PIX.AsCurrency + uDM.PedidosVlrPIX.AsCurrency;
  uDM.RegCaixaE_Outros.AsCurrency        := uDM.RegCaixaE_Outros.AsCurrency + uDM.PedidosVlrOutros.AsCurrency;
  case uDM.PedidosMeioPagto.AsInteger of
    0:uDM.RegCaixaQtd_Dinheiro.AsInteger      := uDM.RegCaixaQtd_Dinheiro.AsInteger + 1;
    1:uDM.RegCaixaQtd_CartaoDebito.AsInteger  := uDM.RegCaixaQtd_CartaoDebito.AsInteger + 1;
    2:uDM.RegCaixaQtd_CartaoCredito.AsInteger := uDM.RegCaixaQtd_CartaoCredito.AsInteger + 1;
    3:uDM.RegCaixaQtd_PIX.AsInteger           := uDM.RegCaixaQtd_PIX.AsInteger + 1;
    4:uDM.RegCaixaQtd_Outros.AsInteger        := uDM.RegCaixaQtd_Outros.AsInteger + 1;
    5:uDM.RegCaixaQtd_Misto.AsInteger         := uDM.RegCaixaQtd_Misto.AsInteger + 1;
  end;
  vlrEntradas := uDM.RegCaixaE_Dinheiro.AsCurrency + uDM.RegCaixaE_CartaoDebito.AsCurrency +
                 uDM.RegCaixaE_CartaoCredito.AsCurrency + uDM.RegCaixaE_PIX.AsCurrency +
                 uDM.RegCaixaE_Outros.AsCurrency + uDM.RegCaixaE_Suprimento.AsCurrency;
  vlrSaidas   := uDM.RegCaixaS_Saidas.AsCurrency + uDM.RegCaixaS_Sangria.AsCurrency;

  uDM.RegCaixaSaldoFinal.AsCurrency := (uDM.RegCaixaSaldoInicial.AsCurrency + vlrEntradas) - vlrSaidas;
  uDM.RegCaixa.Post;
  //
  ImprimePedido(uDM.PedidosNumero.AsInteger);
  GeraImprimeNFCe(uDM.PedidosNumero.AsInteger);
  //
  nRetorno := 0;
  FuFinPedido.Close;

end;

procedure TFuFinPedido.btRetornarClick(Sender: TObject);
begin
  uDM.Pedidos.Cancel;
  nRetorno := 1;
  FuFinPedido.Close;

end;

procedure TFuFinPedido.dbCPFEnter(Sender: TObject);
begin
    uDM.PedidosCPF_CNPJ.EditMask := '';

end;

procedure TFuFinPedido.dbCPFExit(Sender: TObject);
begin
  if uDM.PedidosCPF_CNPJ.AsString = '' then
  begin
    uDM.PedidosCPF_CNPJ.EditMask := '';
    Exit;
  end;
  if not ValidaCNPJ_CPF(uDM.PedidosCPF_CNPJ.AsString) then
  begin
    MessageDlg('CPF / CNPJ inválido, reinforme',mtError,[mbOk],0);
    dbCPF.SetFocus;
    Exit;
  end;
  uDM.PedidosCPF_CNPJ.AsString := Trim(uDM.PedidosCPF_CNPJ.AsString);
  if Length(Trim(uDM.PedidosCPF_CNPJ.AsString)) = 11
     then uDM.PedidosCPF_CNPJ.EditMask := DefineMascaraJurFis('F')
     else uDM.PedidosCPF_CNPJ.EditMask := DefineMascaraJurFis('J');

end;

procedure TFuFinPedido.dbMeioPagtoExit(Sender: TObject);
begin
  if dbMeioPagto.ItemIndex <> 5
  then begin
    uDM.PedidosVlrReais.Clear;
    uDM.PedidosVlrCDeb.Clear;
    uDM.PedidosVlrCCred.Clear;
    uDM.PedidosVlrPIX.Clear;
    uDM.PedidosVlrOutros.Clear;
  end;
  case dbMeioPagto.ItemIndex of
    0:uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
    1:uDM.PedidosVlrCDeb.AsCurrency   := FuPedidos.totalPedido;
    2:uDM.PedidosVlrCCred.AsCurrency  := FuPedidos.totalPedido;
    3:uDM.PedidosVlrPIX.AsCurrency    := FuPedidos.totalPedido;
    4:uDM.PedidosVlrOutros.AsCurrency := FuPedidos.totalPedido;
    5:begin
        //gbEspecif.Enabled := True;
        uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
      end;
  end;

end;

end.
