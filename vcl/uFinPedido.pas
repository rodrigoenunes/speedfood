unit uFinPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.UITypes, Vcl.Touch.Keyboard, Data.DB;
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
    cbImprimeNFCe: TCheckBox;
    PanAguarde: TPanel;
    Label7: TLabel;
    LabInstrucao: TLabel;
    TimerMsgPinpad: TTimer;
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
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbMeioPagtoExit(Sender: TObject);
    procedure TimerMsgPinpadTimer(Sender: TObject);
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

uses uDados, uGenericas, uPedidos, uImpressoes, SFEuPrintFortes, uPagtoMisto;

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
    cbImprimeNFCe.Checked := False;
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
    Width    := 920;
    if Trunc(lrgMaxima * 0.80) < 920 then
       Width := Trunc(lrgMaxima * 0.80);
    Height   := altMaxima;
    Top      := 0;
    if posBarra = 'T' then Top := altBarra + 1;
    Left     := (Screen.Width - Width) div 2;

    //SBoxPedido.Align := alClient;
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
    uDM.PedidosTurno.AsInteger := uDM.turnoCorrente;
    uDM.PedidosPlaca.AsString := uDM.nroPlaca;
    uDM.PedidosMeioPagto.AsInteger := uDM.meioPgto;
    uDM.PedidosNomeCliente.AsString := uDM.nomeClie;
    uDM.PedidosCPF_CNPJ.AsString := uDM.CPFCNPJ;
    uDM.PedidosSitPagto.AsInteger := 0;                  // NÃO PAGO
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
    wrkImag.Canvas.TextOut(posDescr,posY,'Descrição');
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
      if uDM.PedWrkTpProd.AsInteger = 3              // Bebidas ou Diversos (6)
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
        posMais := posDescr;
        posSem := posMais + 120;
        posMenos := posSem + 120 ;
        LabTaman.Font.Size := 9;
        LabTaman.Font.Style :=[fsBold,fsUnderline];
        AjustaFonteImagem;
        if uDM.PedWrkTpProd.AsInteger = 1 then
        begin
          wrkImag.Canvas.TextOut(posMais,posY,'[ + MAIS ]');
          wrkImag.Canvas.TextOut(posSem,posY,'[ SEM ]');
          wrkImag.Canvas.TextOut(posMenos,posY,'[ - MENOS ]');
        end
        else wrkImag.Canvas.TextOut(posMais,posY,'[ + INCLUIR ]');
        posY := posY + LabTaman.Height;
        LabTaman.Font.Style :=[];
        AjustaFonteImagem;
        for i := 0 to linMax-1 do
        begin
          if i <= dbMais.Lines.Count-1 then
            wrkImag.Canvas.TextOut(posMais,posY,dbMais.Lines[i]);
          if i <= dbSem.Lines.Count-1 then
            wrkImag.Canvas.TextOut(posSem,posY,dbSem.Lines[i]);
          if i <= dbMenos.Lines.Count-1 then
            wrkImag.Canvas.TextOut(posMenos,posY,dbMenos.Lines[i]);
          posY := posY + LabTaman.Height;
        end;
      end;
      // Observação
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

//    LabTaman.Font.Size := 12;
//    LabTaman.Font.Style := [fsBold];
    AjustaFonteImagem;
    wrkImag.Canvas.MoveTo(2,posY);
    wrkImag.Canvas.LineTo(wrkImag.Width-2,posY);

    LabTaman.Font.Size := 12;
    LabTaman.Font.Style := [fsBold];
    AjustaFonteImagem;
    posX := 20;
    posY := posY + 12;
    LabTaman.Caption := IntToStr(FuPedidos.itensPedido) + ' ítens';
    wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);

    LabTaman.Font.Size := 20;
    AjustaFonteImagem;
    posY := posY + 20;
    LabTaman.Caption := 'Total  R$ '+ FloatToStrF(FuPedidos.totalPedido,ffNumber,15,2);
    posX := (wrkImag.Width - LabTaman.Width) div 2;    // (LabTaman.Width+5);
    wrkImag.Canvas.TextOut(posX,posY,LabTaman.Caption);
    posY := posY + LabTaman.Height;

    LabTaman.Font.Size := 12;
    AjustaFonteImagem;
    //posY := posY + LabTaman.Height;
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
  if MessageDlg('Cancelar pedido ?',mtConfirmation,
                [mbYes,mbNo],0,mbNo,['Sim','Não']) <> mrYes then Exit;
  uDM.Pedidos.Cancel;
  nRetorno := 2;
  FuFinPedido.Close;

end;

