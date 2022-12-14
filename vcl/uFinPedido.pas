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
    PanTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    Teclado: TTouchKeyboard;
    dbSem: TDBMemo;
    dbMais: TDBMemo;
    dbMenos: TDBMemo;
    SBoxPedido: TScrollBox;
    imgPedido: TImage;
    LabTaman: TLabel;
    PanPlaca: TPanel;
    Label5: TLabel;
    dbPlaca: TDBEdit;
    PanFalta: TPanel;
    Label6: TLabel;
    LabFalta: TLabel;
    procedure btGravarClick(Sender: TObject);
    procedure btRetornarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dbCPFExit(Sender: TObject);
    procedure dbCPFEnter(Sender: TObject);
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
    procedure dbPlacaEnter(Sender: TObject);
    procedure dbPlacaExit(Sender: TObject);
    procedure dbPlacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuFinPedido: TFuFinPedido;
  nRetorno,nrPedido: Integer;
  wTop,wLeft: Integer;
  linHifen: String;
  wrkImag: TImage;
  tvLeft,tvTop: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas, uPedidos, uImpressoes;

Procedure AjustaFonteImagem;
begin
  wrkImag.Canvas.Font.Name := FuFinPedido.LabTaman.Font.Name;
  wrkImag.Canvas.Font.Size := FuFinPedido.LabTaman.Font.Size;
  wrkImag.Canvas.Font.Style := FuFinPedido.LabTaman.Font.Style;

end;


