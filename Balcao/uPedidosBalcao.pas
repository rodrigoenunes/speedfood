unit uPedidosBalcao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.CheckLst,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.UITypes,
  IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, Vcl.Touch.Keyboard, AdPort;
  Procedure PedidosBalcao(pmtCaption:String);

type
  TFuPedidosBalcao = class(TForm)
    PanWork: TPanel;
    PanGridPed: TPanel;
    PanPedCtle: TPanel;
    GridPedido: TDBGrid;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    NavPedido: TDBNavigator;
    PanAlteraBebida: TPanel;
    imgFundoBalcao: TImage;
    btSair: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    DBEdit1: TDBEdit;
    btMais: TBitBtn;
    btMenos: TBitBtn;
    btNada: TBitBtn;
    btAbrirPedido: TBitBtn;
    PanTotalizacao: TPanel;
    edItens: TEdit;
    edTotal: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    btFinalizar: TBitBtn;
    btCancelar: TBitBtn;
    btDummy: TBitBtn;
    LabAux1: TLabel;
    LabAux2: TLabel;
    btMontarLanche: TBitBtn;
    PanBuscaPedido: TPanel;
    Panel1: TPanel;
    btNrOk: TBitBtn;
    btNrCanc: TBitBtn;
    cbPedidos: TComboBox;
    PanPgCtle: TPanel;
    pgControleBalcao: TPageControl;
    TSLanches: TTabSheet;
    GridLanches: TDrawGrid;
    TSBebidas: TTabSheet;
    GridBebidas: TDrawGrid;
    TSCrepes: TTabSheet;
    TSFrituras: TTabSheet;
    TSBufDiv: TTabSheet;
    TSHamburgueres: TTabSheet;
    PanRodape: TPanel;
    sbAbasMenor: TSpeedButton;
    sbAbasMaior: TSpeedButton;
    sbAbasMulti: TSpeedButton;
    PanCrepesRodape: TPanel;
    btConfirmaCrepe: TBitBtn;
    btCancelaCrepe: TBitBtn;
    GridFrituras: TDrawGrid;
    GridFriturasCompl: TDrawGrid;
    PanFriturasRodape: TPanel;
    btConfirmaFritura: TBitBtn;
    btCancelaFritura: TBitBtn;
    GridHamburgueres: TDrawGrid;
    GridHamburgueresCompl: TDrawGrid;
    PanHamburgueresRodape: TPanel;
    btConfirmaHamburguer: TBitBtn;
    btCancelaHamburguer: TBitBtn;
    GridCrepesSabores: TDrawGrid;
    GridCrepes: TDrawGrid;
    PanCrepesTopo: TPanel;
    PanFriturasTopo: TPanel;
    PanHamburgueresTopo: TPanel;
    PanDiversos: TPanel;
    PanBuffet: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    btConfirmaBuffet: TBitBtn;
    edPeso: TDBEdit;
    edVlrBuffet: TDBEdit;
    DBText1: TDBText;
    Label5: TLabel;
    btAcrescBuffet: TBitBtn;
    Panel6: TPanel;
    btAcrescDiversos: TBitBtn;
    Label6: TLabel;
    edCodBarras: TDBEdit;
    edGrupo: TDBEdit;
    Label7: TLabel;
    edItem: TDBEdit;
    Label8: TLabel;
    edQuant: TDBEdit;
    Label9: TLabel;
    DBText2: TDBText;
    edVlrDiversos: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    edDescr: TDBEdit;
    btConfirmaDiversos: TBitBtn;
    Teclado: TTouchKeyboard;
    tBalanca: TTimer;
    cbTVBuffet: TCheckBox;
    cbBalConectada: TCheckBox;
    LabBal: TLabel;
    procedure btAbrirPedidoClick(Sender: TObject);
    procedure btFinalizarClick(Sender: TObject);
    procedure GridLanchesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridLanchesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridBebidasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridBebidasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btNadaClick(Sender: TObject);
    procedure btMaisClick(Sender: TObject);
    procedure btMenosClick(Sender: TObject);
    procedure GridPedidoDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btMontarLancheClick(Sender: TObject);
    procedure btNrCancClick(Sender: TObject);
    procedure btNrOkClick(Sender: TObject);
    procedure cbPedidosExit(Sender: TObject);
    procedure sbAbasMultiClick(Sender: TObject);
    procedure sbAbasMenorClick(Sender: TObject);
    procedure sbAbasMaiorClick(Sender: TObject);
    procedure GridCrepesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridCrepesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridCrepesSaboresDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure pgControleBalcaoChange(Sender: TObject);
    procedure GridCrepesSaboresMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btCancelaCrepeClick(Sender: TObject);
    procedure btConfirmaCrepeClick(Sender: TObject);
    procedure GridFriturasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridFriturasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridFriturasComplDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridFriturasComplMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btConfirmaFrituraClick(Sender: TObject);
    procedure btCancelaFrituraClick(Sender: TObject);
    procedure GridHamburgueresDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridHamburgueresMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridHamburgueresComplDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridHamburgueresComplMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btConfirmaHamburguerClick(Sender: TObject);
    procedure btCancelaHamburguerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgControleBalcaoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edPesoExit(Sender: TObject);
    procedure btConfirmaBuffetClick(Sender: TObject);
    procedure btAcrescBuffetClick(Sender: TObject);
    procedure btAcrescDiversosClick(Sender: TObject);
    procedure edCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQuantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edItemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQuantEnter(Sender: TObject);
    procedure edQuantExit(Sender: TObject);
    procedure PanDiversosEnter(Sender: TObject);
    procedure edCodBarrasExit(Sender: TObject);
    procedure edDescrEnter(Sender: TObject);
    procedure edDescrExit(Sender: TObject);
    procedure edGrupoEnter(Sender: TObject);
    procedure edGrupoExit(Sender: TObject);
    procedure edItemEnter(Sender: TObject);
    procedure edPesoEnter(Sender: TObject);
    procedure PanBuffetEnter(Sender: TObject);
    procedure edPesoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btConfirmaDiversosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tBalancaTimer(Sender: TObject);
    procedure edCodBarrasDblClick(Sender: TObject);
    procedure edCodBarrasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FApdComPort: TApdComPort;
    Procedure CriarApdComPort;
    Procedure ApdComPortTriggerAvail(CP: TObject; Count: Word);
    Procedure ApdComPortTriggerLineError(CP: TObject; Error: Word; LineBreak: Boolean);
  public
    { Public declarations }
    itensPedido: Integer;
    totalPedido: Currency;

  end;

var
  FuPedidosBalcao: TFuPedidosBalcao;
  wCodLanche: array[0..39,0..39] of Integer;
  wCodBebida: array[0..39,0..39] of Integer;

  wCodCrepe: array[0..23] of Integer;
  wSelCrepe: array[0..23] of String;
  wSabCrepe: array[0..23] of Integer;
  wKeyCrepe,wQtdSabCrepe: Integer;
  wCodCrepeSabor: array[0..23] of integer;
  wSelCrepeSabor: array[0..23] of String;
  wSelCrepeVezes: array[0..23] of Integer;

  wKeyFritura: Integer;
  wCodFritura: array[0..23] of Integer;
  wSelFritura: array[0..23] of String;
  wCodFrituraCompl: array[0..23] of Integer;
  wSelFrituraCompl: array[0..23] of String;

  wKeyGelado: Integer;
  wCodGelado: array[0..23] of Integer;
  wSelGelado: array[0..23] of String;
  wCodGeladoCompl: array[0..23] of Integer;
  wSelGeladoCompl: array[0..23] of String;

  lrgLanche,altLanche,lrgBebida,altBebida: Integer;
  wColor: TColor;
  nMaxExtras: Integer;
  tvTop,tvLeft: Integer;
  genTop, genLeft, vTentativasLeituraBalanca: Integer;         // Generico TOP e LEFT para cada �rea que pode ter teclado visual

  S: String;

implementation

{$R *.dfm}

uses uDados, uGenericas, uFinPedido, uTrataLanche, uBiblioteca, uMontarLanche, uImpressoes;

Procedure PedidosBalcao(pmtCaption:String);
begin
  nMaxExtras := StrToIntDef(ObtemParametro('PedidoMaxExtras'),5);
  CarregaItensCodBarra;
  FuPedidosBalcao.ShowModal;

end;


Procedure ExibeTecladoVirtual(pTipo:String; pTop,pLeft:Integer);
var xTipo: String;
begin
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  xTipo := AnsiUpperCase(pTipo);
  with FuPedidosBalcao
  do begin
    if (xTipo='N') or (xTipo='NUM') or (xTipo='NUMPAD') then
    begin
      Teclado.Layout := 'NumPad';
      Teclado.Width := 300;
      Teclado.Height := 300;
    end
    else begin
      Teclado.Layout := 'Standard';
      Teclado.Width := 860;
      Teclado.Height := 300;
    end;
    Teclado.Top     := pTop;
    Teclado.Left    := pLeft;
    Teclado.Visible := True;
  end;

end;


Procedure MontaTelaPedidosBalcao;
var i,j: Integer;
    nCol,nRow,nColBeb,nRowBeb: Integer;
    nRowCrepe,nRowCrepeSabor: Integer;
    nRowFritura,nRowFrituraCompl: Integer;
    nRowGelado,nRowGeladoCompl: Integer;
    nAltura,nLargura: Integer;
    nLanches,nExtras,nBebidas,nBasicos,nBasExtra,nDiversos,nCrepes,nCrepesSabores:Integer;
    nFrituras,nFriturasCompl,nHamburgueres,nHamburgueresCompl,nBuffet: Integer;
    wAlturaUtil: Integer;
