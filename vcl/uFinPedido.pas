unit uFinPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.UITypes, Vcl.Touch.Keyboard;
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
    LabCCred: TLabel;
    LabPix: TLabel;
    LabOutros: TLabel;
    edReais: TDBEdit;
    edCDeb: TDBEdit;
    edCCred: TDBEdit;
    edPIX: TDBEdit;
    edOutros: TDBEdit;
    dbMeioPagto: TDBRadioGroup;
    Label10: TLabel;
    edReceb: TDBEdit;
    LabReceb: TLabel;
    edTroco: TDBEdit;
    LabTroco: TLabel;
    edMeioPgto: TDBEdit;
    Teclado: TTouchKeyboard;
    procedure btGravarClick(Sender: TObject);
    procedure btRetornarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dbCPFExit(Sender: TObject);
    procedure dbCPFEnter(Sender: TObject);
    procedure edMeioPgtoChange(Sender: TObject);
    procedure dbMeioPagtoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRecebExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edRecebEnter(Sender: TObject);
    procedure edRecebKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edReaisEnter(Sender: TObject);
    procedure edReaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edReaisExit(Sender: TObject);
    procedure edCDebEnter(Sender: TObject);
    procedure edCCredEnter(Sender: TObject);
    procedure edPIXEnter(Sender: TObject);
    procedure edOutrosEnter(Sender: TObject);
    procedure edCDebKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCCredKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPIXKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edOutrosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCDebExit(Sender: TObject);
    procedure edCCredExit(Sender: TObject);
    procedure edPIXExit(Sender: TObject);
    procedure edOutrosExit(Sender: TObject);
    procedure dbNomeEnter(Sender: TObject);
    procedure dbNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbNomeExit(Sender: TObject);
    procedure MudaPontoVirgula(Sender: TObject; var Key: Char);
    procedure dbMeioPagtoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuFinPedido: TFuFinPedido;
  nRetorno,nrPedido: Integer;
  wTop,wLeft: Integer;

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
    if uDM.SisPessoaTecladoVirtual.AsBoolean then
    begin
      btGravar.Caption   := 'Gravar && imprimir';
      btCancelar.Caption := 'Cancelar pedido';
      btRetornar.Caption := 'Tela anterior';
    end
    else begin
      btGravar.Caption   := '&Gravar && imprimir';
      btCancelar.Caption := '&Cancelar pedido';
      btRetornar.Caption := '&Tela anterior';
    end;
    Width    := Trunc(Screen.Width * 0.70);
    Left     := (Screen.Width - Width) div 2;
    Height   := Trunc(Screen.Height * 0.80);
    Top      := (Screen.Height - Height) div 2;
    linHifen := stringFiller('-',70);
    LabTaman.Font.Name  := 'Lucida Console';
    LabTaman.Font.Size  := 8;
    LabTaman.Caption    := linHifen;
    PanTexto.Width      := LabTaman.Width + 32;
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
    uDM.PedidosEtqImpressas.AsInteger := 0;
    uDM.PedidosNomeCliente.Clear;
    uDM.PedidosVlrRecebido.Clear;
    uDM.PedidosVlrTroco.Clear;
    uDM.PedidosCPF_CNPJ.EditMask := '';
    uDM.PedidosTurno.AsInteger := uDM.RegCaixaTurno.AsInteger;
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
      // Cortado / Prensado
      wTxtAux := '';
      if uDM.PedWrkCortado.AsBoolean then wTxtAux := '<<  CORTAR  >>     ';
      if uDM.PedWrkPrensado.AsBoolean then wTxtAux := wTxtAux + '<<  PRENSAR  >>';
      if wTxtAux <> ''
      then begin
        strItem.Add(stringCompleta(wTxtAux,'C',' ',60));
        strItem.Add(' ');
      end;
      // Texto SEM
      if uDM.PedWrkTxtSem.AsString <> '' then
      begin
        wTxtAux := '< SEM > ' + uDM.PedWrkTxtSem.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add(Copy(wTxtAux,1,56));
          wTxtAux := '    ' + Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add(wTxtAux);
        strItem.Add(' ');
      end;
      // MAIS
      if uDM.PedWrkTxtMais.AsString <> '' then
      begin
        wTxtAux := '< MAIS > ' + uDM.PedWrkTxtMais.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add(Copy(wTxtAux,1,56));
          wTxtAux := '    ' + Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add(wTxtAux);
        strItem.Add(' ');
      end;
      // Menos
      if uDM.PedWrkTxtMenos.AsString <> '' then
      begin
        wTxtAux := '< MENOS > ' + uDM.PedWrkTxtMenos.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add(Copy(wTxtAux,1,56));
          wTxtAux := '    ' + Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add(wTxtAux);
        strItem.Add(' ');
      end;
      // Observações
      if uDM.PedWrkObserv.AsString <> '' then
      begin
        wTxtAux := '< OBS > ' + uDM.PedWrkObserv.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add(Copy(wTxtAux,1,56));
          wTxtAux := '    ' + Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add(wTxtAux);
        strItem.Add(' ');
      end;
      //
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
    Result := nRetorno;

  end;