procedure TFuFinPedido.btGravarClick(Sender: TObject);
var somaVlr,wSaldo: Currency;
    newSeq,lanSeq,bebSeq,newSitPagto,i,wrkSeq: Integer;
    vlrEntradas,vlrSaidas: Currency;
    xEmitirNFCe,xImpressao: String;
    wMsg: String;
    wStatus,wAtivarMsg: Boolean;

begin
  if ObtemParametro('PedidoPlaca') = 'S' then
     if StrToIntDef(uDM.PedidosPlaca.AsString,0) = 0 then
     begin
       MessageDlg('Nro de placa não informado, dado obrigatorio',mtError,[mbOk],0);
       dbPlaca.SetFocus;
       Exit;
     end;
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
    MessageDlg('Somatório dos valores difere do total do pedido',mtError,[mbOk],0);
    dbMeioPagto.SetFocus;
    Exit;
  end;
  //
  cbImprimeNFCe.Enabled := False;
  btGravar.Enabled := False;
  btCancelar.Enabled := False;
  btRetornar.Enabled := False;
  LabInstrucao.Caption := 'Aguarde o final do processo';   // R$(*0) ou Outros(4)
  wAtivarMsg := False;
  if (uDM.PedidosMeioPagto.AsInteger = 1) or            // Débito
     (uDM.PedidosMeioPagto.AsInteger = 2) or            // Credito
     (uDM.PedidosMeioPagto.AsInteger = 3) or            // PIX        (09/01/24)
     (uDM.PedidosMeioPagto.AsInteger = 5)               // Misto
  then begin
    LabInstrucao.Caption := 'Siga as instruções do PINPAD !!!';
    wAtivarMsg := True;
  end;
  PanAguarde.Color := clHighlight;
  PanAguarde.Visible := True;
  Application.ProcessMessages;
  //
  lanSeq := 0;     // Qtd de lanches no pedido
  bebSeq := 0;     // Qtd de bebidas e outros no pedido
  uDM.PedWrk.First;
  while not uDM.PedWrk.Eof do
  begin
    case uDM.PedWrkTpProd.AsInteger of
      1,4:lanSeq := lanSeq + 1;
        2:bebSeq := bebSeq + 1;
    end;
    uDM.PedWrk.Next;
  end;
  uDM.PedidosLctLanches.AsInteger := lanSeq;     // Qtd de lanches no pedido
  uDM.PedidosLctBebidas.AsInteger := bebSeq;     // Qtd de bebidas no pedido
  uDM.Pedidos.Post;
  //
  uDM.PedWrk.First;
  lanSeq := 0;
  bebSeq := 100;
  newSeq := 200;
  while not uDM.PedWrk.Eof do
  begin
    case uDM.PedWrkTpProd.AsInteger of
      1,4:begin     // Lanches
            lanSeq := lanSeq + 1;
            wrkSeq := lanSeq;
          end;
        3:begin     // Bebidas e outros
            bebSeq := bebSeq + 1;
            wrkSeq := bebSeq;
        end;
        else begin  // Extras
            newSeq := newSeq + 1;
            wrkSeq := newSeq;
        end;
    end;
    uDM.PedItens.Append;
    uDM.PedItensNumero.AsInteger       := nrPedido;
    uDM.PedItensNrLcto.AsInteger       := wrkSeq;
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
    uDM.PedWrk.Next;
  end;
  // Pagtos  (detpagWRK)
  if uDM.DetpagWrk.RecordCount > 0 then
  begin         // Grava 'n' registros Detpag partindo de detpagWRK (Somente se for pagto MISTO)
    uDM.DetpagWrk.First;
    newSeq := 0;
    while not uDM.DetpagWrk.eof do
    begin
      newSeq := newSeq + 1;
      uDM.PedDetpag.Append;
      uDM.PedDetpagNumero.AsInteger := uDM.PedidosNumero.AsInteger;
      uDM.PedDetpagSeq.AsInteger    := newSeq;
      uDM.PedDetpagindPag.AsInteger := 0;      // Sempre 0 (A vista) (1-Prazo)
      uDM.PedDetpagtPag.AsString    := uDM.DetpagWrktPag.AsString;
      uDM.PedDetpagValor.AsCurrency := uDM.DetpagWrkValor.AsCurrency;
      if (uDM.DetpagWrktPag.AsString = '03')         // Cartao crédito
         or (uDM.DetpagWrktPag.AsString = '04')      // Cartao debito
         or (uDM.DetpagWrktPag.AsString = '17')      // PIX
         then uDM.PedDetpagtpIntegra.AsInteger := uDM.SisPessoaTefPos.AsInteger
         else uDM.PedDetpagtpIntegra.AsInteger := 2;
      uDM.PedDetpag.Post;
      uDM.DetpagWrk.Next;
    end;
    uDM.DetpagWrk.EmptyDataSet;
  end
  else begin    // Grava 1 registro detpag   (não há registros em detpagWRK)
    uDM.PedDetpag.Append;
    uDM.PedDetpagNumero.AsInteger    := uDM.PedidosNumero.AsInteger;
    uDM.PedDetpagSeq.AsInteger       := 1;
    uDM.PedDetpagindPag.AsInteger    := 0;      // Sempre 0 (A vista) (1-Prazo)
    uDM.PedDetpagtpIntegra.AsInteger := uDM.SisPessoaTefPos.AsInteger;     // 09/01/24
    if uDM.PedidosVlrReais.AsCurrency > 0 then
    begin
      uDM.PedDetpagtPag.AsString := '01';       // Reais
      uDM.PedDetpagValor.AsCurrency := uDM.PedidosVlrReais.AsCurrency;
      uDM.PedDetpagvTroco.AsCurrency := uDM.PedidosVlrTroco.AsCurrency;
      uDM.PedDetpagtpIntegra.AsInteger := 2;    // Não integrado
    end
    else begin
      if uDM.PedidosVlrCCred.AsCurrency > 0 then
      begin
        uDM.PedDetpagValor.AsCurrency := uDM.PedidosVlrCCred.AsCurrency;
        uDM.PedDetpagtPag.AsString := '03';
        uDM.PedDetpagtpIntegra.AsInteger := uDM.SisPessoaTefPos.ASInteger;
      end;
      if uDM.PedidosVlrCDeb.AsCurrency > 0 then
      begin
        uDM.PedDetpagValor.AsCurrency := uDM.PedidosVlrCDeb.AsCurrency;
        uDM.PedDetpagtPag.AsString := '04';
        uDM.PedDetpagtpIntegra.AsInteger := uDM.SisPessoaTefPos.ASInteger;
      end;
      if uDM.PedidosVlrPIX.AsCurrency > 0 then
      begin
        uDM.PedDetpagValor.AsCurrency := uDM.PedidosVlrPIX.AsCurrency;
        uDM.PedDetpagtPag.AsString := '17';
        uDM.PedDetpagtpIntegra.AsInteger := uDM.SisPessoaTefPos.ASInteger;
      end;
      if uDM.PedidosVlrOutros.AsCurrency > 0 then
      begin
        uDM.PedDetpagValor.AsCurrency := uDM.PedidosVlrOutros.AsCurrency;
        uDM.PedDetpagtPag.AsString := '99';
        uDM.PedDetpagtpIntegra.AsInteger := 2;
      end;
    end;
    uDM.PedDetpag.Post;
  end;

  Try
    uDM.Pedidos.Edit;
  Except
  End;
  nRetorno := 0;
  wMsg := '';
  wStatus := True;
  if ObtemParametro('NFCe_Emitir') = 'S' then         // Emitir NFCe?
  begin
    xEmitirNFCe := 'Q';
    case uDM.PedidosMeioPagto.AsInteger of
      0:xEmitirNFCe := ObtemParametro('NFCe_Reais');        // Pagto em Reais (dinheiro)
      1:xEmitirNFCe := ObtemParametro('NFCe_CDebito');      // Pagto Cartao de débito
      2:xEmitirNFCe := ObtemParametro('NFCe_CCredito');     // Pagto Cartao de crédito
      3:xEmitirNFCe := ObtemParametro('NFCe_PIX');          // Pagto PIX
      4:xEmitirNFCe := ObtemParametro('NFCe_Outros');       // Pagto Outros
      5:xEmitirNFCe := ObtemParametro('NFCe_Misto');        // Pagto Misto
    end;
    if (xEmitirNFCe = 'Q') or (xEmitirNFCe = '') then
      if MessageDlg('Geração / Emissão de NFCe' + #13 +
                    'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                    'Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                    'Meio pagamento: ' + uDM.PedidosZC_MPExtenso.AsString,
                    mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
        then xEmitirNFCe := 'S';
    if xEmitirNFCe = 'S' then
    begin
      TimerMsgPinpad.Enabled := wAtivarMsg;
      EmiteNFCe(uDM.PedidosNumero.AsInteger, cbImprimeNFCe.Checked, wStatus);
      TimerMsgPinPad.Enabled := False;
      PanAguarde.Color := clHighLight;
      wMsg := 'DFe';
    end;
  end;

  if wStatus then
  begin
    newSitPagto := 1;
    if uDM.PedidosMeioPagto.AsInteger = 0 then
      if MessageDlg('Pagamento em REAIS' + #13 + 'Confirme o pagamento',
                    mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrNo then
                    newSitPagto := 0;                   // Não pago
    uDM.Pedidos.Edit;
    uDM.PedidosSitPagto.AsInteger := newSitPagto;
    uDM.Pedidos.Post;
  end;
  if (not wStatus) or
     (uDM.PedidosSitPagto.AsInteger = 0) then
  begin
    if MessageDlg('Falha na emissão do documento fiscal ou na efetivação do pagamento' + #13#13 +
                  'Informe:' + #13 +
                  '<Repetir> pagamento  ou  <Excluir> pedido',
                  mtConfirmation,[mbYes,mbNo],0,mbYes,['Repetir pagamento','Excluir pedido']) = mrYes
    then begin
      uDM.PedDetpag.First;
      while uDM.PedDetpag.RecordCount > 0 do
        uDM.PedDetpag.Delete;
      uDM.PedItens.First;
      while uDM.PedItens.RecordCount > 0 do
        uDM.PedItens.Delete;
      if uDM.Pedidos.State <> dsEdit then
         uDM.Pedidos.Edit;
      cbImprimeNFCe.Enabled := True;
      btGravar.Enabled := True;
      btCancelar.Enabled := True;
      PanAguarde.Visible := False;
      //btRetornar.Enabled := False;
      dbMeioPagto.SetFocus;
      Exit;
    end
    else begin
      ExcluePedido(uDM.PedidosNumero.AsInteger);
      FuFinPedido.Close;
      Exit;
    end;
  end;
  //
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
  if Pos(xImpressao,'SNQ') = 0 then xImpressao := 'Q';       // Sim  Não  Questiona
  if xImpressao = 'Q' then
    if MessageDlg('Imprimir pedido ?',mtConfirmation,[mbYes,mbNo],0,mbNo) = mrYes then
      xImpressao := 'S'
    else
      xImpressao := 'N';
  if xImpressao = 'S' then
    ImprimePedido(uDM.PedidosNumero.AsInteger);
  //
  xImpressao := ObtemParametro('EtiquetaFinalPedido');
  if xImpressao = 'Q' then
    if MessageDlg('Impressão etiquetas do pedido' + #13 +
                  'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                  'Imprimir etiquetas ?',
                  mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
    then xImpressao := 'S';
  if xImpressao = 'S' then
  begin
    EmiteEtiquetas(uDM.PedidosNumero.AsInteger, 0);           // Todos os ítens do pedido
    uDM.PedItens.Filtered := False;
    uDM.PedItens.Refresh;
    uDM.PedItens.First;
    while not uDM.PedItens.Eof do
    begin
      uDM.PedItens.Edit;
      uDM.PedItensEtqImpressa.AsInteger := 1;
      uDM.PedItens.Post;
      uDM.PedItens.Next;
    end;
    uDM.Pedidos.Edit;
    uDM.PedidosEtqImpressas.AsInteger := 1;
    uDM.Pedidos.Post;
  end;
  //
  FuFinPedido.Close;

end;

procedure TFuFinPedido.btRetornarClick(Sender: TObject);
begin
  uDM.nroPlaca := uDM.PedidosPlaca.AsString;
  uDM.meioPgto := uDM.PedidosMeioPagto.AsInteger;
  uDM.nomeClie := uDM.PedidosNomeCliente.AsString;
  uDM.CPFCNPJ := uDM.PedidosCPF_CNPJ.AsString;
  uDM.Pedidos.Cancel;
  nRetorno := 1;
  FuFinPedido.Close;
  //

end;

procedure TFuFinPedido.dbCPFEnter(Sender: TObject);
begin
  tvLeft := PanInform.Left + dbCPF.Left + dbCPF.Width + 8;
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
  tvTop := PanInform.Top + PanCliente.Top + dbCPF.Top + dbCPF.Height + 4;
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
var nTop,nLeft,nWidth,nHeight: Integer;
    vlReais,vlCCred,vlCDeb,vlPIX,vlOutros: Currency;
begin
  ExibeValorFaltante;
  edReais.Enabled  := False;
  edReceb.Visible  := False;
  LabReceb.Visible := False;
  edTroco.Visible  := False;
  LabTroco.Visible := False;
  edCDeb.Enabled   := False;
  edCCred.Enabled  := False;
  edPIX.Enabled    := False;
  edOutros.Enabled := False;

  uDM.PedidosVlrReais.AsCurrency := 0;
  uDM.PedidosVlrCDeb.AsCurrency := 0;
  uDM.PedidosVlrCCred.AsCurrency := 0;
  uDM.PedidosVlrPIX.AsCurrency := 0;
  uDM.PedidosVlrOutros.AsCurrency := 0;
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
        Exit;
    end;
    1:uDM.PedidosVlrCDeb.AsCurrency   := FuPedidos.totalPedido;
    2:uDM.PedidosVlrCCred.AsCurrency  := FuPedidos.totalPedido;
    3:uDM.PedidosVlrPIX.AsCurrency    := FuPedidos.totalPedido;
    4:uDM.PedidosVlrOutros.AsCurrency := FuPedidos.totalPedido;
    5:begin
        nTop := FuFinPedido.Top + PanInform.Top;
        nLeft := FuFinPedido.Left + PanInform.Left;
        nHeight := FuFinPedido.Height - (PanInform.Top * 2);
        nWidth := PanInform.Width + 20;
        PagamentoMisto(nTop,nLeft,nHeight,nWidth,
                       vlReais,vlCCred,vlCDeb,vlPIX,vlOutros);
        uDM.PedidosVlrReais.AsCurrency := vlReais;
        uDM.PedidosVlrCCred.AsCurrency := vlCCred;
        uDM.PedidosVlrCDeb.AsCurrency := vlCDeb;
        uDM.PedidosVlrPIX.AsCurrency := vlPIX;
        uDM.PedidosVlrOutros.AsCurrency := vlOutros;
    end;
  end;
  ExibeValorFaltante;

end;

procedure TFuFinPedido.dbMeioPagtoExit(Sender: TObject);
begin
{
  if dbMeioPagto.ItemIndex = 0 then
    edReceb.SetFocus
  else
    btGravar.SetFocus;
}
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
//  dbPlaca.Text := '';
//  uDM.PedidosPlaca.Clear;
  tvLeft := PanInform.Left + dbPlaca.Left - 8;
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
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
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
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
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
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
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
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
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
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
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
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
  edReceb.Text := '';
  tvLeft := PanInform.Left + PanDetPgto.Left + 20;
  if (tvLeft + 300) >= FuFinPedido.Width
     then tvLeft := FuFinPedido.Width - 328;
  tvTop := PanInform.Top + PanPlaca.Height + edReceb.Top + edReceb.Height + 4;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuFinPedido.edRecebExit(Sender: TObject);
begin
  Teclado.Visible := False;
  if edReceb.Text = '' then
  begin
    uDM.PedidosVlrRecebido.AsCurrency := uDM.PedidosValor.AsCurrency;
    uDM.PedidosVlrTroco.AsCurrency := 0;
    Exit;
  end;
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

procedure TFuFinPedido.TimerMsgPinpadTimer(Sender: TObject);
begin
  if PanAguarde.Color = clHighlight then
    PanAguarde.Color := clRed
  else
    PanAguarde.Color := clHighlight;
  Application.ProcessMessages;

end;

procedure TFuFinPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cbImprimeNFCe.Enabled := True;
  btGravar.Enabled := True;
  btCancelar.Enabled := True;
  btRetornar.Enabled := True;
  PanAguarde.Visible := False;

end;

procedure TFuFinPedido.FormCreate(Sender: TObject);
begin
  Teclado.Visible := False;
  SBoxPedido.Align := alLeft;
  PanInform.Align := alClient;

end;

procedure TFuFinPedido.FormResize(Sender: TObject);
begin
  if FuFinPedido.Width < 1000 then
     FuFinPedido.Width := 1000;
  if FuFinPedido.Width > Screen.Width then
     FuFinPedido.Width := Screen.Width;
  SBoxPedido.Width := Trunc(FuFinPedido.Width * 0.45);

  btGravar.Top := 40;
  btGravar.Left := 8;
  btGravar.Height := Trunc(PanCtle.Height * 0.45);
  btGravar.Width := PanCtle.Width - 16;

  btRetornar.Left := PanCtle.Width div 2;
  btRetornar.Top := btGravar.Top + btGravar.Height + 12;
  btRetornar.Height := Trunc(PanCtle.Height * 0.30);
  btRetornar.Width := Trunc(PanCtle.Width * 0.45);

  btCancelar.Left := btGravar.Left;
  btCancelar.Top := (btRetornar.Top + btRetornar.Height) - btCancelar.Height;

end;

procedure TFuFinPedido.FormShow(Sender: TObject);
begin
  FormResize(nil);
  dbPlaca.SetFocus;
  ExibeValorFaltante;

end;

end.