begin
  with FuPedidosBalcao
  do begin
    for i := 0 to 19 do
    begin
      for j := 0 to 19 do
      begin
        wCodLanche[i,j] := 0;
        wCodBebida[i,j] := 0;
      end;
      FuMontarLanche.wCodBas[i] := 0;
      FuMontarLanche.wSelBas[i] := '';
      FuMontarLanche.wCodExt[i] := 0;
      FuMontarLanche.wSelExt[i] := '';
    end;
    for i := 0 to 23 do
     begin
       wCodCrepe[i] := 0;
       wSelCrepe[i] := '';
       wSabCrepe[i] := 0;
       wCodCrepeSabor[i] := 0;
       wSelCrepeSabor[i] := '';
       wSelCrepeVezes[i] := 0;
       //
       wCodFritura[i] := 0;
       wSelFritura[i] := '';
       wCodFrituraCompl[i] := 0;
       wSelFrituraCompl[i] := '';
       //
       wCodGelado[i] := 0;
       wSelGelado[i] := '';
       wCodGeladoCompl[i] := 0;
       wSelGeladoCompl[i] := '';
     end;
    //
    //Align := alClient;
    if FileExists(uDM.pathImagens + '\imgFundoBalcao.BMP') then
    begin
      imgFundoBalcao.Picture.LoadFromFile(uDM.pathImagens + '\imgFundoBalcao.BMP');
      imgFundoBalcao.Stretch := True;
      imgFundoBalcao.Align := alClient;
      imgFundoBalcao.Visible := True;
    end;
    PanGridPed.Width := FuPedidosBalcao.Width div 4;    // PanWork.Width div 4;
    PanGridPed.Align := alRight;
    pgControleBalcao.Align := alClient;
    pgControleBalcao.MultiLine := True;
    // Obtem quantidade de �tens de cada grupo
    nLanches  := 0;
    nExtras   := 0;
    nBebidas  := 0;
    nBasicos  := 0;
    nBasExtra := 0;
    nDiversos := 0;
    nCrepes   := 0;
    nCrepesSabores  := 0;
    nFrituras := 0;
    nFriturasCompl := 0;
    nHamburgueres  := 0;
    nHamburgueresCompl := 0;
    nBuffet := 0;
    uDM.Itens.First;
    while not uDM.Itens.Eof do
    begin
      case uDM.ItensGrupo.AsInteger of
        1:nLanches  := nLanches + 1;
        2:nExtras   := nExtras + 1;
        3:nBebidas  := nBebidas + 1;
        4:nBasicos  := nBasicos +1;
        5:nBasExtra := nBasExtra + 1;
        6:nDiversos := nDiversos + 1;
        11:nCrepes  := nCrepes + 1;
        12:nCrepesSabores := nCrepesSabores + 1;
        21:nFrituras := nFrituras + 1;
        22:nFriturasCompl := nFriturasCompl + 1;
        31:nHamburgueres := nHamburgueres + 1;
        32:nHamburgueresCompl := nHamburgueresCompl + 1;
      end;
      uDM.Itens.Next;
    end;
    //
    // ABAS TAMANHO
    pgControleBalcao.Font.Size := uDM.sysAbasFonte;
    pgControleBalcao.MultiLine := uDM.sysAbasMultiline;
    //
    btMontarLanche.Visible := False;
    if ObtemParametro('LanctoMontarLanche') = 'S' then
    begin
      btMontarLanche.Visible := True;
      btMontarLanche.Caption := ObtemParametro('LanctoMontarLancheNome','< Especial >');
    end;

    //
    TSLanches.TabVisible := uDM.balLanches;           // Aba LANCHES
    if TSLanches.TabVisible then
    begin
      TSLanches.Caption := ObtemParametro('LanctoLanches');
      if TSLanches.Caption = '' then TSLanches.Caption := '< Lanches >';
      if TSLanches.Width > 1000
      then nCol := 4
      else if TSLanches.Width > 800
           then nCol := 3
           else nCol := 2;
      nLargura := (TSLanches.Width div nCol) - 8;      // Largura da c�lula
      nRow := nLanches div nCol;                       // Qtd necess�ria de linhas
      if nRow < 1
      then nRow := 1
      else if (nLanches mod nRow) > 0
           then nRow := nRow + 1;
      //nAltura := ((TSLanches.Height-8) div nRow) - 4; // Altura da c�lula
      nAltura := (TSLanches.Height-(nRow*8)) div nRow;   // Altura da c�lula
      if nAltura > 220
      then nAltura := 220
      else if nAltura < 80
           then nAltura := 80;
      GridLanches.ColCount := nCol;
      GridLanches.RowCount := nRow;
      for i := 0 to nCol-1 do GridLanches.ColWidths[i]  := nLargura;
      for i := 0 to nRow-1 do GridLanches.RowHeights[i] := nAltura;
      GridLanches.Align := alClient;
      lrgLanche := nLargura - 12;   // Para definir o tamanho do texto
      altLanche := nAltura - 6;     // Altura m�xima para coloca��o do texto no grid
    end;
    //
    TSBebidas.TabVisible := uDM.balBebidas;         // Aba BEBIDAS
    if TSBebidas.TabVisible then
    begin
      TSBebidas.Caption := ObtemParametro('LanctoBebidas');
      if TSBebidas.Caption = '' then TSBebidas.Caption := '< Bebidas >';
      if TSBebidas.Width > 1000
      then nCol := 5
      else if TSBebidas.Width > 800
           then nCol := 4
           else if TSBebidas.Width > 600
                then nCol := 3
                else nCol := 2;
      nLargura := (TSBebidas.Width div nCol) - 2;          // Largura da c�lula
      nRow := nBebidas div nCol;                           // Qtd necess�ria de linhas
      if nRow < 1
      then nRow := 1
      else if (nBebidas mod nCol) > 0
           then nRow := nRow + 1;
      nAltura := (TSBebidas.Height-8) div nRow;      // Altura da c�lula
      if nAltura > 220
      then nAltura := 220
      else if nAltura < 80
           then nAltura := 80;
      GridBebidas.ColCount := nCol;
      GridBebidas.RowCount := nRow;
      for i := 0 to nCol-1 do GridBebidas.ColWidths[i]  := nLargura;
      for i := 0 to nRow-1 do GridBebidas.RowHeights[i] := nAltura;
      GridBebidas.Align := alClient;
      lrgBebida := nLargura - 12;
      altBebida := nAltura - 6;
    end;
    //
    TSCrepes.TabVisible := uDM.balCrepes;       // Aba CREPES
    if TSCrepes.TabVisible and (nCrepes > 0) then
    begin
      TSCrepes.Caption := ObtemParametro('LanctoCrepes');
      if TSCrepes.Caption = '' then TSCrepes.Caption := '< Crepes >';
      wAlturaUtil := TSCrepes.Height - (PanCrepesTopo.Height + PanCrepesRodape.Height + 12);
      GridCrepes.ColCount := 4;
      GridCrepes.RowCount := nCrepes;
      GridCrepes.Width := Trunc(TSCrepes.Width * 0.45);
      GridCrepes.ColWidths[0] := Trunc(GridCrepes.Width * 0.07);     // Codigo
      GridCrepes.ColWidths[1] := Trunc(GridCrepes.Width * 0.59);     // Descricao
      GridCrepes.ColWidths[2] := Trunc(GridCrepes.Width * 0.21);     // Preco
      GridCrepes.ColWidths[3] := Trunc(GridCrepes.Width * 0.11);     // X ou branco
      GridCrepes.RowCount := nCrepes;
      GridCrepes.RowHeights[0] := wAlturaUtil div nCrepes;
      for i := 1 to GridCrepes.RowCount-1 do
        GridCrepes.RowHeights[i] := GridCrepes.RowHeights[0];
      GridCrepesSabores.Left := GridCrepes.Left + GridCrepes.Width + 1;
      GridCrepesSabores.Width := TSCrepes.Width - (GridCrepes.Width + 2);
      GridCrepesSabores.Top := GridCrepes.Top;
      GridCrepesSabores.Height := GridCrepes.Height;
      GridCrepesSabores.ColCount := 3;
      GridCrepesSabores.ColWidths[0] := Trunc(GridCrepesSabores.Width * 0.80);   // Descricao
      GridCrepesSabores.ColWidths[1] := Trunc(GridCrepesSabores.Width * 0.10);   // X ou branco
      GridCrepesSabores.ColWidths[2] := Trunc(GridCrepesSabores.Width * 0.08);   // Vezes que foi indicado (1 a 3)
      GridCrepesSabores.RowCount := nCrepesSabores;
      GridCrepesSabores.RowHeights[0] := wAlturaUtil div nCrepesSabores;
      for i := 0 to GridCrepesSabores.RowCount-1 do
        GridCrepesSabores.RowHeights[i] := GridCrepesSabores.RowHeights[0];
    end;
    //
    TSFrituras.TabVisible := uDM.balFrituras;
    if TSFrituras.TabVisible and (nFrituras > 0) then                  // Aba FRITURAS
    begin
      TSFrituras.Caption := ObtemParametro('LanctoFrituras');
      if TSFrituras.Caption = '' then TSFrituras.Caption := '< Frituras >';
      wAlturaUtil := TSFrituras.Height - (PanFriturasTopo.Height + PanFriturasRodape.Height + 12);
      GridFrituras.ColCount := 4;
      GridFrituras.RowCount := nFrituras;
      GridFrituras.Width := Trunc(TSFrituras.Width * 0.45);
      GridFrituras.ColWidths[0] := Trunc(GridFrituras.Width * 0.07);     // Codigo
      GridFrituras.ColWidths[1] := Trunc(GridFrituras.Width * 0.59);     // Descricao
      GridFrituras.ColWidths[2] := Trunc(GridFrituras.Width * 0.21);     // Preco
      GridFrituras.ColWidths[3] := Trunc(GridFrituras.Width * 0.11);     // X ou branco
      GridFrituras.RowCount := nFrituras;
      GridFrituras.RowHeights[0] := wAlturaUtil div nFrituras;
      for i := 1 to GridFrituras.RowCount-1 do
        GridFrituras.RowHeights[i] := GridFrituras.RowHeights[0];
      GridFriturasCompl.Left := GridFrituras.Left + GridFrituras.Width + 1;
      GridFriturasCompl.Width := TSFrituras.Width - (GridFrituras.Width + 2);
      GridFriturasCompl.Top := GridFrituras.Top;
      GridFriturasCompl.Height := GridFrituras.Height;
      GridFriturasCompl.ColCount := 3;
      GridFriturasCompl.ColWidths[0] := Trunc(GridFriturasCompl.Width * 0.67);   // Descricao
      GridFriturasCompl.ColWidths[1] := Trunc(GridFriturasCompl.Width * 0.21);   // Valor, se houver
      GridFriturasCompl.ColWidths[2] := Trunc(GridFriturasCompl.Width * 0.10);   // X ou branco
      GridFriturasCompl.RowCount := nFriturasCompl;
      GridFriturasCompl.RowHeights[0] := wAlturaUtil div nFriturasCompl;
      for i := 0 to GridFriturasCompl.RowCount-1 do
        GridFriturasCompl.RowHeights[i] := GridFriturasCompl.RowHeights[0];
    end;
    //
    TSHamburgueres.TabVisible := uDM.balHamburgueres;
    if TSHamburgueres.TabVisible and (nHamburgueres > 0) then                  // Aba Gelados & Shakes
    begin
      TSHamburgueres.Caption := ObtemParametro('LanctoHamburgueres');
      if TSHamburgueres.Caption = '' then TSHamburgueres.Caption := '< Hamburgueres >';
      wAlturaUtil := TSHamburgueres.Height - (PanHamburgueresTopo.Height + PanHamburgueresRodape.Height + 12);
      GridHamburgueres.ColCount := 4;
      GridHamburgueres.RowCount := nHamburgueres;
      GridHamburgueres.Width := Trunc(TSHamburgueres.Width * 0.45);
      GridHamburgueres.ColWidths[0] := Trunc(GridHamburgueres.Width * 0.07);     // Codigo
      GridHamburgueres.ColWidths[1] := Trunc(GridHamburgueres.Width * 0.59);     // Descricao
      GridHamburgueres.ColWidths[2] := Trunc(GridHamburgueres.Width * 0.21);     // Preco
      GridHamburgueres.ColWidths[3] := Trunc(GridHamburgueres.Width * 0.11);     // X ou branco           .
      GridHamburgueres.RowCount := nHamburgueres;
      GridHamburgueres.RowHeights[0] := wAlturaUtil div nHamburgueres;
      for i := 1 to GridHamburgueres.RowCount-1 do
        GridHamburgueres.RowHeights[i] := GridHamburgueres.RowHeights[0];
      GridHamburgueresCompl.Left := GridHamburgueres.Left + GridHamburgueres.Width + 1;
      GridHamburgueresCompl.Width := TSHamburgueres.Width - (GridHamburgueres.Width + 2);
      GridHamburgueresCompl.Top := GridHamburgueres.Top;
      GridHamburgueresCompl.Height := GridHamburgueres.Height;
      GridHamburgueresCompl.ColCount := 3;
      GridHamburgueresCompl.ColWidths[0] := Trunc(GridHamburgueresCompl.Width * 0.67);   // Descricao
      GridHamburgueresCompl.ColWidths[1] := Trunc(GridHamburgueresCompl.Width * 0.21);   // Valor, se houver
      GridHamburgueresCompl.ColWidths[2] := Trunc(GridHamburgueresCompl.Width * 0.10);   // X ou branco
      GridHamburgueresCompl.RowCount := nHamburgueresCompl;
      GridHamburgueresCompl.RowHeights[0] := wAlturaUtil div nHamburgueresCompl;
      for i := 0 to GridHamburgueresCompl.RowCount-1 do
        GridHamburgueresCompl.RowHeights[i] := GridHamburgueresCompl.RowHeights[0];
    end;
    //
    TSBufDiv.TabVisible := uDM.balBufDiv;
    if TSBufDiv.TabVisible then                  // Aba Buffet de sorvetes && Diversos
    begin
      TSBufDiv.Caption := ObtemParametro('LanctoBufDiv');
      if TSBufDiv.Caption = '' then TSBufDiv.Caption := '< Sorvetes && Diversos >';
    end;
    //
    //
    // Montagem Lanches, Bebidas e Montar lanche
    nRow := 0;
    nCol := 0;
    nRowBeb := 0;
    nColBeb := 0;
    FuMontarLanche.nRowBas := 0;
    FuMontarLanche.nRowExt := 0;
    nRowCrepe := 0;
    nRowCrepeSabor := 0;
    nRowFritura := 0;
    nRowFrituraCompl := 0;
    nRowGelado := 0;
    nRowGeladoCompl := 0;
    uDM.Itens.First;
    while not uDM.Itens.Eof do
    begin
      case uDM.ItensGrupo.AsInteger of
        1:begin    // Lanches
            wCodLanche[nCol,nRow] := uDM.ItensCodigo.AsInteger;
            nCol := nCol + 1;
            if nCol = GridLanches.ColCount
            then begin
              nRow := nRow + 1;
              nCol := 0;
            end;
        end;
        3:begin    // Bebidas
            wCodBebida[nColBeb,nRowBeb] := uDM.ItensCodigo.AsInteger;
            nColBeb := nColBeb + 1;
            if nColBeb = GridBebidas.ColCount
            then begin
              nRowBeb := nRowBeb + 1;
              nColBeb := 0;
            end;
        end;
        4:begin    // Basicos
            FuMontarLanche.wCodBas[FuMontarLanche.nRowBas] := uDM.ItensCodigo.AsInteger;
            FuMontarLanche.nRowBas := FuMontarLanche.nRowBas + 1;
        end;
        5:begin    // Complementos (montar lanche)
            FuMontarLanche.wCodExt[FuMontarLanche.nRowExt] := uDM.ItensCodigo.AsInteger;
            FuMontarLanche.nRowExt := FuMontarLanche.nRowExt + 1;
        end;
        11:begin   // Crepes
            wCodCrepe[nRowCrepe] := uDM.ItensCodigo.AsInteger;
            wSelCrepe[nRowCrepe] := '';
            wSabCrepe[nRowCrepe] := StrToIntDef(uDM.ItensTamanho.AsString,1);      // Qtd sabores
            nRowCrepe := nRowCrepe + 1;
        end;
        12:begin   // Sabores de crepes
            wCodCrepeSabor[nRowCrepeSabor] := uDM.ItensCodigo.AsInteger;
            wSelCrepeSabor[nRowCrepeSabor] := '';
            nRowCrepeSabor := nRowCrepeSabor + 1;            
        end;
        21:begin   // Frituras
            wCodFritura[nRowFritura] := uDM.ItensCodigo.AsInteger;
            wSelFritura[nRowFritura] := '';
            nRowFritura := nRowFritura + 1;
        end;
        22:begin   // Frituras - complemento
            wCodFrituraCompl[nRowFrituraCompl] := uDM.ItensCodigo.AsInteger;
            wSelFrituraCompl[nRowFrituraCompl] := '';
            nRowFrituraCompl := nRowFrituraCompl + 1;
        end;
        31:begin   // Gelados & Shakes
            wCodGelado[nRowGelado] := uDM.ItensCodigo.AsInteger;
            wSelGelado[nRowGelado] := '';
            nRowGelado := nRowGelado + 1;
        end;
        32:begin   // Gelados & Shakes - complemento
            wCodGeladoCompl[nRowGeladoCompl] := uDM.ItensCodigo.AsInteger;
            wSelGeladoCompl[nRowGeladoCompl] := '';
            nRowGeladoCompl := nRowGeladoCompl + 1;
        end;
      end;
      uDM.Itens.Next;
    end;
    //
    // DBNavigator do pedido
    NavPedido.Left      := 4;
    NavPedido.Width     := 120;
    btEditar.Left       := NavPedido.Left + NavPedido.Width + 4;
    btEditar.Width      :=(PanPedCtle.Width - (btEditar.Left + 8)) div 2;
    btEditar.Caption    := 'Alterar' + #13 + '�tem';
    btExcluir.Left      := btEditar.Left + btEditar.Width + 4;
    btExcluir.Width     := btEditar.Width;
    btExcluir.Caption   := 'Excluir' + #13 + '�tem';
    btFinalizar.Left    := 4;
    btFinalizar.Width   := NavPedido.Width + btEditar.Width + btExcluir.Width + 8;
    btFinalizar.Caption := 'Finalizar pedido';
    btMontarLanche.Left := 4;
    btMontarLanche.Width := btFinalizar.Width;
    btCancelar.Left     := 4;
    btCancelar.Width    := (btFinalizar.Width - btDummy.Width) - 16;
    btCancelar.Caption  := 'Cancelar';
    if not uDM.SisPessoaTecladoVirtual.AsBoolean then
    begin
      btEditar.Caption    := '&' + btEditar.Caption;
      btExcluir.Caption   := '&' + btExcluir.Caption;
      btFinalizar.Caption := '&' + btFinalizar.Caption;
      btCancelar.Caption  := '&' + btCancelar.Caption;
    end;
    btDummy.Left := btCancelar.Left + btCancelar.Width + 16;
    btDummy.Top := btCancelar.Top + 10;
    PanWork.Visible := False;

 end;