end;


Procedure ExibeTecladoVirtual(pTipo:String; pTop,pLeft:Integer);
begin
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  with FuFinPedido
  do begin
    Teclado.Layout  := pTipo;
    if pTipo = 'NumPad' then
    begin
      Teclado.Width   := 180;
      Teclado.Height  := 180;
    end
    else begin
      Teclado.Width   := 560;
      Teclado.Height  := 180;
    end;
    Teclado.Top     := pTop;
    Teclado.Left    := pLeft;
    Teclado.Visible := True;
  end;

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
    uDM.PedItensNumero.AsInteger       := nrPedido;
    uDM.PedItensNrLcto.AsInteger       := uDM.PedWrkNrLcto.AsInteger;
    uDM.PedItensTpProd.AsInteger       := uDM.PedWrkTpProd.AsInteger;
    uDM.PedItensCodProd.AsInteger      := uDM.PedWrkCodProd.AsInteger;
    uDM.PedItensQuant.AsInteger        := uDM.PedWrkQuant.AsInteger;
    uDM.PedItensVlrUnitario.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency;
    uDM.PedItensCod01.AsInteger        := uDM.PedWrkCod01.AsInteger;
    uDM.PedItensVlr01.AsCurrency       := uDM.PedWrkVlr01.AsCurrency;
    uDM.PedItensCod02.AsInteger        := uDM.PedWrkCod02.AsInteger;
    uDM.PedItensVlr02.AsCurrency       := uDM.PedWrkVlr02.AsCurrency;
    uDM.PedItensCod03.AsInteger        := uDM.PedWrkCod03.AsInteger;
    uDM.PedItensVlr03.AsCurrency       := uDM.PedWrkVlr03.AsCurrency;
    uDM.PedItensVlrTotal.AsCurrency    := uDM.PedWrkVlrTotal.AsCurrency;
    uDM.PedItensExtras.AsString        := uDM.PedWrkExtras.AsString;
    uDM.PedItensTxtSem.AsString        := uDM.PedWrkTxtSem.AsString;
    uDM.PedItensTxtMais.AsString       := uDM.PedWrkTxtMais.AsString;
    uDM.PedItensTxtMenos.AsString      := uDM.PedWrkTxtMenos.AsString;
    uDM.PedItensObservacao.AsString    := uDM.PedWrkObserv.AsString;
    uDM.PedItensEtqImpressa.AsInteger  := 0;
    uDM.PedItensVlrUnFiscal.AsCurrency := uDM.PedWrkVlrTotal.AsCurrency / uDM.PedWrkQuant.AsInteger;
    uDM.PedItensTurno.AsInteger        := uDM.RegCaixaTurno.AsInteger;
    if uDM.PedWrkAltPreco.AsBoolean
       then uDM.PedItensAlteraPreco.AsInteger := 1
       else uDM.PedItensAlteraPreco.AsInteger := 0;
    if uDM.PedWrkCortado.AsBoolean
       then uDM.PedItensCortado.AsInteger := 1
       else uDM.PedItensCortado.AsInteger := 0;
    if uDM.PedWrkPrensado.AsBoolean
       then uDM.PedItensPrensado.AsInteger := 1
       else uDM.PedItensPrensado.AsInteger := 0;
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
  uDM.LctCaixaTipo.AsString        := 'A';
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
  ExibeTecladoVirtual('NumPad',PanInform.Top+PanCliente.Top+dbCPF.Top+dbCPF.Height+4,FuFinPedido.ClientWidth-212);
  uDM.PedidosCPF_CNPJ.EditMask := '';

end;

procedure TFuFinPedido.dbCPFExit(Sender: TObject);
begin
  Teclado.Visible := False;
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