Function FinalizaPedido: Integer;
var
  qtdLin,linAux,linMax,i,tMax: Integer;
  posX,posY,posDescr,posSem,posMais,posMenos: Integer;
  xObserv: String;
  posBarra: String;
  altBarra,lrgBarra,altMaxima,lrgMaxima: Integer;
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
    posBarra := ObtemConfiguracaoTela(altBarra,lrgBarra,altMaxima,lrgMaxima);
    Width    := Trunc(lrgMaxima * 0.80);
    Height   := altMaxima;
    Top      := 0;
    if posBarra = 'T' then Top := altBarra + 1;
    Left     := (Screen.Width - Width) div 2;

  //  SBoxPedido.Align := alClient;
    SBoxPedido.VertScrollBar.Visible := True;
    imgPedido.Align := alClient;
    //
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
    uDM.PedidosVlrRecebido.AsCurrency := FuPedidos.totalPedido;
    uDM.PedidosVlrTroco.AsCurrency := 0;
    uDM.PedidosCPF_CNPJ.EditMask := '';
    uDM.PedidosTurno.AsInteger := uDM.RegCaixaTurno.AsInteger;
    //
    qtdLin := 0;
    uDM.PedWrk.First;
    while not uDM.PedWrk.Eof
    do begin
      linAux := dbSem.Lines.Count;
      if dbMais.Lines.Count > linAux
         then linAux := dbMais.Lines.Count;
      if dbMenos.Lines.Count > linAux
         then linAux := dbMenos.Lines.Count;
      qtdLin := qtdLin + 1 + linAux;
      uDM.PedWrk.Next;
    end;
    wrkImag := TImage.Create(nil);
    wrkImag.Width := SBoxPedido.Width-24;
    wrkImag.Height := (qtdLin+10)*20;
    //
    LabTaman.Font.Name := 'Tahoma';
    LabTaman.Font.Size := 12;
    LabTaman.Font.Style := [fsBold];
    AjustaFonteImagem;
    posX := 2;
    posY := 2;
    LabTaman.Caption := 'Qt';
    wrkImag.Canvas.TextOut(posX,posY,'Qt');
    posDescr := posX + LabTaman.Width + 2;
    wrkImag.Canvas.TextOut(posDescr,posY,'Descri??o');
    LabTaman.Caption := 'Total';
    wrkImag.Canvas.TextOut(wrkImag.Width-(LabTaman.Width+2),2,LabTaman.Caption);
    posX := 2;
    posY := posY + LabTaman.Height;
    wrkImag.Canvas.MoveTo(posX,posY);
    posX := wrkImag.Width-2;
    wrkImag.Canvas.LineTo(posX,posY);
    //
    uDM.PedWrk.First;
    while not uDM.PedWrk.Eof
    do begin
      posX := 2;
      posY := posY + 2;
      LabTaman.Font.Size := 11;
      LabTaman.Font.Style := [];
      AjustaFonteImagem;
      LabTaman.Caption := uDM.PedWrkQuant.AsString;
      if uDM.PedWrkQuant.AsInteger < 10 then
        LabTaman.Caption := ' ' + LabTaman.Caption;
      wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
      LabTaman.Caption := uDM.PedWrkDescricao.AsString;
      if (uDM.PedWrkTpProd.AsInteger = 3) or            // Bebidas
         (uDM.PedWrkTpProd.AsInteger = 4)               // Diversos
      then LabTaman.Caption := LabTaman.Caption + ' (' + uDM.PedWrkQuant.AsString + 'x' +
                               FloatToStrF(uDM.PedWrkVlrUnit.AsCurrency,ffNumber,6,2) + ')';
      wrkImag.Canvas.TextOut(posDescr,posY,LabTaman.Caption);
      LabTaman.Caption := FloatToStrF(uDM.PedWrkVlrTotal.AsCurrency,ffNumber,8,2);
      posX := wrkImag.Width-(LabTaman.Width+5);
      wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
      posY := posY + LabTaman.Height;
      // Prensado / Cortado
      if uDM.PedWrkCortado.AsBoolean or uDM.PedWrkPrensado.AsBoolean then
      begin
        LabTaman.Font.Size := 10;
        LabTaman.Font.Style := [fsBold];
        AjustaFonteImagem;
        posX := posDescr;
        if uDM.PedWrkPrensado.AsBoolean then
        begin
          LabTaman.Caption := 'Prensado';
          wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
          posX := posX + LabTaman.Width + 40;
        end;
        if uDM.PedWrkCortado.AsBoolean then
        begin
          LabTaman.Caption := 'Cortado';
          wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
          posX := posX + LabTaman.Width + 40;
        end;
        posY := posY + LabTaman.Height;
      end;
      // Texto SEM, MAIS e MENOS (tpProd = 1)
      if (dbSem.Lines.Count > 0) or (dbMais.Lines.Count > 0) or (dbMenos.Lines.Count > 0) then
      begin
        linMax := dbSem.Lines.Count;
        if dbMais.Lines.Count > linMax then
          linMax := dbMais.Lines.Count;
        if dbMenos.Lines.Count > linMax then
          linMax := dbMenos.Lines.Count;
        posSem := posDescr;
        posMais := posSem + 120;
        posMenos := posMais + 120 ;
        LabTaman.Font.Size := 9;
        LabTaman.Font.Style :=[fsBold,fsUnderline];
        AjustaFonteImagem;
        wrkImag.Canvas.TextOut(posSem,posY,'[ SEM ]');
        wrkImag.Canvas.TextOut(posMais,posY,'[ MAIS ]');
        wrkImag.Canvas.TextOut(posMenos,posY,'[ MENOS ]');
        posY := posY + LabTaman.Height;
        LabTaman.Font.Style :=[];
        AjustaFonteImagem;
        for i := 0 to linMax-1 do
        begin
          if i <= dbSem.Lines.Count-1 then
            wrkImag.Canvas.TextOut(posSem,posY,dbSem.Lines[i]);
          if i <= dbMais.Lines.Count-1 then
            wrkImag.Canvas.TextOut(posMais,posY,dbMais.Lines[i]);
          if i <= dbMenos.Lines.Count-1 then
            wrkImag.Canvas.TextOut(posMenos,posY,dbMenos.Lines[i]);
          posY := posY + LabTaman.Height;
        end;
      end;
      // Observa??o
      if uDM.PedWrkObserv.AsString <> '' then
      begin
        LabTaman.Font.Size := 9;
        LabTaman.Font.Style := [fsBold];
        LabTaman.Caption := 'Obs';
        AjustaFonteImagem;
        posX := 5;
        wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
        posX := posX + LabTaman.Width + 4;
        LabTaman.Font.Style := [];
        AjustaFonteImagem;
        tMax := wrkImag.Width - (posX + 20);
        xObserv := Trim(uDM.PedWrkObserv.AsString);
        LabTaman.Caption := '';
        for i := 1 to Length(xObserv) do
        begin
          LabTaman.Caption := LabTaman.Caption + xObserv[i];
          if LabTaman.Width >= tMax then
          begin
            wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
            LabTaman.Caption := '';
            posY := posY + LabTaman.Height;
          end;
        end;
        if LabTaman.Caption <> '' then
        begin
          wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
          posY := posY + LabTaman.Height;
        end;
      end;
      //
      posX := 2;
      wrkImag.Canvas.MoveTo(posX,posY);
      posX := wrkImag.Width-2;
      wrkImag.Canvas.LineTo(posX,posY);
      uDM.PedWrk.Next;
    end;

    LabTaman.Font.Size := 12;
    LabTaman.Font.Style := [fsBold];
    AjustaFonteImagem;
    wrkImag.Canvas.MoveTo(2,posY);
    wrkImag.Canvas.LineTo(wrkImag.Width-2,posY);

    posX := 20;
    posY := posY + 2;
    LabTaman.Caption := IntToStr(FuPedidos.itensPedido) + ' ?tens';
    wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
    LabTaman.Caption := 'Total  R$ '+ FloatToStrF(FuPedidos.totalPedido,ffNumber,15,2);
    posX := wrkImag.Width-(LabTaman.Width+5);
    wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
    posY := posY + LabTaman.Height;
    wrkImag.Canvas.MoveTo(2,posY);
    wrkImag.Canvas.LineTo(wrkImag.Width-2,posY);
    imgPedido.Picture.Assign(wrkImag.Picture);
    wrkImag.Free;
    nRetorno := 1;
    ShowModal;
    // nRetorno 0:Ok, 1:Tela anterior, 2:Cancelado
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
      Teclado.Width   := 300;
      Teclado.Height  := 300;
    end
    else begin
      Teclado.Width   := 860;
      Teclado.Height  := 300;
    end;
    Teclado.Top     := pTop;
    Teclado.Left    := pLeft;
    Teclado.Visible := True;
  end;