end;

Procedure TotalizaPedidoBalcao;
var nrLcto: Integer;
begin
  FuPedidosBalcao.totalPedido := 0;
  FuPedidosBalcao.itensPedido := uDM.PedWrk.RecordCount;
  nrLcto := uDM.PedWrkNrLcto.AsInteger;
  uDM.PedWrk.First;
  while not uDM.PedWrk.Eof do
  begin
    FuPedidosBalcao.totalPedido := FuPedidosBalcao.totalPedido + uDM.PedWrkVlrTotal.AsCurrency;
    uDM.PedWrk.Next;
  end;
  uDM.PedWrk.FindKey([nrLcto]);
  FuPedidosBalcao.edItens.Text := IntToStr(FuPedidosBalcao.itensPedido);
  FuPedidosBalcao.edTotal.Text := FloatToStrF(FuPedidosBalcao.totalPedido,ffNumber,15,2);
  FuPedidosBalcao.btDummy.SetFocus;

end;


Procedure InclueBuffet;
var nLct: Integer;
    wDescr: String;
    wValor: Currency;
begin
  with uDM
  do begin
    if not uDM.Itens.FindKey([15,1]) then Exit;
    wDescr := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
    wValor := uDM.ItensPreco.AsCurrency;
    PedWrk.Last;
    nLct := PedWrkNrLcto.AsInteger + 1;
    PedWrk.Append;
    PedWrkNrLcto.AsInteger    := nLct;
    PedWrkTpProd.AsInteger    := 15;            // 1-Lanche, 2-Bebida, 4-Lanche montado, 11-Crepe
    PedWrkCodProd.AsInteger   := 1;
    PedWrkDescricao.AsString  := wDescr;
    PedWrkQuant.AsInteger     := 1;
    PedWrkVlrUnit.AsCurrency  := wValor;
    PedWrkVlrTotal.AsCurrency := 0;
    PedWrkExtras.AsString     := '';
    PedWrkAltPreco.AsBoolean  := False;
    PedWrkCortado.AsBoolean   := False;
    PedWrkPrensado.AsBoolean  := False;
    PedWrkEtqImpressa.AsInteger := 0;
    PedWrkObserv.AsString     := '';
    uDM.PedWrkPeso.AsBCD      := 0;
    PedWrk.Post;
    PedWrk.Edit;
  end;

end;


Procedure InclueLancheBalcao(pTipo:Integer;
                             pCodLanche:Integer;
                             pExtras:String;
                             pObserv:String;
                             pValor:Currency=0);
var nLct: Integer;
    wDescr,wExtra,wObserv: String;
    wValor,wTotal: Currency;
    wAltPr: Boolean;
    wPeso,wQuant: Integer;
    wKg: Real;
{
 pTipo:      Cachorro-quente, Montado, Crepe, Fritura...
 pCodLanche: C�digo do �tem
 pExtras:    Indica��o extra de complementos (Cachorro-quente)  Sabores(Crepe)
 pObserv:    Observa��es (Crepe=Sabores por extenso)
 pValor:     Valor a ser considerado
}
begin
  with uDM
  do begin
    FuPedidosBalcao.FormResize(nil);
    wExtra := pExtras;         // Comum a todos (exceto cachorro quente)
    wObserv := pObserv;        // Comum
    wValor := pValor;          //
    wPeso := 0;                // Utilizado somente em buffet de sorvete
    case pTipo  of
      1:begin        // Lanche (Cachorro quente)
          if not uDM.Itens.FindKey([1,pCodLanche]) then Exit;
          wDescr := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
          wValor := uDM.ItensPreco.AsCurrency;
          wAltPr := uDM.ItensAlteraPreco.AsBoolean;
          wExtra := stringFiller('.',48);
          wTotal := wValor;
          wQuant := 1;
        end;
      3,6:begin        // Diversos
          wDescr := uDM.CDDiversosDescr.AsString;
          wValor := uDM.CDDiversosVlrUnit.AsCurrency;
          wAltPr := False;
          wExtra := '';
          wObserv := '';
          wTotal := uDM.CDDiversosVlrTotal.AsCurrency;
          wQuant := uDM.CDDiversosQuant.AsInteger;
        end;
      4:begin        // Cachorro quente montado
          wDescr := 'Montar lanche - ';
          wValor := 0;
          wAltPr := False;
          wExtra := stringFiller('.',48);
          wObserv := '';
          wTotal := wValor;
          wQuant := 1;
        end;
      11:begin       // Crepe
          if not uDM.Itens.FindKey([11,pCodLanche]) then Exit;
          wDescr := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
          wValor := uDM.ItensPreco.AsCurrency;
          wAltPr := uDM.ItensAlteraPreco.AsBoolean;
          wTotal := wValor;
          wQuant := 1;
        end;
      15:begin       // Buffet sorvete  (Obtem dados de CDBuffet)
          if uDM.CDBuffet.RecordCount = 0 then Exit;
          wKg := uDM.CDBuffetPeso.AsInteger / 1000;
          wDescr := Trim(stringReplace(uDM.CDBuffetDescr.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll])) +
                    '(' + FloatToStrF(wKg,ffNumber,8,3) + 'Kg)';
          wValor := uDM.CDBuffetVlrUnit.AsCurrency;
          wAltPr := False;
          wTotal := uDM.CDBuffetZC_Valor.AsCurrency;
          wPeso  := uDM.CDBuffetPeso.AsInteger;
          wObserv := wDescr;
          wQuant := 1;
        end;
      21:begin      // Frituras
          if not uDM.Itens.FindKey([21,pCodLanche]) then Exit;
          wDescr := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
          wAltPr := uDM.ItensAlteraPreco.AsBoolean;
          wTotal := wValor;
          wQuant := 1;
        end;
      31:begin      // Gelados & Frituras
          if not uDM.Itens.FindKey([31,pCodLanche]) then Exit;
          wDescr := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
          wAltPr := uDM.ItensAlteraPreco.AsBoolean;
          wTotal := wValor;
          wQuant := 1;
        end;
      else Exit;
    end;
    //
    PedWrk.Last;
    nLct := PedWrkNrLcto.AsInteger + 1;
    PedWrk.Append;
    PedWrkNrLcto.AsInteger    := nLct;
    PedWrkTpProd.AsInteger    := pTipo;            // 1-Lanche, 2-Bebida, 4-Lanche montado, 11-Crepe  .....
    PedWrkCodProd.AsInteger   := pCodLanche;
    PedWrkDescricao.AsString  := wDescr;
    PedWrkQuant.AsInteger     := wQuant;
    PedWrkVlrUnit.AsCurrency  := wValor;
    PedWrkVlrTotal.AsCurrency := wTotal;
    PedWrkExtras.AsString     := wExtra;
    PedWrkAltPreco.AsBoolean  := wAltPr;
    PedWrkCortado.AsBoolean   := False;
    PedWrkPrensado.AsBoolean  := False;
    PedWrkEtqImpressa.AsInteger := 0;
    PedWrkObserv.AsString     := wObserv;
    uDM.PedWrkPeso.AsInteger  := wPeso;
    PedWrk.Post;
    PedWrk.Edit;

    if pTipo = 1 then
    begin     // Lanche
      TratativaLanche(pCodLanche,True,nMaxExtras);
      if PedWrk.State = dsEdit then
         PedWrk.Post;
      TotalizaPedidoBalcao;
    end;

  end;

end;

Procedure AlteraLanche;
var nSeq,nProd: Integer;
begin
  nSeq  := uDM.PedWrkNrLcto.AsInteger;
  nProd := uDM.PedWrkCodProd.AsInteger;
  uDM.PedWrk.Edit;
  TratativaLanche(nProd,False,nMaxExtras);
  if uDM.PedWrk.State = dsEdit
     then uDM.PedWrk.Post;
  TotalizaPedidoBalcao;

end;

Procedure AlteraBebida;
begin
  with FuPedidosBalcao
  do begin
    PanAlteraBebida.Visible := True;
    btNada.SetFocus;
  end;

end;

Procedure AlteraMontagem;
var nSeq,nProd: Integer;
begin
  nSeq  := uDM.PedWrkNrLcto.AsInteger;
  nProd := uDM.PedWrkCodProd.AsInteger;
  uDM.PedWrk.Edit;
  MontagemDoLanche(True);
  if uDM.PedWrk.State = dsEdit
     then uDM.PedWrk.Post;
  TotalizaPedidoBalcao;