procedure TFuFinPedido.dbCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.dbMeioPagtoClick(Sender: TObject);
begin
  edReais.Enabled  := False;
  edReceb.Visible  := False;
  LabReceb.Visible := False;
  edTroco.Visible  := False;
  LabTroco.Visible := False;
  edCDeb.Enabled   := False;
  edCCred.Enabled  := False;
  edPIX.Enabled    := False;
  edOutros.Enabled := False;

  uDM.PedidosVlrReais.Clear;
  uDM.PedidosVlrCDeb.Clear;
  uDM.PedidosVlrCCred.Clear;
  uDM.PedidosVlrPIX.Clear;
  uDM.PedidosVlrOutros.Clear;
  //ShowMessage('1 ' + uDM.PedidosMeioPagto.AsString + '  Index=' + IntToStr(dbMeioPagto.ItemIndex));
  uDM.PedidosMeioPagto.AsInteger := dbMeioPagto.ItemIndex;
  //ShowMessage('2 ' + uDM.PedidosMeioPagto.AsString + '  Index=' + IntToStr(dbMeioPagto.ItemIndex));
  case dbMeioPagto.ItemIndex of
    0:begin
        uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
        if uDM.PedidosVlrRecebido.AsCurrency = 0 then
           uDM.PedidosVlrRecebido.AsCurrency := FuPedidos.totalPedido;
        uDM.PedidosVlrTroco.AsCurrency := uDM.PedidosVlrRecebido.AsCurrency - uDM.PedidosVlrReais.AsCurrency;
      edReceb.Visible  := True;
      LabReceb.Visible := True;
      edTroco.Visible  := True;
      LabTroco.Visible := True;
      edReceb.SetFocus;
    end;
    1:uDM.PedidosVlrCDeb.AsCurrency   := FuPedidos.totalPedido;
    2:uDM.PedidosVlrCCred.AsCurrency  := FuPedidos.totalPedido;
    3:uDM.PedidosVlrPIX.AsCurrency    := FuPedidos.totalPedido;
    4:uDM.PedidosVlrOutros.AsCurrency := FuPedidos.totalPedido;
    5:begin
        uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
        edReais.Enabled  := True;
        edCDeb.Enabled   := True;
        edCCred.Enabled  := True;
        edPIX.Enabled    := True;
        edOutros.Enabled := True;
        edReais.SetFocus;
      end;
  end;

end;

procedure TFuFinPedido.dbMeioPagtoExit(Sender: TObject);
begin
{
  edReais.Enabled  := False;
  edReceb.Visible  := False;
  LabReceb.Visible := False;
  edTroco.Visible  := False;
  LabTroco.Visible := False;
  edCDeb.Enabled   := False;
  edCCred.Enabled  := False;
  edPIX.Enabled    := False;
  edOutros.Enabled := False;

  uDM.PedidosVlrReais.Clear;
  uDM.PedidosVlrCDeb.Clear;
  uDM.PedidosVlrCCred.Clear;
  uDM.PedidosVlrPIX.Clear;
  uDM.PedidosVlrOutros.Clear;
  case dbMeioPagto.ItemIndex of
    0:begin
        uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
        if uDM.PedidosVlrRecebido.AsCurrency = 0 then
           uDM.PedidosVlrRecebido.AsCurrency := FuPedidos.totalPedido;
        uDM.PedidosVlrTroco.AsCurrency := uDM.PedidosVlrRecebido.AsCurrency - uDM.PedidosVlrReais.AsCurrency;
      edReceb.Visible  := True;
      LabReceb.Visible := True;
      edTroco.Visible  := True;
      LabTroco.Visible := True;
      edReceb.SetFocus;
    end;
    1:uDM.PedidosVlrCDeb.AsCurrency   := FuPedidos.totalPedido;
    2:uDM.PedidosVlrCCred.AsCurrency  := FuPedidos.totalPedido;
    3:uDM.PedidosVlrPIX.AsCurrency    := FuPedidos.totalPedido;
    4:uDM.PedidosVlrOutros.AsCurrency := FuPedidos.totalPedido;
    5:begin
        uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
        edReais.Enabled  := True;
        edCDeb.Enabled   := True;
        edCCred.Enabled  := True;
        edPIX.Enabled    := True;
        edOutros.Enabled := True;
        edReais.SetFocus;
      end;
  end;
}
end;

procedure TFuFinPedido.dbNomeEnter(Sender: TObject);
begin
  ExibeTecladoVirtual('Standard',PanInform.Top+PanCliente.Top+dbNome.Top+dbNome.Height+4,FuFinPedido.ClientWidth-600);

end;

procedure TFuFinPedido.dbNomeExit(Sender: TObject);
begin
  Teclado.Visible := False;
  dbCPF.SetFocus;

end;

procedure TFuFinPedido.dbNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edCCredEnter(Sender: TObject);
begin
  ExibeTecladoVirtual('NumPad',PanInform.Top+edCCred.Top+edCCred.Height+4,FuFinPedido.ClientWidth-212);