end;

Procedure ExibeValorFaltante;
var vlrFalta: Currency;
begin
  vlrFalta := FuPedidos.totalPedido - (uDM.PedidosVlrReais.AsCurrency + uDM.PedidosVlrCDeb.AsCurrency +
                                       uDM.PedidosVlrCCred.AsCurrency + uDM.PedidosVlrPIX.AsCurrency +
                                       uDM.PedidosVlrOutros.AsCurrency);
  FuFinPedido.LabFalta.Caption := FloatToStrF(vlrFalta,ffNumber,15,2);
  if vlrFalta < 0 then
    FuFinPedido.PanFalta.Color := clRed
  else
    FuFinPedido.PanFalta.color := clYellow;

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
    xImpressao: String;
begin
  if uDM.PedidosMeioPagto.AsInteger = 0 then   // Dinheiro
    if uDM.PedidosVlrRecebido.AsCurrency < uDM.PedidosValor.AsCurrency then
    begin
      MessageDlg('Valor recebido insuficiente, menor que total do pedido',mtError,[mbOk],0);
      edReceb.SetFocus;
      Exit;
    end;
  somaVlr := uDM.PedidosVlrReais.AsCurrency + uDM.PedidosVlrCDeb.AsCurrency +
             uDM.PedidosVlrCCred.AsCurrency + uDM.PedidosVlrPIX.AsCurrency +
             uDM.PedidosVlrOutros.AsCurrency;
  if uDM.PedidosValor.AsCurrency <> somaVlr then
  begin
    MessageDlg('Somat?rio dos valores difere do total do pedido',mtError,[mbOk],0);
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
  xImpressao := ObtemParametro('PedidoImprimir');
  if Pos(xImpressao,'SNQ') = 0 then xImpressao := 'Q';       // Sim  N?o  Questiona
  if xImpressao = 'Q' then
    if MessageDlg('Imprimir pedido ?',mtConfirmation,[mbYes,mbNo],0,mbNo) = mrYes then
      xImpressao := 'S'
    else
      xImpressao := 'N';
  if xImpressao = 'S' then
    ImprimePedido(uDM.PedidosNumero.AsInteger);
  //
  nRetorno := 0;
  // NFCe: (S)im  (N)ao
  if ObtemParametro('NFCe_Imprimir') = 'S' then
  begin
    case uDM.PedidosMeioPagto.AsInteger of
      0:xImpressao := ObtemParametro('NFCe_Reais');        // Pagto em Reais
      1:xImpressao := ObtemParametro('NFCe_CDebito');      // Pagto Cartao de d?bito
      2:xImpressao := ObtemParametro('NFCe_CCredito');     // Pagto Cartao de cr?dito
      3:xImpressao := ObtemParametro('NFCe_PIX');          // Pagto PIX
      4:xImpressao := ObtemParametro('NFCe_Outros');       // Pagto Outros
      5:xImpressao := ObtemParametro('NFCe_Misto');        // Pagto Misto
    end;
    if Pos(xImpressao,'SNQ') = 0  then xImpressao := 'Q';
    if xImpressao = 'Q' then
      if MessageDlg('Gera??o / Emiss?o de NFCe' + #13 +
                    'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                    'Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                    'Meio pagamento: ' + uDM.PedidosZC_MPExtenso.AsString,
                    mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','N?o']) = mrYes
        then xImpressao := 'S';
    if xImpressao = 'S' then
       GeraImprimeNFCe(uDM.PedidosNumero.AsInteger);
  end;
  //
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
  tvLeft := PanInform.Left + dbCPF.Left + dbCPF.Width + 8;
  tvTop := PanInform.Top + PanCliente.Top + dbNome.Top + dbNome.Height + 4;     // Mesma altura do nome
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

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
    MessageDlg('CPF / CNPJ inv?lido, reinforme',mtError,[mbOk],0);
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
  LabFalta.Caption := '';
  PanFalta.Visible := False;

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
  uDM.PedidosMeioPagto.AsInteger := dbMeioPagto.ItemIndex;
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
        PanFalta.Visible := True;
        ExibeValorFaltante;
        edReais.Enabled  := True;
        edCDeb.Enabled   := True;
        edCCred.Enabled  := True;
        edPIX.Enabled    := True;
        edOutros.Enabled := True;
        edReais.SetFocus;
      end;
  end;

end;

procedure TFuFinPedido.dbNomeEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left - 400;
  tvTop := PanInform.Top + PanCliente.Top + dbNome.Top + dbNome.Height + 4;
  ExibeTecladoVirtual('Standard',tvTop,tvLeft);

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

procedure TFuFinPedido.dbPlacaEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + dbPlaca.Left - 8;
  tvTop := PanInform.Top + PanPlaca.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.dbPlacaExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuFinPedido.dbPlacaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edCCredEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + PanDetPgto.Left + 20;
  tvTop := PanInform.Top + PanPlaca.Height + edCCred.Top + edCCred.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.edCCredExit(Sender: TObject);
begin
  Teclado.Visible := False;
  ExibeValorFaltante;

end;

procedure TFuFinPedido.edCCredKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edCDebEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + PanDetPgto.Left + 20;
  tvTop := PanInform.Top + PanPlaca.Height + edCDeb.Top + edCDeb.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.edCDebExit(Sender: TObject);
begin
  Teclado.Visible := False;
  ExibeValorFaltante;

end;

procedure TFuFinPedido.edCDebKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edOutrosEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + PanDetPgto.Left + 20;
  tvTop := PanInform.Top + PanPlaca.Height + edOutros.Top + edOutros.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.edOutrosExit(Sender: TObject);
begin
  Teclado.Visible := False;
  ExibeValorFaltante;

end;

procedure TFuFinPedido.edOutrosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edPIXEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + PanDetPgto.Left + 20;
  tvTop := PanInform.Top + PanPlaca.Height + edPIX.Top + edPIX.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.edPIXExit(Sender: TObject);
begin
  Teclado.Visible := False;
  ExibeValorFaltante;

end;

procedure TFuFinPedido.edPIXKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edReaisEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + PanDetPgto.Left + 20;
  tvTop := PanInform.Top + PanPlaca.Height + edReais.Top + edReais.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.edReaisExit(Sender: TObject);
begin
  Teclado.Visible := False;
  ExibeValorFaltante;

end;

procedure TFuFinPedido.edReaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuFinPedido.edRecebEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + PanDetPgto.Left + 20;
  tvTop := PanInform.Top + PanPlaca.Height + edReceb.Top + edReceb.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.edRecebExit(Sender: TObject);
begin
  Teclado.Visible := False;
  if uDM.PedidosVlrRecebido.AsCurrency > 0 then
  begin
     if uDM.PedidosVlrRecebido.AsCurrency < uDM.PedidosValor.AsCurrency then
     begin
       MessageDlg('Valor recebido insuficiente, reinforme',mtError,[mbOk],0);
      edReceb.SetFocus;
      Exit;
    end;
    uDM.PedidosVlrTroco.AsCurrency := uDM.PedidosVlrRecebido.AsCurrency - uDM.PedidosValor.AsCurrency;
  end;

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
  SBoxPedido.Align := alLeft;
  PanInform.Align := alClient;

end;

procedure TFuFinPedido.FormShow(Sender: TObject);
begin
  dbPlaca.SetFocus;

end;

end.