end;


Procedure InclueBebida(pNrBebida:Integer);
var nSeq: Integer;
    lExiste,lProcura: Boolean;
begin
  if not uDM.Itens.FindKey([3,pNrBebida]) then Exit;
  with uDM
  do begin
    lExiste := False;
    lProcura := True;
    PedWrk.First;
    // Verifica se a bebida j� existe no pedido
    while lProcura
    do begin
      if (PedWrkTpProd.AsInteger = 3) and (PedWrkCodProd.AsInteger = pNrBebida)
      then begin
        lExiste := True;
        lProcura := False;
      end
      else PedWrk.Next;
      if PedWrk.Eof then lProcura := False;
    end;
    //
    if lExiste then
    begin          // Altera a bebida;
      nSeq := PedWrkNrLcto.AsInteger;
      PedWrk.Edit;
      PedWrkQuant.AsInteger := PedWrkQuant.AsInteger + 1;
      PedWrkVlrTotal.AsCurrency := PedWrkVlrUnit.AsCurrency * PedWrkQuant.AsInteger;
      PedWrk.Post;
    end
    else begin     // Inclue a bebida
      PedWrk.Last;
      nSeq := PedWrkNrLcto.AsInteger + 1;
      PedWrk.Append;
      PedWrkNrLcto.AsInteger    := nSeq;
      PedWrkTpProd.AsInteger    := 3;
      PedWrkCodProd.AsInteger   := pNrBebida;
      PedWrkDescricao.AsString  := stringReplace(ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
      PedWrkQuant.AsInteger     := 1;
      PedWrkVlrUnit.AsCurrency  := ItensPreco.AsCurrency;
      PedWrkVlrTotal.AsCurrency := ItensPreco.AsCurrency;
      PedWrkExtras.AsString     := stringFiller('.',48);
      PedWrk.Post;
    end;
  end;
  TotalizaPedidoBalcao;

end;

Procedure BebidaMaisMenos(pMais:Boolean);
var wQtd: Integer;
    lDeletou: Boolean;
begin
  // pMais:  True: Mais    False: Menos
  with uDM
  do begin
    lDeletou := False;
    if pMais then
      wQtd := PedWrkQuant.AsInteger + 1
    else
      wQtd := PedWrkQuant.AsInteger - 1;
    if wQtd = 0 then
    begin
      PedWrk.Delete;
      lDeletou := True;
    end
    else begin
      PedWrk.Edit;
      PedWrkQuant.AsInteger := wQtd;
      PedWrkVlrTotal.AsCurrency := PedWrkQuant.AsInteger * PedWrkVlrUnit.AsCurrency;
      PedWrk.Post;
    end;
  end;
  TotalizaPedidoBalcao;
  if lDeletou
    then FuPedidosBalcao.PanAlteraBebida.Visible := False;

end;

procedure AjustaFonteGridLanches;
begin
  with FuPedidosBalcao
  do begin
    GridLanches.Canvas.Font.Name := LabAux1.Font.Name;
    GridLanches.Canvas.Font.Size := LabAux1.Font.Size;
    GridLanches.Canvas.Font.Style := LabAux1.Font.Style;
    GridLanches.Canvas.Font.Color := LabAux1.Font.Color;

  end;

end;

procedure AjustaFonteGridBebidas;
begin
  with FuPedidosBalcao
  do begin
    GridBebidas.Canvas.Font.Name := LabAux1.Font.Name;
    GridBebidas.Canvas.Font.Size := LabAux1.Font.Size;
    GridBebidas.Canvas.Font.Style := LabAux1.Font.Style;
    GridBebidas.Canvas.Font.Color := LabAux1.Font.Color;

  end;

end;

{
Procedure InclueCrepe(pCodCrepe:Integer);
var nLct: Integer;
    wDescr: String;
    wValor: Currency;
    wAltPr: Boolean;
begin
  with uDM
  do begin
    if not uDM.Itens.FindKey([11,pCodCrepe]) then Exit;
    wDescr := uDM.ItensDescricao.AsString;
    wValor := uDM.ItensPreco.AsCurrency;
    wAltPr := uDM.ItensAlteraPreco.AsBoolean;
    PedWrk.Last;
    nLct := PedWrkNrLcto.AsInteger + 1;
    PedWrk.Append;
    PedWrkNrLcto.AsInteger    := nLct;
    PedWrkTpProd.AsInteger    := 11;
    PedWrkCodProd.AsInteger   := pCodCrepe;
    PedWrkDescricao.AsString  := wDescr;
    PedWrkQuant.AsInteger     := 1;
    PedWrkVlrUnit.AsCurrency  := wValor;
    PedWrkVlrTotal.AsCurrency := wValor;
    PedWrkExtras.AsString     := stringFiller('.',48);
    PedWrkAltPreco.AsBoolean  := wAltPr;
    PedWrkCortado.AsBoolean   := False;
    PedWrkPrensado.AsBoolean  := False;
    PedWrkEtqImpressa.AsInteger := 0;
    PedWrk.Post;
    PedWrk.Edit;
        //TratativaCrepe(pCodLanche,True,nMaxExtras);
      //if PedWrk.State = dsEdit
      //   then PedWrk.Post;
    TotalizaPedidoBalcao;
  end;

end;
}

procedure TFuPedidosBalcao.btCancelarClick(Sender: TObject);
begin
  PanAlteraBebida.Visible := False;
  PanWork.Visible := False;
  if ObtemParametro('LanctoCancelar') = 'N' then
    btAbrirPedidoClick(nil)
  else
    btAbrirPedido.SetFocus;

end;

procedure TFuPedidosBalcao.btCancelaCrepeClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to 23 do
  begin
    wSelCrepe[i] := '';
    wSelCrepeSabor[i] := '';
    wSelCrepeVezes[i] := 0;
  end;
  wQtdSabCrepe := 0;
  GridCrepes.Refresh;
  GridCrepesSabores.Refresh;
end;

procedure TFuPedidosBalcao.btEditarClick(Sender: TObject);
begin
  if uDM.PedWrk.RecordCount = 0 then Exit;
  case uDM.PedWrkTpProd.AsInteger of
    1:AlteraLanche;
    3:AlteraBebida;
    4:AlteraMontagem;
  end;

end;

procedure TFuPedidosBalcao.btExcluirClick(Sender: TObject);
begin
  if uDM.PedWrk.RecordCount = 0 then Exit;
  if MessageDlg('Excluir ' + uDM.PedWrkDescricao.AsString + ' ?',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','N�o']) = mrYes
  then begin
    uDM.Pedwrk.Delete;
    TotalizaPedidoBalcao;
  end;

end;

procedure TFuPedidosBalcao.btFinalizarClick(Sender: TObject);
var nRet,nroPedido: Integer;
    lstPedido: String;
begin
  PanAlteraBebida.Visible := False;
  nRet := 0;
  if FuPedidosBalcao.totalPedido > 0 then
  begin            // Pedido COM valor
    nRet := FinalizaPedido(nroPedido, FuPedidosBalcao.totalPedido, FuPedidosBalcao.itensPedido);
    {  nRet:1 Retornar � pagina anterior (incluir novos lan�amentos)
       nRet:0 Pedido finalizado    }
    if nRet = 0 then       // Pedido finalizado
    begin
      DebugMensagem(uDM.lDebug,'Gravou pedido, atualizou caixa e emitiu NFCe(se for o caso)' + #13 +
                               'Vai imprimir pedido nr: ' + IntToStr(nroPedido));
      if (nroPedido > 0) and uDM.sysImprimePedido then
      begin
        lstPedido := ObtemParametro('PedidoImprimir');
        if Pos(lstPedido,'SNQ') = 0 then lstPedido := 'Q';       // Sim  N�o  Questiona
        if lstPedido = 'Q' then
           if MessageDlg('Imprimir pedido ?',mtConfirmation,[mbYes,mbNo],0,mbNo) = mrYes then
              lstPedido := 'S'
           else
              lstPedido := 'N';
        if lstPedido = 'S' then
        begin
          DebugMensagem(uDM.lDebug,'Vai imprimir pedido nro ' + IntToStr(nroPedido));
          if ObtemParametro('PedidoTipoImpressao') = 'Txt' then
            ImprimePedidoLst(nroPedido)
          else
            ImprimePedido(nroPedido);    // Impressao normal
        end;
      end;
    end;
  end;
  //
  // nRet = 3 --> Pedido whatsapp... j� foi impresso
  // nRet = 1 --> Volta � tela anterior
  if nRet <> 1 then       // Novo pedido ou pedido cancelado
  begin
    PanWork.Visible := False;
    if ObtemParametro('LanctoFinalizar') = 'N' then
      btAbrirPedidoClick(nil)
    else
      btAbrirPedido.SetFocus;
  end;

end;

procedure TFuPedidosBalcao.btAcrescBuffetClick(Sender: TObject);
var wValor: Currency;
begin
  if not uDM.Itens.FindKey([15,1]) then Exit;
  if not uDM.CDBuffet.Active then
    uDM.CDBuffet.Active := True;
  if uDM.CDBuffet.RecordCount > 0 then
    uDM.CDBuffet.Delete;
  uDM.CDBuffet.Append;
  uDM.CDBuffetPeso.Clear;
  uDM.CDBuffetDescr.AsString := uDM.ItensDescricao.AsString;
  uDM.CDBuffetVlrUnit.AsCurrency := uDM.ItensPreco.AsCurrency;
  //uDM.CDBuffetVlrTotal.AsCurrency := 0;
  edPeso.Enabled := True;
  edPeso.SetFocus;

end;

procedure TFuPedidosBalcao.btAcrescDiversosClick(Sender: TObject);
begin
  if not uDM.CDDiversos.Active then
    uDM.CDDiversos.Active := True;
  if uDM.CDDiversos.RecordCount > 0 then
    uDM.CDDiversos.Delete;
  uDM.CDDiversos.Append;
  uDM.CDDiversosQuant.AsInteger := 1;
  edCodBarras.Enabled := True;
  edQuant.Enabled := True;
  edGrupo.Enabled := True;
  edItem.Enabled := True;
  edDescr.Enabled := True;
  edCodBarras.SetFocus;

end;

procedure TFuPedidosBalcao.btMaisClick(Sender: TObject);
begin
  BebidaMaisMenos(True);

end;

procedure TFuPedidosBalcao.btMenosClick(Sender: TObject);
begin
  BebidaMaisMenos(False);
  if uDM.PedWrkQuant.AsInteger = 0 then btNadaClick(nil);

end;

procedure TFuPedidosBalcao.btMontarLancheClick(Sender: TObject);
begin
  InclueLancheBalcao(4,0,'','');
  MontagemDoLanche(True);
  TotalizaPedidoBalcao;

end;

procedure TFuPedidosBalcao.btNadaClick(Sender: TObject);
begin
  PanAlteraBebida.Visible := False;
  btDummy.SetFocus;

end;

procedure TFuPedidosBalcao.btNrCancClick(Sender: TObject);
begin
  //edNrPedido.Text := '';
  PanBuscaPedido.Visible := False;
  btAbrirPedido.SetFocus;

end;

procedure TFuPedidosBalcao.btNrOkClick(Sender: TObject);
var nPos,wNrPedido: Integer;
    xPedido: String;
begin
  xPedido := cbPedidos.Text + ' x';
  nPos := Pos(' ',xPedido);
  wNrPedido := StrToIntDef(Copy(xPedido,1,nPos-1),0);
  if not uDM.Pedidos.FindKey([wNrPedido]) then
  begin
    MessageDlg('Pedido ' + IntToStr(wNrPedido) + ' n�o encontrado, reinforme',mtError,[mbOk],0);
    cbPedidos.SetFocus;
    Exit;
  end;
  if uDM.PedidosTurno.AsInteger <> uDM.turnoCorrente then
    if MessageDlg('Pedido: ' + IntToStr(wNrPedido) + '   Turno: ' + uDM.PedidosTurno.AsString +
                  '   Turno atual: ' + IntToStr(uDM.turnoCorrente) + #13 +
                  'utilizar ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','N�o']) <> mrYes
    then begin
      cbPedidos.SetFocus;
      Exit;
    end;
  PanBuscaPedido.Visible := False;
  //
  // ShowMessage('Usar pedido nr: ' + intToStr(wNrPedido));
  //
  pgControleBalcao.ActivePageIndex := uDM.sysIniBalcao;
  pgControleBalcaoChange(nil);
  if CriaAbrePedidoWrk(wNrPedido) <> 0 then Exit;

  uDM.wNroPedido := wNrPedido;
  uDM.nroPlaca := uDM.PedidosPlaca.AsString;
  uDM.meioPgto := uDM.PedidosMeioPagto.AsInteger;
  uDM.nomeClie := uDM.PedidosNomeCliente.AsString;
  uDM.CPFCNPJ := uDM.PedidosCPF_CNPJ.AsString;

  uDM.PedItens.First;
  while not uDM.PedItens.Eof do
  begin
    uDM.PedWrk.Append;
    uDM.PedWrkNrLcto.AsInteger    := uDM.PedItensNrLcto.AsInteger;
    uDM.PedWrkTpProd.AsInteger    := uDM.PedItensTpProd.AsInteger;
    uDM.PedWrkCodProd.AsInteger   := uDM.PedItensCodProd.AsInteger;
    uDM.PedWrkDescricao.AsString  := uDM.PedItensZC_Descricao.AsString;
    uDM.PedWrkQuant.AsInteger     := uDM.PedItensQuant.AsInteger;
    uDM.PedWrkVlrUnit.AsCurrency  := uDM.PedItensVlrUnitario.AsCurrency;
    uDM.PedWrkCod01.AsInteger     := uDM.PedItensCod01.AsInteger;
    uDM.PedWrkVlr01.AsCurrency    := uDM.PedItensVlr01.AsCurrency;
    uDM.PedWrkCod02.AsInteger     := uDM.PedItensCod02.AsInteger;
    uDM.PedWrkVlr02.AsCurrency    := uDM.PedItensVlr02.AsCurrency;
    uDM.PedWrkCod03.AsInteger     := uDM.PedItensCod03.AsInteger;
    uDM.PedWrkVlr03.AsCurrency    := uDM.PedItensVlr03.AsCurrency;
    uDM.PedWrkVlrTotal.AsCurrency := uDM.PedItensVlrTotal.AsCurrency ;
    uDM.PedWrkExtras.AsString     := uDM.PedItensExtras.AsString;
    uDM.PedWrkTxtSem.AsString     := uDM.PedItensTxtSem.AsString;
    uDM.PedWrkTxtMais.AsString    := uDM.PedItensTxtMais.AsString;
    uDM.PedWrkTxtMenos.AsString   := uDM.PedItensTxtMenos.AsString;
    uDM.PedWrkObserv.AsString     := uDM.PedItensObservacao.AsString;
    if uDM.PedItensAlteraPreco.AsInteger = 1
       then uDM.PedWrkAltPreco.AsBoolean := True
       else uDM.PedWrkAltPreco.AsBoolean := False;
    if uDM.PedItensCortado.AsInteger = 1
       then uDM.PedWrkCortado.AsBoolean := True
       else uDM.PedWrkCortado.AsBoolean := False;
    if uDM.PedItensPrensado.AsInteger = 1
       then uDM.PedWrkPrensado.AsBoolean := True
       else uDM.PedWrkPrensado.AsBoolean := False;
    uDM.PedWrkEtqImpressa.AsInteger := uDM.PedItensEtqImpressa.AsInteger;
    uDM.PedWrk.Post;
    uDM.PedItens.Next;
  end;
  itensPedido := uDM.PedWrk.RecordCount;
  edItens.Text := IntToStr(itensPedido);
  totalPedido := uDM.PedidosValor.AsCurrency;
  edTotal.Text := FloatToStrF(totalpedido,ffCurrency,15,2);
  PanWork.Visible := True;
  FuPedidosBalcao.FormResize(nil);
  btDummy.SetFocus;

end;

procedure TFuPedidosBalcao.btConfirmaBuffetClick(Sender: TObject);
begin
  if uDM.CDBuffetPeso.AsInteger = 0 then
  begin
    uDM.CDBuffet.Cancel;
    edPeso.Enabled := False;
    btFinalizar.SetFocus;
    Exit;
  end;
  uDM.CDBuffet.Post;
  InclueLancheBalcao(15,1,'','');
  uDM.PedWrk.Post;
  TotalizaPedidoBalcao;
  FuPedidosBalcao.FormResize(nil);
  uDM.CDBuffet.Delete;
  edPeso.Enabled := False;
  btDummy.SetFocus;

end;

procedure TFuPedidosBalcao.btConfirmaCrepeClick(Sender: TObject);
var i,wKey,qtdSabDef,n: Integer;
    xSabores: Array [1..100] of String;
    wrkSabores,lstSabores: String;
    idSabor: String;
begin
  wKey := 0;
  for i := 0 to GridCrepes.RowCount-1 do
    if wSelCrepe[i] <> '' then
    begin
      wKey := wCodCrepe[i];
      Break;
    end;
  //  wQtdSabCrepe=Qtd de sabores que pode ter, definido na escolha de sabores
  //  qtdSabDef=Qtd de sabores definidos
  lstSabores := '';
  qtdSabDef := 0;
  for i := 1 to 100 do
    xSabores[i] := '0';
  for i:= 0 to 23 do
  begin
    if wSelCrepeSabor[i] <> '' then
    begin
      n := wCodCrepeSabor[i];           // C�d do sabor (1..100)
      xSabores[n] := IntToStr(wSelCrepeVezes[i]);
      qtdSabDef := qtdSabDef + wSelCrepeVezes[i];
      idSabor := IntToStr(wSelCrepeVezes[i]) + ' X ';
      if uDM.Itens.FindKey([12,n]) then
        idSabor := idSabor + uDM.ItensDescricao.AsString;
      lstSabores := lstSabores + idSabor + #13;
    end;
  end;
  if qtdSabDef <> wQtdSabCrepe then
  begin
    MessageDlg('Quantidade de sabores' + #13#13 +
               'Crepe tem ' + IntToStr(wQtdSabCrepe) + ' sabores poss�veis' + #13 +
               IntToStr(qtdSabDef) + ' sabores indicados' + #13 +
               'Corrija por favor',mtError,[mbOk],0);
    Exit;
  end;
  wrkSabores := '';
  for i := 1 to 100 do
    wrkSabores := wrkSabores + xSabores[i];
  InclueLancheBalcao(11,wKey,wrkSabores,lstSabores);
  TotalizaPedidoBalcao;
  FuPedidosBalcao.FormResize(nil);
  btCancelaCrepeClick(nil);       // Limpa as informa��es de crepe

end;


procedure TFuPedidosBalcao.btConfirmaDiversosClick(Sender: TObject);
begin
  if uDM.CDDiversosQuant.AsInteger = 0 then
  begin
    uDM.CDDiversos.Cancel;
    btFinalizar.SetFocus;
    Exit;
  end;
  uDM.CDDiversos.Post;
  InclueLancheBalcao(uDM.CDDiversosCodGrupo.AsInteger,
                     uDM.CDDiversosCodItem.AsInteger,
                     '','');
  uDM.PedWrk.Post;
  TotalizaPedidoBalcao;
  FuPedidosBalcao.FormResize(nil);
  uDM.CDDiversos.Delete;
  btDummy.SetFocus;

end;

procedure TFuPedidosBalcao.btConfirmaFrituraClick(Sender: TObject);
var i,wKey,wKCompl: Integer;
    wValor: Real;
    lstComplementos: String;
begin
  wValor := 0;
  lstComplementos := '';
  for i := 0 to GridFrituras.RowCount-1 do
  begin
    if wSelFritura[i] <> ''
    then begin
      wKey := wCodFritura[i];
      if uDM.Itens.FindKey([21,wKey]) then
        wValor := uDM.ItensPreco.AsCurrency;
      Break;
    end;
  end;
  for i := 0 to GridFriturasCompl.RowCount-1 do
  begin
    if wSelFrituraCompl[i] <> '' then
    begin
      wKCompl := wCodFrituraCompl[i];
      if uDM.Itens.FindKey([22,wKCompl]) then
      begin
        wValor := wValor + uDM.ItensPreco.AsCurrency;
        lstComplementos := lstComplementos + uDM.ItensDescricao.AsString + #13;
      end;
    end;
  end;
  InclueLancheBalcao(21,wKey,'',lstComplementos,wValor);
  TotalizaPedidoBalcao;
  FuPedidosBalcao.FormResize(nil);
  btCancelaFrituraClick(nil);       // Limpa as informa��es da fritura

end;

procedure TFuPedidosBalcao.btCancelaFrituraClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to 23 do
  begin
    wSelFritura[i] := '';
    wSelFrituraCompl[i] := '';
  end;
  GridFrituras.Refresh;
  GridFriturasCompl.Refresh;

end;

procedure TFuPedidosBalcao.btCancelaHamburguerClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to 23 do
  begin
    wSelGelado[i] := '';
    wSelGeladoCompl[i] := '';
  end;
  GridHamburgueres.Refresh;
  GridHamburgueresCompl.Refresh;

end;

procedure TFuPedidosBalcao.btConfirmaHamburguerClick(Sender: TObject);
var i,wKey,wKCompl: Integer;
    wValor: Real;
    lstComplementos: String;
begin
  wValor := 0;
  lstComplementos := '';
  for i := 0 to GridHamburgueres.RowCount-1 do
  begin
    if wSelGelado[i] <> ''
    then begin
      wKey := wCodGelado[i];
      if uDM.Itens.FindKey([31,wKey]) then
        wValor := uDM.ItensPreco.AsCurrency;
      Break;
    end;
  end;
  for i := 0 to GridHamburgueresCompl.RowCount-1 do
  begin
    if wSelGeladoCompl[i] <> '' then
    begin
      wKCompl := wCodGeladoCompl[i];
      if uDM.Itens.FindKey([32,wKCompl]) then
      begin
        wValor := wValor + uDM.ItensPreco.AsCurrency;
        lstComplementos := lstComplementos + uDM.ItensDescricao.AsString + #13;
      end;
    end;
  end;
  InclueLancheBalcao(31,wKey,'',lstComplementos,wValor);
  TotalizaPedidoBalcao;
  FuPedidosBalcao.FormResize(nil);
  btCancelaHamburguerClick(nil);       // Limpa as informa��es do Gelado

end;

procedure TFuPedidosBalcao.ApdComPortTriggerAvail(CP: TObject; Count: Word);
Var
  I: Integer;
  C: AnsiChar;
  S2: String;
begin
  If pgControleBalcao.ActivePage <> TSBufDiv Then
    Exit;

  if (edPeso.DataSource = Nil) or (edPeso.DataSource.DataSet = Nil) or
      Not(edPeso.DataSource.DataSet.Active) or
      Not(edPeso.DataSource.DataSet.State in [dsInsert, dsEdit]) then
    Exit;

  for I := 1 to Count do
  begin
    C := FApdComPort.GetChar;
    S := S + C;
    If C in ['', 'q', ' '] Then
      S:= EmptyStr;
  end;

  S2:= EmptyStr;
  for I:= 1 to S.Length do
    if S[I] in ['0'..'9'] then
      S2:= S2 +  S[I];

  If Length(S2) >= 5 Then
  Begin
    S:= Copy(S2, 1, 5);

    Try
      S:= (StrToInt64(S)/1).ToString;
      if edPeso.DataSource.DataSet[edPeso.Field.FieldName] <> S then
        edPeso.DataSource.DataSet[edPeso.Field.FieldName]:= S;
    Except
    End;

    S:= EmptyStr;
    FApdComPort.Open:= False;

  End;

end;

procedure TFuPedidosBalcao.ApdComPortTriggerLineError(CP: TObject; Error: Word;
  LineBreak: Boolean);
begin
  S:= EmptyStr;
  FApdComPort.Open:= False
end;

procedure TFuPedidosBalcao.btAbrirPedidoClick(Sender: TObject);
var wPgIni: Integer;
begin
  if uDM.sysIniBalcao = 5 then
    wPgIni := 0
  else
    wPgIni := 1;
  Try
    pgControleBalcao.ActivePageIndex := wPgIni;
  Except
    pgControleBalcao.ActivePageIndex := uDM.sysIniBalcao;
  End;
  Sleep(200);
  pgControleBalcao.ActivePageIndex := uDM.sysIniBalcao;
  uDM.sysAtivo := 'BALCAO';
  uDM.sysPedePlaca := False;
  if CriaAbrePedidoWrk(0) <> 0 then Exit;
  itensPedido := 0;
  edItens.Text := IntToStr(itensPedido);
  totalPedido := 0;
  edTotal.Text := FloatToStrF(totalpedido,ffCurrency,15,2);
  PanWork.Visible := True;
  FuPedidosBalcao.FormResize(nil);
  btDummy.SetFocus;

end;

procedure TFuPedidosBalcao.btSairClick(Sender: TObject);
begin
  FuPedidosBalcao.Close;

end;

procedure TFuPedidosBalcao.cbPedidosExit(Sender: TObject);
begin
  if cbPedidos.Text <> '' then
    btNrOk.SetFocus
  else btNrCanc.SetFocus;

end;

procedure TFuPedidosBalcao.CriarApdComPort;
begin
  Self.FApdComPort:= TApdComPort.Create(Self);

  Self.FApdComPort.Baud:= 2400;
  Self.FApdComPort.ComNumber:= 1;
  Self.FApdComPort.DataBits:= 8;
  // Self.FApdComPort.LogName
  Self.FApdComPort.UseEventWord:= False;
  Self.FApdComPort.AutoOpen:= True;
  Self.FApdComPort.OnTriggerAvail:= ApdComPortTriggerAvail;
  Self.FApdComPort.OnTriggerLineError:= ApdComPortTriggerLineError;
  S:= '';
end;

procedure TFuPedidosBalcao.edCodBarrasDblClick(Sender: TObject);
begin
  tvLeft := genLeft + edCodBarras.Left - 3;
  tvTop := genTop + edCodBarras.Top + edCodBarras.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedidosBalcao.edCodBarrasExit(Sender: TObject);
var wCdBar: String;
begin
  Teclado.Visible := False;
  wCdBar := uDM.CDDiversosCodBarras.AsString;
  if wCdBar = '' then
    Exit;
  //
  uDM.CDItens.IndexName := 'CODIGOBARRAS';
  if not uDM.CDItens.FindKey([wCdBar]) then
  begin
    MessageDlg('C�digo informado n�o existe no cadastro, reinforme',mtError,[mbOk],0);
    uDM.CDDiversosCodBarras.AsString := '';
    edCodBarras.SetFocus;
    Exit;
  end;
  uDM.CDDiversosQuant.AsInteger := 1;
  uDM.CDDiversosVlrUnit.AsCurrency := uDM.CDItensPreco.AsCurrency;
  uDM.CDDiversosVlrTotal.AsCurrency := uDM.CDDiversosQuant.AsInteger * uDM.CDItensPreco.AsCurrency;
  uDM.CDDiversosCodGrupo.AsInteger := uDM.CDItensGrupo.AsInteger;
  uDM.CDDiversosCodItem.AsInteger := uDM.CDItensCodigo.AsInteger;
  uDM.CDDiversosDescr.AsString := uDM.CDItensDescricao.AsString;

end;

procedure TFuPedidosBalcao.edCodBarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedidosBalcao.edCodBarrasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbRight then
    Exit;
  tvLeft := genLeft + edCodBarras.Left - 3;
  tvTop := genTop + edCodBarras.Top + edCodBarras.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedidosBalcao.edDescrEnter(Sender: TObject);
begin
  tvLeft := genLeft + edDescr.Left - 3;
  tvTop := genTop + edDescr.Top + edDescr.Height + 3;
  ExibeTecladoVirtual('Standard',tvTop,tvLeft);

end;

procedure TFuPedidosBalcao.edDescrExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuPedidosBalcao.edGrupoEnter(Sender: TObject);
begin
  tvLeft := genLeft + edGrupo.Left - 3;
  tvTop := genTop + edGrupo.Top + edGrupo.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedidosBalcao.edGrupoExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuPedidosBalcao.edGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedidosBalcao.edItemEnter(Sender: TObject);
begin
  tvLeft := genLeft + edItem.Left - 3;
  tvTop := genTop + edItem.Top + edItem.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedidosBalcao.edItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedidosBalcao.edPesoEnter(Sender: TObject);
begin
  if cbTVBuffet.Checked then
  begin
    tvLeft := genLeft + edPeso.Left - 3;
    tvTop := genTop + edPeso.Top + edPeso.Height + 3;
    ExibeTecladoVirtual('NumPad',tvTop,tvLeft);
  end;

end;

procedure TFuPedidosBalcao.edPesoExit(Sender: TObject);
begin
  Teclado.Visible := False;
  btConfirmaBuffet.SetFocus;
//  btConfirmaBuffetClick(nil);

end;

procedure TFuPedidosBalcao.edPesoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then
    SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedidosBalcao.edQuantEnter(Sender: TObject);
begin
  tvLeft := genLeft + edQuant.Left - 3;
  tvTop := genTop + edQuant.Top + edQuant.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedidosBalcao.edQuantExit(Sender: TObject);
begin
  Teclado.Visible := False;
  uDM.CDDiversosVlrTotal.AsCurrency := uDM.CDDiversosQuant.AsInteger * uDM.CDItensPreco.AsCurrency;
  uDM.CDDiversos.Post;
  uDM.CDDiversos.Edit;
  btConfirmaDiversos.SetFocus;

end;

procedure TFuPedidosBalcao.edQuantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedidosBalcao.FormClose(Sender: TObject; var Action: TCloseAction);
var vIniFile: TIniFile;
begin
    if (pgControleBalcao.Font.Size <> uDM.sysAbasFonte) or
       (pgControleBalcao.MultiLine <> uDM.sysAbasMultiline)
    then begin
      vIniFile := TIniFile.Create(uDM.sysIniFile);
      uDM.sysAbasFonte := pgControleBalcao.Font.Size;
      uDM.sysAbasMultiline := pgControleBalcao.MultiLine;
      vIniFile.WriteInteger('AbasPedidos','Fonte',uDM.sysAbasFonte);
      vIniFile.WriteBool('AbasPedidos','Multiline',uDM.sysAbasMultiline);
      vIniFile.Free;
    end;

end;

procedure TFuPedidosBalcao.FormCreate(Sender: TObject);
begin
  Align := alClient;

  PanWork.Align         := alClient;
  btAbrirPedido.Left    := 20;
  btAbrirPedido.Top     := 60;
  btAbrirPedido.Width   := 220;
  btAbrirPedido.Height  := 80;
  //
  btSair.Left           := btAbrirPedido.Left;
  btSair.Top            := btAbrirPedido.Top + btAbrirPedido.Height + 20;
  btSair.Width          := btAbrirPedido.Width;
  btSair.Height         := btAbrirPedido.Height;
  //
  cbTVBuffet.Checked := False;
  cbBalConectada.Checked := False;
  //
  edItens.Text := '0';
  edTotal.Text := '0,00';
  //
  panBuffet.Height := 300;
  panDiversos.Height := 300;
  btConfirmaDiversos.Top := 150;

  CriarApdComPort;

  vTentativasLeituraBalanca:= 0;

end;

procedure TFuPedidosBalcao.FormDestroy(Sender: TObject);
begin
  FApdComPort.Open:= False;
end;

procedure TFuPedidosBalcao.FormResize(Sender: TObject);
begin
  PanGridPed.Width := FuPedidosBalcao.Width div 4;    // PanWork.Width div 4;
  GridPedido := DefineGrid(GridPedido, [0.06, 0.33, 0.05, 0.22], 1, 0);

end;

procedure TFuPedidosBalcao.FormShow(Sender: TObject);
var nPos: Integer;
begin
  edItens.Text := '0';
  edTotal.Text := '0,00';
  //
  btAbrirPedido.Caption := ObtemParametro('PedidoAbrir','&Abrir+pedido');
  nPos := Pos('+',btAbrirPedido.Caption);
  if nPos > 0 then
    btAbrirPedido.Caption := Copy(btAbrirPedido.Caption,1,nPos-1) + #13 +
                             Copy(btAbrirPedido.Caption,nPos+1,Length(btAbrirPedido.Caption)-nPos);
  if ObtemParametro('BalancaConectada_'+IntToStr(uDM.sysNumId),'N') = 'S' then
    cbBalConectada.Checked := True
  else
    cbBalConectada.Checked := False;
  //
  //ShowMessage('FormShow');
  MontaTelaPedidosBalcao;

end;

procedure TFuPedidosBalcao.GridBebidasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica a bebida na c�lula
  wKey := wCodBebida[ACol,ARow];
  if wKey = 0 then Exit;   // N�o h� bebida na c�lula
  if not uDM.Itens.FindKey([3,wKey]) then Exit;   // Bebida n�o encontrada
  GridBebidas.Canvas.Brush.Style := bsClear;
  GridBebidas.Canvas.FillRect(Rect);
  GridBebidas.Color := clWhite;
  //
  if FileExists(uDM.ItensImagem.AsString) and (not uDM.usaCorItem) then
  begin
    wImagem := TImage.Create(nil);
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridBebidas.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
    wImagem.Free;
  end
  else begin
    LabAux1.Font.Name := 'Tahoma';
    LabAux1.Font.Size := 28;
    LabAux1.Font.Style := [fsBold];
    LabAux1.Caption := '00';
    nTop := LabAux1.Height+16; // Obtem 'top' para descri��o
    if uDM.ItensCorItem.AsString <> '' then
      wColor := StringToColor(uDM.ItensCorItem.AsString)
    else wColor := clAqua;
    GridBebidas.Canvas.Brush.Color := wColor;
    GridBebidas.Canvas.FillRect(Rect);
    //
    wTxt := uDM.ItensDescricao.AsString;
    LabAux1.Caption := '';
    LabAux2.Caption := '';
    nPos := Pos('#',wTxt);
    if nPos = 0 then
    begin
      LabAux1.Caption := wTxt;
      nTop := Trunc(nTop * 1.4);
    end
    else begin
      LabAux1.Caption := Copy(wTxt,1,nPos-1);
      LabAux2.Caption := Copy(wTxt,nPos+1,Length(wTxt)-nPos);
    end;
    LabAux1.Font.Name := 'Tahoma';
    LabAux1.Font.Size := 18;
    LabAux1.Font.Style := [fsBold];
    LabAux1.Font.Color := clBlack;
    LabAux2.Font := LabAux1.Font;
    AjustaFonteGridBebidas;
    GridBebidas.Canvas.TextOut(Rect.Left+16,Rect.Top+nTop, LabAux1.Caption);
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 6;
      GridBebidas.Canvas.TextOut(Rect.Left+16,Rect.Top+nTop, LabAux2.Caption);
    end;
  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 28;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  AjustaFonteGridBebidas;
  GridBebidas.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  //
  GridBebidas.Canvas.Pen.Color := clBlack;
  GridBebidas.canvas.Pen.Width := 2;
  GridBebidas.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridBebidas.Canvas.LineTo(Rect.Left+LabAux1.Width+10, Rect.Top+3);
  GridBebidas.Canvas.LineTo(Rect.Left+LabAux1.Width+10, Rect.Top+LabAux1.Height+6);
  GridBebidas.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+6);
  GridBebidas.Canvas.LineTo(Rect.Left+3, Rect.Top+2);