end;

procedure TFuFinPedido.edCCredExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuFinPedido.edCCredKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edCDebEnter(Sender: TObject);
begin
  ExibeTecladoVirtual('NumPad',PanInform.Top+edCDeb.Top+edCDeb.Height+4,FuFinPedido.ClientWidth-212);

end;

procedure TFuFinPedido.edCDebExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuFinPedido.edCDebKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edMeioPgtoChange(Sender: TObject);
begin
{
  edReais.Enabled  := False;
  LabReais.Enabled := False;
  edReceb.Enabled  := False;
  LabReceb.Enabled := False;
  edTroco.Enabled  := False;
  LabTroco.Enabled := False;
  edCDeb.Enabled   := False;
  LabCDeb.Enabled  := False;
  edCCred.Enabled  := False;
  LabCCred.Enabled := False;
  edPIX.Enabled    := False;
  LabPix.Enabled   := False;
  edOutros.Enabled := False;
  LabOutros.Enabled := False;

  case uDM.PedidosMeioPagto.AsInteger of
    0:begin   // Reais
        LabReais.Enabled := True;
        edReais.Enabled  := True;
        LabReceb.Enabled := True;
        edReceb.Enabled  := True;
        LabTroco.Enabled := True;
        edTroco.Enabled  := True;
    end;
    1:begin   // Cartão de débito
        LabCDeb.Enabled  := True;
        edCDeb.Enabled   := True;
    end;
    2:begin   // Cartão de crébito
        LabCCred.Enabled := True;
        edCCred.Enabled  := True;
    end;
    3:begin   // PIX
        LabPIX.Enabled   := True;
        edPIX.Enabled    := True;
    end;
    4:begin   // Outros
        LabOutros.Enabled := True;
        edOutros.Enabled := True;
    end;
    6:begin                          // Misto (+ de uma forma)
      edReais.Enabled  := True;
      LabReais.Enabled := True;
      edReceb.Enabled  := True;
      LabReceb.Enabled := True;
      edTroco.Enabled  := True;
      LabTroco.Enabled := True;
      edCDeb.Enabled   := True;
      LabCDeb.Enabled  := True;
      edCCred.Enabled  := True;
      LabCCred.Enabled := True;
      edPIX.Enabled    := True;
      LabPix.Enabled   := True;
      edOutros.Enabled := True;
      LabOutros.Enabled := True;
    end;
  end;
}

end;

procedure TFuFinPedido.edOutrosEnter(Sender: TObject);
begin
  ExibeTecladoVirtual('NumPad',PanInform.Top+edOutros.Top+edOutros.Height+4,FuFinPedido.ClientWidth-212);

end;

procedure TFuFinPedido.edOutrosExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuFinPedido.edOutrosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edPIXEnter(Sender: TObject);
begin
  ExibeTecladoVirtual('NumPad',PanInform.Top+edPIX.Top+edPIX.Height+4,FuFinPedido.ClientWidth-212);

end;

procedure TFuFinPedido.edPIXExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuFinPedido.edPIXKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edReaisEnter(Sender: TObject);
begin
  ExibeTecladoVirtual('NumPad',PanInform.Top+edReais.Top+edReais.Height+4,FuFinPedido.ClientWidth-212);

end;

procedure TFuFinPedido.edReaisExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuFinPedido.edReaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edRecebEnter(Sender: TObject);
begin
  ExibeTecladoVirtual('NumPad',PanInform.Top+edReceb.Top+edReceb.Height+4,FuFinPedido.ClientWidth-212);

end;

procedure TFuFinPedido.edRecebExit(Sender: TObject);
begin
  if uDM.PedidosVlrRecebido.AsCurrency < uDM.PedidosValor.AsCurrency then
  begin
    MessageDlg('Valor recebido insuficiente, reinforme',mtError,[mbOk],0);
    edReceb.SetFocus;
    Exit;
  end;
  uDM.PedidosVlrTroco.AsCurrency := uDM.PedidosVlrRecebido.AsCurrency - uDM.PedidosValor.AsCurrency;
  Teclado.Visible := False;

end;

procedure TFuFinPedido.edRecebKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.MudaPontoVirgula(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ',';
end;

procedure TFuFinPedido.FormCreate(Sender: TObject);
begin
  Teclado.Visible := False;
  PanTexto.Align := alLeft;
  PanInform.Align := alClient;

end;

procedure TFuFinPedido.FormShow(Sender: TObject);
begin
  dbMeioPagto.SetFocus;

end;

end.