end;


procedure TFuPedidosBalcao.GridBebidasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  if PanAlteraBebida.Visible then PanAlteraBebida.Visible := False;  
  GridBebidas.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodBebida[nCol,nLin];
  if wKey = 0 then Exit;
  InclueBebida(wKey);
  FormResize(nil);

end;

procedure TFuPedidosBalcao.GridCrepesDrawCell(Sender: TObject; ACol,ARow: Integer; Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
  // Identifica o crepe na linha
  wKey := wCodCrepe[ARow];
  if wKey = 0 then Exit;     // N�o h� crepe na linha
  if not uDM.Itens.FindKey([11,wKey]) then Exit;   // Crepe n�o encontrado
  GridCrepes.Canvas.Brush.Style := bsClear;
  GridCrepes.Canvas.FillRect(Rect);
  GridCrepes.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 16;
  if Acol = 3 then
    LabAux1.Font.Size := 24;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridCrepes.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridCrepes.Canvas.Brush.Color := wColor;
  GridCrepes.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensCodigo.AsString;
    1:LabAux1.Caption := uDM.ItensDescricao.AsString;
    2:LabAux1.Caption := FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2);
    3:LabAux1.Caption := wSelCrepe[ARow];
  end;
  case ACol of
    0,3:nLeft := (GridCrepes.ColWidths[ACol] - LabAux1.Width) div 2;
    2:nLeft := GridCrepes.ColWidths[ACol] - (LabAux1.Width + 3);
    else nLeft := 5;
  end;
  GridCrepes.Canvas.Font.Name := LabAux1.Font.Name;
  GridCrepes.Canvas.Font.Size := LabAux1.Font.Size;
  GridCrepes.Canvas.Font.Style := LabAux1.Font.Style;
  GridCrepes.Canvas.Font.Color := LabAux1.Font.Color;
  GridCrepes.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridCrepes.Canvas.Pen.Color := clBlack;
  GridCrepes.Canvas.Pen.Width := 1;
  GridCrepes.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridCrepes.Canvas.LineTo(Rect.Left+GridCrepes.ColWidths[ACol], Rect.Top);
  GridCrepes.Canvas.LineTo(Rect.Left+GridCrepes.ColWidths[ACol], Rect.Top+GridCrepes.RowHeights[ARow]);
  GridCrepes.Canvas.LineTo(Rect.Left, Rect.Top+GridCrepes.RowHeights[ARow]);
  GridCrepes.Canvas.LineTo(Rect.Left, Rect.Top);

end;


procedure TFuPedidosBalcao.GridCrepesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,i: Integer;
begin
  GridCrepes.MouseToCell(X,Y,nCol,nLin);
  wKeyCrepe := wCodCrepe[nLin];
  wQtdSabCrepe := wSabCrepe[nLin];
  if wKeyCrepe = 0 then Exit;
  for i := 0 to 23
  do if wCodCrepe[i] <> wKeyCrepe
     then wSelCrepe[i] := ''
     else wSelCrepe[i] := 'X';
  GridCrepes.Refresh;
  for i := 0 to 23 do
  begin
    wSelCrepeSabor[i] := '';
    wSelCrepeVezes[i] := 0;
  end;
  GridCrepesSabores.Refresh;

end;

procedure TFuPedidosBalcao.GridCrepesSaboresDrawCell(Sender: TObject; ACol,ARow: Integer; Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
  // Identifica o sabor do crepe na linha
  wKey := wCodCrepeSabor[ARow];
  if wKey = 0 then Exit;     // N�o h� sabor na linha
  if not uDM.Itens.FindKey([12,wKey]) then Exit;   // Sabor n�o encontrado
  GridCrepesSabores.Canvas.Brush.Style := bsClear;
  GridCrepesSabores.Canvas.FillRect(Rect);
  GridCrepesSabores.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 16;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridCrepesSabores.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridCrepesSabores.Canvas.Brush.Color := wColor;
  GridCrepesSabores.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensDescricao.AsString;
    1:LabAux1.Caption := wSelCrepeSabor[ARow];
    2:if wSelCrepeVezes[ARow] = 0 then
        LabAux1.Caption := '   '
      else
        LabAux1.Caption := IntToStr(wSelCrepeVezes[ARow]);
  end;
  if ACol = 0 then
    nLeft := 5
  else
    nLeft := (GridCrepesSabores.ColWidths[ACol] - LabAux1.Width) div 2;
  GridCrepesSabores.Canvas.Font.Name := LabAux1.Font.Name;
  GridCrepesSabores.Canvas.Font.Size := LabAux1.Font.Size;
  GridCrepesSabores.Canvas.Font.Style := LabAux1.Font.Style;
  GridCrepesSabores.Canvas.Font.Color := LabAux1.Font.Color;
  GridCrepesSabores.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridCrepesSabores.Canvas.Pen.Color := clBlack;
  GridCrepesSabores.Canvas.Pen.Width := 1;
  GridCrepesSabores.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridCrepesSabores.Canvas.LineTo(Rect.Left+GridCrepesSabores.ColWidths[ACol], Rect.Top);
  GridCrepesSabores.Canvas.LineTo(Rect.Left+GridCrepesSabores.ColWidths[ACol], Rect.Top+GridCrepesSabores.RowHeights[ARow]);
  GridCrepesSabores.Canvas.LineTo(Rect.Left, Rect.Top+GridCrepesSabores.RowHeights[ARow]);
  GridCrepesSabores.Canvas.LineTo(Rect.Left, Rect.Top);

end;

procedure TFuPedidosBalcao.GridCrepesSaboresMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,nCodSabor,nSabores,i: Integer;
   wMaxSabores: String;
begin
  GridCrepesSabores.MouseToCell(X,Y,nCol,nLin);
  nCodSabor := wCodCrepeSabor[nLin];
  if ((wKeyCrepe <= 50) and (nCodSabor > 50))  or              // Crepe salgado, Sabor doce   ou
     ((wKeyCrepe > 50) and (nCodSabor <= 50)) then             // Crepe doce, sabor salgado
     Exit;
  // Sabores previamente selecionados (M�x 1 ou 3 wQtdSabCrepe)
  if wQtdSabCrepe = 0 then
  begin
    MessageDlg('Indique o tipo de crepe',mtWarning,[mbOk],0);
    Exit;
  end;
  wMaxSabores := 'Quantidade m�xima de sabores atingida [' + IntToStr(wQtdSabCrepe) + ']';
  nSabores := 0;
  for i := 0 to 23 do
    if wSelCrepeVezes[i] <> 0 then
       nSabores := nSabores + wSelCrepeVezes[i];
  //
  if wSelCrepeSabor[nLin] = '' then     // Sabor n�o selecionado
  begin
    if nSabores = wQtdSabCrepe then     // Qtd.m�xima de sabores
      MessageDlg(wMaxSabores,mtWarning,[mbOk],0)
    else begin
      wSelCrepeSabor[nLin] := 'X';
      wSelCrepeVezes[nLin] := 1;
    end;
  end
  else begin              // Sabor anteriormente selecionado
    if nSabores = wQtdSabCrepe then
    begin          // Sabores anteriormente setecionado(s) = qtd.m�xima de sabores
      if MessageDlg(wMaxSabores + #13#13 + 'Excluir sabor?',
         mtConfirmation,[mbYes,mbNo],0,mbNo,['Excluir','N�o excluir']) = mrYes
      then begin
        wSelCrepeVezes[nLin] := wSelCrepeVezes[nLin] - 1;
        if wSelCrepeVezes[nLin] = 0 then
          wSelCrepeSabor[nLin] := '';
      end;
    end
    else begin            // Sabores anteriormente setecionado(s) < qtd.m�xima de sabores
      if MessageDlg('Repetir sabor ?',
                    mtConfirmation,[mbYes,mbNo],0,mbNo,['Repetir','N�o repetir']) = mrYes then
        wSelCrepeVezes[nLin] := wSelCrepeVezes[nLin] + 1;
    end;
  end;
  GridCrepesSabores.Refresh;

end;


procedure TFuPedidosBalcao.GridFriturasComplDrawCell(Sender: TObject; ACol,ARow: Integer; Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
  // Identifica o sabor do crepe na linha
  wKey := wCodFrituraCompl[ARow];
  if wKey = 0 then Exit;     // N�o h� complemento na linha
  if not uDM.Itens.FindKey([22,wKey]) then Exit;   // Complemento n�o encontrado
  GridFriturasCompl.Canvas.Brush.Style := bsClear;
  GridFriturasCompl.Canvas.FillRect(Rect);
  GridFriturasCompl.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 16;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridFriturasCompl.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridFriturasCompl.Canvas.Brush.Color := wColor;
  GridFriturasCompl.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensDescricao.AsString;
    1:LabAux1.Caption := FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2);
    2:LabAux1.Caption := wSelFrituraCompl[ARow];
  end;
  case ACol of
    0:nLeft := 5;
    1:nLeft := GridFriturasCompl.ColWidths[ACol] - (LabAux1.Width + 3);
    else nLeft := (GridFriturasCompl.ColWidths[ACol] - LabAux1.Width) div 2;
  end;
  GridFriturasCompl.Canvas.Font.Name := LabAux1.Font.Name;
  GridFriturasCompl.Canvas.Font.Size := LabAux1.Font.Size;
  GridFriturasCompl.Canvas.Font.Style := LabAux1.Font.Style;
  GridFriturasCompl.Canvas.Font.Color := LabAux1.Font.Color;
  GridFriturasCompl.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridFriturasCompl.Canvas.Pen.Color := clBlack;
  GridFriturasCompl.Canvas.Pen.Width := 1;
  GridFriturasCompl.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridFriturasCompl.Canvas.LineTo(Rect.Left+GridFriturasCompl.ColWidths[ACol], Rect.Top);
  GridFriturasCompl.Canvas.LineTo(Rect.Left+GridFriturasCompl.ColWidths[ACol], Rect.Top+GridFriturasCompl.RowHeights[ARow]);
  GridFriturasCompl.Canvas.LineTo(Rect.Left, Rect.Top+GridFriturasCompl.RowHeights[ARow]);
  GridFriturasCompl.Canvas.LineTo(Rect.Left, Rect.Top);

end;

procedure TFuPedidosBalcao.GridFriturasComplMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,nCodCompl: Integer;
begin
  GridFriturasCompl.MouseToCell(X,Y,nCol,nLin);
  nCodCompl := wCodFrituraCompl[nLin];
  if wSelFrituraCompl[nLin] = '' then
    wSelFrituraCompl[nLin] := 'X'
  else
    wSelFrituraCompl[nLin] := '';
  GridFriturasCompl.Refresh;

end;


procedure TFuPedidosBalcao.GridFriturasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
  // Identifica a fritura na linha
  wKey := wCodFritura[ARow];
  if wKey = 0 then Exit;     // N�o h� Fritura na linha
  if not uDM.Itens.FindKey([21,wKey]) then Exit;   // Fritura n�o encontrado
  GridFrituras.Canvas.Brush.Style := bsClear;
  GridFrituras.Canvas.FillRect(Rect);
  GridFrituras.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 16;
  if Acol = 3 then
    LabAux1.Font.Size := 24;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridFrituras.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridFrituras.Canvas.Brush.Color := wColor;
  GridFrituras.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensCodigo.AsString;
    1:LabAux1.Caption := uDM.ItensDescricao.AsString;
    2:LabAux1.Caption := FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2);
    3:LabAux1.Caption := wSelFritura[ARow];
  end;
  case ACol of
    0,3:nLeft := (GridFrituras.ColWidths[ACol] - LabAux1.Width) div 2;
    2:nLeft := GridFrituras.ColWidths[ACol] - (LabAux1.Width + 3);
    else nLeft := 5;
  end;
  GridFrituras.Canvas.Font.Name := LabAux1.Font.Name;
  GridFrituras.Canvas.Font.Size := LabAux1.Font.Size;
  GridFrituras.Canvas.Font.Style := LabAux1.Font.Style;
  GridFrituras.Canvas.Font.Color := LabAux1.Font.Color;
  GridFrituras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridFrituras.Canvas.Pen.Color := clBlack;
  GridFrituras.Canvas.Pen.Width := 1;
  GridFrituras.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridFrituras.Canvas.LineTo(Rect.Left+GridFrituras.ColWidths[ACol], Rect.Top);
  GridFrituras.Canvas.LineTo(Rect.Left+GridFrituras.ColWidths[ACol], Rect.Top+GridFrituras.RowHeights[ARow]);
  GridFrituras.Canvas.LineTo(Rect.Left, Rect.Top+GridFrituras.RowHeights[ARow]);
  GridFrituras.Canvas.LineTo(Rect.Left, Rect.Top);

end;

procedure TFuPedidosBalcao.GridFriturasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,i: Integer;
begin
  GridFrituras.MouseToCell(X,Y,nCol,nLin);
  wKeyFritura := wCodFritura[nLin];
  if wKeyFritura = 0 then Exit;
  for i := 0 to 23
  do if wCodFritura[i] <> wKeyFritura
     then wSelFritura[i] := ''
     else wSelFritura[i] := 'X';
  GridFrituras.Refresh;
  for i := 0 to 23 do
    wSelFrituraCompl[i] := '';
  GridFriturasCompl.Refresh;

end;


procedure TFuPedidosBalcao.GridHamburgueresComplDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
  // Identifica o complemento do gelado na linha
  wKey := wCodGeladoCompl[ARow];
  if wKey = 0 then Exit;     // N�o h� complemento na linha
  if not uDM.Itens.FindKey([32,wKey]) then Exit;   // Complemento n�o encontrado
  GridHamburgueresCompl.Canvas.Brush.Style := bsClear;
  GridHamburgueresCompl.Canvas.FillRect(Rect);
  GridHamburgueresCompl.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 16;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridHamburgueresCompl.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridHamburgueresCompl.Canvas.Brush.Color := wColor;
  GridHamburgueresCompl.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensDescricao.AsString;
    1:LabAux1.Caption := FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2);
    2:LabAux1.Caption := wSelGeladoCompl[ARow];
  end;
  case ACol of
    0:nLeft := 5;
    1:nLeft := GridHamburgueresCompl.ColWidths[ACol] - (LabAux1.Width + 3);
    else nLeft := (GridHamburgueresCompl.ColWidths[ACol] - LabAux1.Width) div 2;
  end;
  GridHamburgueresCompl.Canvas.Font.Name := LabAux1.Font.Name;
  GridHamburgueresCompl.Canvas.Font.Size := LabAux1.Font.Size;
  GridHamburgueresCompl.Canvas.Font.Style := LabAux1.Font.Style;
  GridHamburgueresCompl.Canvas.Font.Color := LabAux1.Font.Color;
  GridHamburgueresCompl.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridHamburgueresCompl.Canvas.Pen.Color := clBlack;
  GridHamburgueresCompl.Canvas.Pen.Width := 1;
  GridHamburgueresCompl.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridHamburgueresCompl.Canvas.LineTo(Rect.Left+GridHamburgueresCompl.ColWidths[ACol], Rect.Top);
  GridHamburgueresCompl.Canvas.LineTo(Rect.Left+GridHamburgueresCompl.ColWidths[ACol], Rect.Top+GridHamburgueresCompl.RowHeights[ARow]);
  GridHamburgueresCompl.Canvas.LineTo(Rect.Left, Rect.Top+GridHamburgueresCompl.RowHeights[ARow]);
  GridHamburgueresCompl.Canvas.LineTo(Rect.Left, Rect.Top);

end;

procedure TFuPedidosBalcao.GridHamburgueresComplMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,nUltimo,i,qtdCompl: Integer;
begin
  GridHamburgueresCompl.MouseToCell(X,Y,nCol,nLin);
  nUltimo := nLin;
  if wSelGeladoCompl[nLin] = '' then
    wSelGeladoCompl[nLin] := 'X'
  else
    wSelGeladoCompl[nLin] := '';
  GridHamburgueresCompl.Refresh;
  qtdCompl := 0;
  for i := 0 to 23 do
    if wSelGeladoCompl[i] <> '' then
      qtdCompl := qtdCompl + 1;
  if qtdCompl > nMaxExtras then
  begin
    MessageDlg('Excesso de indica��es de complementos/sabores' + #13 +
               'M�ximo permitido=' + IntToStr(nMaxExtras) + #13 +
               '�ltima indica��o ser� desconsiderada',mtWarning,[mbOk],0);
    wSelGeladoCompl[nUltimo] := '';
    GridHamburgueresCompl.Refresh;
  end;

end;

procedure TFuPedidosBalcao.GridHamburgueresDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
  // Identifica o Gelado/Shake na linha
  wKey := wCodGelado[ARow];
  if wKey = 0 then Exit;     // N�o h� Gelado na linha
  if not uDM.Itens.FindKey([31,wKey]) then Exit;   // Gelado n�o encontrado
  GridHamburgueres.Canvas.Brush.Style := bsClear;
  GridHamburgueres.Canvas.FillRect(Rect);
  GridHamburgueres.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 16;
  if Acol = 3 then
    LabAux1.Font.Size := 24;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridHamburgueres.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridHamburgueres.Canvas.Brush.Color := wColor;
  GridHamburgueres.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensCodigo.AsString;
    1:LabAux1.Caption := uDM.ItensDescricao.AsString;
    2:LabAux1.Caption := FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2);
    3:LabAux1.Caption := wSelGelado[ARow];
  end;
  case ACol of
    0,3:nLeft := (GridHamburgueres.ColWidths[ACol] - LabAux1.Width) div 2;
    2:nLeft := GridHamburgueres.ColWidths[ACol] - (LabAux1.Width + 3);
    else nLeft := 5;
  end;
  GridHamburgueres.Canvas.Font.Name := LabAux1.Font.Name;
  GridHamburgueres.Canvas.Font.Size := LabAux1.Font.Size;
  GridHamburgueres.Canvas.Font.Style := LabAux1.Font.Style;
  GridHamburgueres.Canvas.Font.Color := LabAux1.Font.Color;
  GridHamburgueres.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridHamburgueres.Canvas.Pen.Color := clBlack;
  GridHamburgueres.Canvas.Pen.Width := 1;
  GridHamburgueres.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridHamburgueres.Canvas.LineTo(Rect.Left+GridHamburgueres.ColWidths[ACol], Rect.Top);
  GridHamburgueres.Canvas.LineTo(Rect.Left+GridHamburgueres.ColWidths[ACol], Rect.Top+GridHamburgueres.RowHeights[ARow]);
  GridHamburgueres.Canvas.LineTo(Rect.Left, Rect.Top+GridHamburgueres.RowHeights[ARow]);
  GridHamburgueres.Canvas.LineTo(Rect.Left, Rect.Top);

end;

procedure TFuPedidosBalcao.GridHamburgueresMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,i: Integer;
begin
  GridHamburgueres.MouseToCell(X,Y,nCol,nLin);
  wKeyGelado := wCodGelado[nLin];
  if wKeyGelado = 0 then Exit;
  for i := 0 to 23
  do if wCodGelado[i] <> wKeyGelado
     then wSelGelado[i] := ''
     else wSelGelado[i] := 'X';
  GridHamburgueres.Refresh;
  for i := 0 to 23 do
    wSelGeladoCompl[i] := '';
  GridHamburgueresCompl.Refresh;

end;

procedure TFuPedidosBalcao.GridLanchesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica o lanche na c�lula
  wKey := wCodLanche[ACol,ARow];
  if wKey = 0 then Exit;   // N�o h� lanche na c�lula
  if not uDM.Itens.FindKey([1,wKey]) then Exit;   // Lanche n�o encontrado
  GridLanches.Canvas.Brush.Style := bsClear;
  GridLanches.Canvas.FillRect(Rect);
  GridLanches.Color := clWhite;
  //
  if FileExists(uDM.ItensImagem.AsString) and (not uDM.usaCorItem)
  then begin
    wImagem := TImage.Create(nil);
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridLanches.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
    wImagem.Free;
  end
  else begin      // Se n�o houver imagem ou utiliza as cores dinamicamente, 'escreve/desenha' a identifica��o do lanche
    LabAux1.Font.Name := 'Tahoma';
    LabAux1.Font.Size := 18;          //28
    LabAux1.Font.Style := [fsBold];
    LabAux1.Caption := '00';
    nTop := LabAux1.Height+8; // Obtem 'top' para descri��o              // +16
    if uDM.ItensCorItem.AsString <> '' then
      wColor := StringToColor(uDM.ItensCorItem.AsString)
    else wColor := clTeal;
    GridLanches.Canvas.Brush.Color := wColor;
    GridLanches.Canvas.FillRect(Rect);
    //
    wTxt := uDM.ItensDescricao.AsString;
    LabAux1.Caption := '';
    LabAux2.Caption := '';
    nPos := Pos('#',wTxt);
    if nPos = 0 then
    begin
      LabAux1.Caption := wTxt;
      nTop := Trunc(nTop * 1.4);
    end
    else begin
      LabAux1.Caption := Copy(wTxt,1,nPos-1);
      LabAux2.Caption := Copy(wTxt,nPos+1,Length(wTxt)-nPos);
    end;
    LabAux1.Font.Name := 'Tahoma';
    LabAux1.Font.Size := 18;
    LabAux1.Font.Style := [fsBold];
    LabAux1.Font.Color := clBlack;
    LabAux2.Font := LabAux1.Font;
    AjustaFonteGridLanches;
    GridLanches.Canvas.TextOut(Rect.Left+48,Rect.Top+nTop, LabAux1.Caption);    //+16
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 4;  // +6
      GridLanches.Canvas.TextOut(Rect.Left+48,Rect.Top+nTop, LabAux2.Caption);
    end;

  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Size := 18;        // 28
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  AjustaFonteGridLanches;
  GridLanches.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  //
  GridLanches.Canvas.Pen.Color := clBlack;
  GridLanches.Canvas.Pen.Width := 2;
  GridLanches.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridLanches.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+3);
  GridLanches.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+LabAux1.Height+3);
  GridLanches.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+3);
  GridLanches.Canvas.LineTo(Rect.Left+3, Rect.Top+3);

end;

procedure TFuPedidosBalcao.GridLanchesMouseDown(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridLanches.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodLanche[nCol,nLin];
  if wKey = 0 then Exit;
  InclueLancheBalcao(1,wKey,'','');
  FormResize(nil);

end;

procedure TFuPedidosBalcao.GridPedidoDblClick(Sender: TObject);
begin
  btEditarClick(nil);

end;

procedure TFuPedidosBalcao.PanBuffetEnter(Sender: TObject);
begin
  genLeft := PanWork.Left + PanPgCtle.Left + PgControleBalcao.Left + TSBufDiv.Left + PanBuffet.Left;
  genTop := PanWork.Top + PanPgCtle.Top + PgControleBalcao.Top + TSBufDiv.Top + PanBuffet.Top;

end;

procedure TFuPedidosBalcao.PanDiversosEnter(Sender: TObject);
begin
  genLeft := PanWork.Left + PanPgCtle.Left + PgControleBalcao.Left + TSBufDiv.Left + PanDiversos.Left;
  genTop := PanWork.Top + PanPgCtle.Top + PgControleBalcao.Top + TSBufDiv.Top + PanDiversos.Top;

end;

procedure TFuPedidosBalcao.pgControleBalcaoChange(Sender: TObject);
begin
  btMontarLanche.Enabled := False;
  tBalanca.Enabled := False;
  if pgControleBalcao.ActivePageIndex = 0 then
    btMontarLanche.Enabled := True;
  if pgControleBalcao.ActivePageIndex = 5 then
    tBalanca.Enabled := True;

end;

procedure TFuPedidosBalcao.pgControleBalcaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  case pgControleBalcao.ActivePage.PageIndex of
    2:btCancelaCrepeClick( nil);
    3:btCancelaFrituraClick(nil);
    4:BtCancelaHamburguerClick(nil);
  end;

end;

procedure TFuPedidosBalcao.sbAbasMaiorClick(Sender: TObject);
begin
  if pgControleBalcao.Font.Size > 46
     then Exit;
  pgControleBalcao.Font.Size := pgControleBalcao.Font.Size + 2;

end;

procedure TFuPedidosBalcao.sbAbasMenorClick(Sender: TObject);
begin
  if pgControleBalcao.Font.Size < 14
     then Exit;
  pgControleBalcao.Font.Size := pgControleBalcao.Font.Size - 2;

end;

procedure TFuPedidosBalcao.sbAbasMultiClick(Sender: TObject);
begin
  if pgControleBalcao.MultiLine
     then PgControleBalcao.MultiLine := False
     else PgControleBalcao.Multiline := True;

end;

procedure TFuPedidosBalcao.tBalancaTimer(Sender: TObject);
begin
  if not cbBalConectada.checked then
    Exit;

  if pgControleBalcao.ActivePage <> TSBufDiv Then
    Exit;

  if (edPeso.DataSource = Nil) or (edPeso.DataSource.DataSet = Nil) or
      Not(edPeso.DataSource.DataSet.Active) or
      Not(edPeso.DataSource.DataSet.State in [dsInsert, dsEdit]) then
    Exit; // btAcrescBuffet.Click;

  if vTentativasLeituraBalanca > 8 then
  Begin
    FApdComPort.Open:= False;
    // Caption:= 'Pedidos - Reiniciado conexao balanca';
    Application.ProcessMessages;
    FApdComPort.Open:= True;
    vTentativasLeituraBalanca:= 0;
    // Sleep(2000);
  End;
  {
  Else if Caption <> 'Pedidos' then
  Begin
    Caption:= 'Pedidos';
    Application.ProcessMessages;
  End;
  }

  if Not FApdComPort.Open then
    FApdComPort.Open:= True;

  FApdComPort.PutString(#05);

  Inc(vTentativasLeituraBalanca);

  if FApdComPort.Open then
    LabBal.Caption := 'Balan�a Ok'
  else
    LabBal.Caption := 'Balan�a desconectada';

end;

end.
