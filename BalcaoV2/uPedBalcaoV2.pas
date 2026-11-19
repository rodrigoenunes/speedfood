unit uPedBalcaoV2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.CheckLst,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.UITypes,
  IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, Vcl.Touch.Keyboard, AdPort;
  Procedure V2PedidosBalcao(pmtCaption:String);

type
  TRegFonte = Record
    Name: String;          // Nome do fonte
    Size: Integer;         // Size
    Style: TFontStyles;    // fsBold, fsItalic....
    Color: TColor;         // Cor
  End;

  TFuPedBalcaoV2 = class(TForm)
    PanWork: TPanel;
    PanTotalizaPedido: TPanel;
    PanPedCtle: TPanel;
    GridPedido: TDBGrid;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    NavPedido: TDBNavigator;
    PanAlteraProduto: TPanel;
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
    PanPgControle: TPanel;
    pgControleBalV2: TPageControl;
    TSLanches: TTabSheet;
    GridLanches: TDrawGrid;
    TSBebidas: TTabSheet;
    GridBebidas: TDrawGrid;
    TSFrituras: TTabSheet;
    TSBufDiv: TTabSheet;
    TSHamburgueres: TTabSheet;
    GridFrituras: TDrawGrid;
    GridHamburg: TDrawGrid;
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
    TSDrinks: TTabSheet;
    GridDrinks: TDrawGrid;
    PanRodape: TPanel;
    sbAbasMenor: TSpeedButton;
    sbAbasMaior: TSpeedButton;
    sbAbasMulti: TSpeedButton;
    LabBal: TLabel;
    cbTVBuffet: TCheckBox;
    cbBalConectada: TCheckBox;
    FDQuery1: TFDQuery;
    DSQtdRegs: TDataSource;
    LabParam: TLabel;
    TSMontagem: TTabSheet;
    GridBasico: TDrawGrid;
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
    procedure pgControleBalV2Change(Sender: TObject);
    procedure GridFriturasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridFriturasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridFriturasComplDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridFriturasComplMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridHamburgDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridHamburgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgControleBalV2Changing(Sender: TObject;
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
    procedure GridDrinksDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure GridDrinksMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridBasicoDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure GridBasicoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FApdComPort: TApdComPort;
    Procedure CriarApdComPortV2;
    Procedure ApdComPortTriggerAvail(CP: TObject; Count: Word);
    Procedure ApdComPortTriggerLineError(CP: TObject; Error: Word; LineBreak: Boolean);
  public
    { Public declarations }
    itensPedido: Integer;
    totalPedido: Currency;
    // Ocorrencias de wRegsFonte
    //     0-Lanches  1-Bebidas  2-Drinks  3-Frituras  4-Hamburgueres
    //     5-Montagem de lanches  6-Extras (Lanches/Frituras/Hamburgueres/Montagem)
    //     7...19 - Disponiveis
    wRegsFonte: array[0..19] of TRegFonte;
    //
    // Disposição na tela  (Colunas X Linhas)  Dimensões máximas
    // Colunas serão utilizadas conforme a disponibilidade da tela
    wCodLanche:  array[0..7,0..59] of Integer;    // Grupo 1   Lanches    (Até 8 colunas)
    qtdLanches:  Integer;
    //wCodExtras:  array[0..1,0..29] of Integer;    // Grupo 2   Extras p/ Lanches   (2 colunas)
    //wTxtExtras:  array[0..1,0..29] of String;
    //wVlrExtras:  array[0..1,0..29] of Currency;
    //qtdExtras:   Integer;

    wCodBebida:  array[0..7,0..59] of Integer;    // Grupo 3   Bebidas (Refrig, Aguas, Cervejas)
    qtdBebidas:  Integer;

    wCodDrinks:  array[0..7,0..59] of Integer;    // Grupo 35  Drinks
    qtdDrinks:   Integer;

    wCodFritura: array[0..7,0..59] of Integer;    // Grupo 21  Frituras
    qtdFrituras: Integer;
    //wCodFritExt: array[0..1,0..29] of Integer;    // Grupo 22  Extras p/ Frituras
    //wTxtFritExt: array[0..1,0..29] of String;
    //wVlrFritExt: array[0..1,0..29] of Currency;
    //qtdFritExt:  Integer;

    wCodHamburg: array[0..7,0..59] of Integer;    // Grupo 31
    qtdHamburg:  Integer;
    //wCodHambExt: array[0..1,0..29] of Integer;    // Grupo 32  Extras p/ Hamburgueres
    //wTxtHambExt: array[0..1,0..29] of String;
    //wVlrHambExt: array[0..1,0..29] of Currency;
    //qtdHambExt:  Integer;

    wCodBasico:  array[0..7,0..59] of Integer;    // Grupo 4
    qtdBasico:   Integer;

    //wCodBasExt:  array[0..1,0..29] of Integer;    // Grupo 5   Extras p/ Montagem  (2 colunas)

  end;


var
  FuPedBalcaoV2: TFuPedBalcaoV2;


  //
  wKeyLanche,wKeyBebida,wKeyDrink,wKeyCrepe,wKeyFrit,wKeyHamb,wKeyBas: Integer;
  wSaborDrink: String;

  nMaxExtras: Integer;
  tvTop,tvLeft: Integer;
  genTop, genLeft, vTentativasLeituraBalanca: Integer;         // Generico TOP e LEFT para cada área que pode ter teclado visual

  S: String;

implementation

{$R *.dfm}

uses uDados, uGenericas, uFinPedido, uTrataExtrasV2, uBiblioteca, uMontarLanche,
     uImpressoes, uPrincipal, uSaboresV2;

Procedure DefineFontesDrawGrids;
var xParam: TStringList;
    i,nP,wStyle: Integer;
    wParam: String;
begin
  for i := 0 to 19 do
  begin
    FuPedBalcaoV2.wRegsFonte[i].Name := '';
    FuPedBalcaoV2.wRegsFonte[i].Size := 0;
    FuPedBalcaoV2.wRegsFonte[i].Style := [];
    FuPedBalcaoV2.wRegsFonte[i].Color := clWhite;
  end;

  xParam := TStringList.Create;
  // Fonte,Tamanho,Estilo,Cor
  xParam.Add(ObtemParametro('Fonte_Lanches',      'Tahoma;16;0;clBlack'));    // 0
  xParam.Add(ObtemParametro('Fonte_Bebidas',      'Tahoma;16;0;clBlack'));    // 1
  xParam.Add(ObtemParametro('Fonte_Drinks',       'Tahoma;16;0;clBlack'));    // 2
  xParam.Add(ObtemParametro('Fonte_Frituras',     'Tahoma;16;0;clBlack'));    // 3
  xParam.Add(ObtemParametro('Fonte_Hamburgueres', 'Tahoma;16;0;clBlack'));    // 4
  xParam.Add(ObtemParametro('Fonte_Montagem',     'Tahoma;16;0;clBlack'));    // 5
  xParam.Add(ObtemParametro('Fonte_Extras',       'Tahoma;16;0;clBlack'));    // 6

  for i := 0 to xParam.Count-1 do
  begin
    wParam := xParam[i];
    nP := Pos(';',wParam);
    FuPedBalcaoV2.wRegsFonte[i].Name := Copy(wParam,1,nP-1);
    wParam := Copy(wParam,nP+1,Length(wParam)-nP);
    nP := Pos(';',wParam);
    FuPedBalcaoV2.wRegsFonte[i].Size := StrToIntDef(Copy(wParam,1,nP-1),16);
    wParam := Copy(wParam,nP+1,Length(wParam)-nP);
    nP := Pos(';',wParam);
    wStyle := StrToIntDef(Copy(wParam,1,nP-1),0);
    case wStyle of
      1:FuPedBalcaoV2.wRegsFonte[i].Style := [fsBold];
      2:FuPedBalcaoV2.wRegsFonte[i].Style := [fsItalic];
      3:FuPedBalcaoV2.wRegsFonte[i].Style := [fsBold,fsItalic];
      else FuPedBalcaoV2.wRegsFonte[i].Style := [];
    end;
    wParam := Copy(wParam,nP+1,Length(wParam)-nP);
    Try
      FuPedBalcaoV2.wRegsFonte[i].Color := StringToColor(Trim(wParam));
    Except
      FuPedBalcaoV2.wRegsFonte[i].Color := clRed;
    End;

  end;
  xParam.Free;

end;

Procedure V2PedidosBalcao(pmtCaption:String);
var xParam: String;
begin
  nMaxExtras := StrToIntDef(ObtemParametro('PedidoMaxExtras','5'),5);
  CarregaItensCodBarra;        // Carrega TODOS os ítens que tenham código de barras em CDItens

  if ObtemParametro('PedidoBalcaoAlteraItem','S') = 'S' then
    FuPedBalcaoV2.btEditar.Visible := True
  else
    FuPedBalcaoV2.btEditar.Visible := False;
  FuPedBalcaoV2.Caption := 'Pedidos  ' + pmtCaption;
  FuPedBalcaoV2.ShowModal;

end;


Procedure ExibeTecladoVirtual(pTipo:String; pTop,pLeft:Integer);
var xTipo: String;
begin
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  xTipo := AnsiUpperCase(pTipo);
  with FuPedBalcaoV2
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


Procedure MontaTelaPedidosV2;
var i,j,lrgScroll: Integer;
    nCols,nRows: Integer;
    nC,nR: Integer;
    nAltura,nLargura: Integer;
    lrgLanche,altLanche,nColExtras: Integer;
    lrgBebida,altBebida: Integer;
    lrgDrinks,altDrinks: Integer;
    lrgFritura,altFritura: Integer;
    lrgHamburg,altHamburg: Integer;
    lrgBasico,altBasico: Integer;
    nBuffet: Integer;

begin
  with FuPedBalcaoV2
  do begin
    // Disponibiliza as tabelas possíveis de produtos
    for i := 0 to 7 do                    // Colunas possíveis
      for j := 0 to 59 do                 // Linhas possíveis
        begin
          wCodLanche[i,j]  := 0;          // Cachorro-quente/Lanches
          wCodBebida[i,j]  := 0;          // Bebidas
          wCodDrinks[i,j]  := 0;          // Drinks
          wCodFritura[i,j] := 0;          // Frituras
          wCodHamburg[i,j] := 0;          // Hamburgueres
          wCodBasico[i,j]  := 0;          // Montagem Cachorro-quente/Lanche
        end;
    //
    if FileExists(uDM.pathImagens + '\imgFundoBalcao.BMP') then
    begin
      imgFundoBalcao.Picture.LoadFromFile(uDM.pathImagens + '\imgFundoBalcao.BMP');
      imgFundoBalcao.Stretch := True;
      imgFundoBalcao.Align := alClient;
      imgFundoBalcao.Visible := True;
    end;
    PanTotalizaPedido.Width := FuPedBalcaoV2.Width div 4;       // PanWork.Width div 4;
    PanTotalizaPedido.Align := alRight;
    PanPgControle.Align := alClient;
    pgControleBalV2.Align := alClient;
    pgControleBalV2.MultiLine := True;
    //
    // Define abas TAMANHO abas (.ini)
    pgControleBalV2.Font.Size := uDM.sysAbasFonte;
    pgControleBalV2.MultiLine := uDM.sysAbasMultiline;

    // Define as abas disponíveis (.ini)
    TSLanches.TabVisible := uDM.balLanches;
    TSBebidas.TabVisible := uDM.balBebidas;
    TSDrinks.TabVisible := uDM.balDrinks;
    TSFrituras.TabVisible := uDM.balFrituras;
    TSHamburgueres.TabVisible := uDM.balHamburgueres;
    TSMontagem.TabVisible := uDM.balMontagem;
    TSBufDiv.TabVisible := uDM.balBufDiv;
    //
    nBuffet    := 0;       // Não tem grupo associado
    FDQuery1.Connection := uDM.FDC;
    FDQuery1.Close;
    //
    lrgScroll := 8 + FuPrincipal.appScrollbarLargura;         // ScrollbarLargura de Parametros
    //
    if TSLanches.TabVisible then
    begin
      FDQuery1.SQL.Text := 'Select Count(*) as nRegs from com_itens where grupo=1';
      FDQuery1.Open;
      qtdLanches := FDQuery1.FieldByName('nRegs').AsInteger;
      TSLanches.Caption := ObtemParametro('LanchesIdent','< Cachorro-quente >');
      nCols := StrToInt(ObtemParametro('LanchesColunas','3'));
      if nCols < 3 then
        nCols := 3;
      if nCols > 8 then
        nCols := 8;
      nAltura := StrToIntDef(ObtemParametro('LanchesAltura','180'),180);
      if nAltura < 100 then
        nAltura := 100;
      if nAltura > 500 then
        nAltura := 500;
      nLargura := ((TSLanches.Width - lrgScroll) div nCols);        // Largura da célula
      nRows := qtdLanches div nCols;                                // Linhas necessárias
      if nRows < 1 then
        nRows := 1;
      if (qtdLanches mod nRows) > 0 then
        nRows := nRows + 1;
      GridLanches.ColCount := nCols;
      for i := 0 to nCols-1 do
        GridLanches.ColWidths[i] := nLargura;
      GridLanches.RowCount := nRows;
      for i := 0 to nRows-1 do
        GridLanches.RowHeights[i] := nAltura;
      GridLanches.Align := alClient;
      lrgLanche := nLargura - 12;   // Para definir o tamanho do texto
      altLanche := nAltura - 6;     // Altura máxima para colocação do texto no grid
      nC := 0;
      nR := 0;
      uDM.Itens.FindNearest([1,0]);
      while (uDM.ItensGrupo.AsInteger = 1) and (not uDM.Itens.Eof) do
      begin
        wCodLanche[nC,nR] := uDM.ItensCodigo.AsInteger;
        nC := nC + 1;
        if nC > (nCols-1) then
        begin
          nC := 0;
          nR := nR + 1;
        end;
        uDM.Itens.Next;
      end;
    end;
    //
    if TSBebidas.TabVisible then
    begin
      FDQuery1.SQL.Text := 'Select Count(*) as nRegs from com_itens where grupo=3';
      FDQuery1.Open;
      qtdBebidas := FDQuery1.FieldByName('nRegs').AsInteger;
      TSBebidas.Caption := ObtemParametro('BebidasIdent','< Bebidas >');
      nCols := StrToIntDef(ObtemParametro('BebidasColunas','4'),4);
      if nCols < 4 then
        nCols := 4;
      if nCols > 8 then
        nCols := 8;
      nAltura := StrToIntDef(ObtemParametro('BebidasAltura','100'),100);
      if nAltura < 76 then
        nAltura := 76;
      if nAltura > 500 then
        nAltura := 500;
      nLargura := ((TSBebidas.Width - lrgScroll) div nCols);        // Largura da célula
      nRows := qtdBebidas div nCols;                                // Linhas necessárias
      if nRows < 1 then
        nRows := 1;
      if (qtdBebidas mod nRows) > 0 then
        nRows := nRows + 1;
      GridBebidas.ColCount := nCols;
      for i := 0 to nCols-1 do
        GridBebidas.ColWidths[i] := nLargura;
      GridBebidas.RowCount := nRows;
      for i := 0 to nRows-1 do
        GridBebidas.RowHeights[i] := nAltura;
      GridBebidas.Align := alClient;
      lrgBebida := nLargura - 12;   // Para definir o tamanho do texto
      altBebida := nAltura - 6;     // Altura máxima para colocação do texto no grid
      nC := 0;
      nR := 0;
      uDM.Itens.FindNearest([3,0]);
      while (uDM.ItensGrupo.AsInteger = 3) and (not uDM.Itens.Eof) do
      begin
        wCodBebida[nC,nR] := uDM.ItensCodigo.AsInteger;
        nC := nC + 1;
        if nC > (nCols-1) then
        begin
          nC := 0;
          nR := nR + 1;
        end;
        uDM.Itens.Next;
      end;
    end;
    //
    if TSDrinks.TabVisible then
    begin
      FDQuery1.SQL.Text := 'Select Count(*) as nRegs from com_itens where grupo=35';
      FDQuery1.Open;
      qtdDrinks := FDQuery1.FieldByName('nRegs').AsInteger;
      TSDrinks.Caption := ObtemParametro('DrinksIdent','< Drinks >');
      nCols := StrToIntDef(ObtemParametro('DrinksColunas','4'),4);
      if nCols < 4 then
        nCols := 4;
      if nCols > 8 then
        nCols := 8;
      nAltura := StrToIntDef(ObtemParametro('DrinksAltura','100'),100);
      if nAltura < 80 then
        nAltura := 80;
      if nAltura > 500 then
        nAltura := 500;
      nLargura := ((TSDrinks.Width - lrgScroll) div nCols);         // Largura da célula
      nRows := qtdDrinks div nCols;                                 // Linhas necessárias
      if nRows < 1 then
        nRows := 1;
      if (qtdDrinks mod nRows) > 0 then
        nRows := nRows + 1;
      GridDrinks.ColCount := nCols;
      for i := 0 to nCols-1 do
        GridDrinks.ColWidths[i] := nLargura;
      GridDrinks.RowCount := nRows;
      for i := 0 to nRows-1 do
        GridDrinks.RowHeights[i] := nAltura;
      GridDrinks.Align := alClient;
      lrgDrinks := nLargura - 12;   // Para definir o tamanho do texto
      altDrinks := nAltura - 6;     // Altura máxima para colocação do texto no grid
      nC := 0;
      nR := 0;
      uDM.Itens.FindNearest([35,0]);
      while (uDM.ItensGrupo.AsInteger = 35) and (not uDM.Itens.Eof) do
      begin
        wCodDrinks[nC,nR] := uDM.ItensCodigo.AsInteger;
        nC := nC + 1;
        if nC > (nCols-1) then
        begin
          nC := 0;
          nR := nR + 1;
        end;
        uDM.Itens.Next;
      end;
    end;
    //
    if TSFrituras.TabVisible then                  // Aba FRITURAS
    begin
      FDQuery1.SQL.Text := 'Select Count(*) as nRegs from com_itens where grupo=21';
      FDQuery1.Open;
      qtdFrituras := FDQuery1.FieldByName('nRegs').AsInteger;
      TSFrituras.Caption := ObtemParametro('FriturasIdent','< Frituras >');
      nCols := StrToInt(ObtemParametro('FriturasColunas','4'));
      if nCols < 3 then
        nCols := 3;
      if nCols > 8 then
        nCols := 8;
      nAltura := StrToIntDef(ObtemParametro('FriturasAltura','180'),180);
      if nAltura < 100 then
        nAltura := 100;
      if nAltura > 500 then
        nAltura := 500;
      nLargura := ((TSFrituras.Width - lrgScroll) div nCols);        // Largura da célula
      nRows := qtdFrituras div nCols;                                // Linhas necessárias
      if nRows < 1 then
        nRows := 1;
      if (qtdFrituras mod nRows) > 0 then
        nRows := nRows + 1;
      GridFrituras.ColCount := nCols;
      for i := 0 to nCols-1 do
        GridFrituras.ColWidths[i] := nLargura;
      GridFrituras.RowCount := nRows;
      for i := 0 to nRows-1 do
        GridFrituras.RowHeights[i] := nAltura;
      GridFrituras.Align := alClient;
      lrgFritura := nLargura - 12;   // Para definir o tamanho do texto
      altFritura := nAltura - 6;     // Altura máxima para colocação do texto no grid
      nC := 0;
      nR := 0;
      uDM.Itens.FindNearest([21,0]);
      while (uDM.ItensGrupo.AsInteger = 21) and (not uDM.Itens.Eof) do
      begin
        wCodFritura[nC,nR] := uDM.ItensCodigo.AsInteger;
        nC := nC + 1;
        if nC > (nCols-1) then
        begin
          nC := 0;
          nR := nR + 1;
        end;
        uDM.Itens.Next;
      end;
    end;
    //
    if TSHamburgueres.TabVisible then                  // Aba Hamburgueres
    begin
      FDQuery1.SQL.Text := 'Select Count(*) as nRegs from com_itens where grupo=31';
      FDQuery1.Open;
      qtdHamburg := FDQuery1.FieldByName('nRegs').AsInteger;
      TSHamburgueres.Caption := ObtemParametro('HamburgueresIdent','< Hamburgueres >');
      nCols := StrToInt(ObtemParametro('HamburgueresColunas','4'));
      if nCols < 3 then
        nCols := 3;
      if nCols > 8 then
        nCols := 8;
      nAltura := StrToIntDef(ObtemParametro('HamburgueresAltura','180'),180);
      if nAltura < 100 then
        nAltura := 100;
      if nAltura > 500 then
        nAltura := 500;
      nLargura := ((TSHamburgueres.Width - lrgScroll) div nCols);        // Largura da célula
      nRows := qtdHamburg div nCols;                                     // Linhas necessárias
      if nRows < 1 then
        nRows := 1;
      if (qtdHamburg mod nRows) > 0 then
        nRows := nRows + 1;
      GridHamburg.ColCount := nCols;
      for i := 0 to nCols-1 do
        GridHamburg.ColWidths[i] := nLargura;
      GridHamburg.RowCount := nRows;
      for i := 0 to nRows-1 do
        GridHamburg.RowHeights[i] := nAltura;
      GridHamburg.Align := alClient;
      lrgHamburg := nLargura - 12;   // Para definir o tamanho do texto
      altHamburg := nAltura - 6;     // Altura máxima para colocação do texto no grid
      nC := 0;
      nR := 0;
      uDM.Itens.FindNearest([31,0]);
      while (uDM.ItensGrupo.AsInteger = 31) and (not uDM.Itens.Eof) do
      begin
        wCodHamburg[nC,nR] := uDM.ItensCodigo.AsInteger;
        nC := nC + 1;
        if nC > (nCols-1) then
        begin
          nC := 0;
          nR := nR + 1;
        end;
        uDM.Itens.Next;
      end;
    end;
    //
    if TSMontagem.TabVisible then                  // Aba Monte seu lanche
    begin
      FDQuery1.SQL.Text := 'Select Count(*) as nRegs from com_itens where grupo=4';
      FDQuery1.Open;
      qtdBasico := FDQuery1.FieldByName('nRegs').AsInteger;
      TSMontagem.Caption := ObtemParametro('MontagemIdent','< Monte seu lanche >');
      nCols := StrToInt(ObtemParametro('MontagemColunas','4'));
      if nCols < 3 then
        nCols := 3;
      if nCols > 8 then
        nCols := 8;
      nAltura := StrToIntDef(ObtemParametro('MontagemAltura','180'),180);
      if nAltura < 100 then
        nAltura := 100;
      if nAltura > 500 then
        nAltura := 500;
      nLargura := ((TSMontagem.Width - lrgScroll) div nCols);        // Largura da célula
      nRows := qtdBasico div nCols;                                     // Linhas necessárias
      if nRows < 1 then
        nRows := 1;
      if (qtdBasico mod nRows) > 0 then
        nRows := nRows + 1;
      GridBasico.ColCount := nCols;
      for i := 0 to nCols-1 do
        GridBasico.ColWidths[i] := nLargura;
      GridBasico.RowCount := nRows;
      for i := 0 to nRows-1 do
        GridBasico.RowHeights[i] := nAltura;
      GridBasico.Align := alClient;
      lrgBasico := nLargura - 12;   // Para definir o tamanho do texto
      altBasico := nAltura - 6;     // Altura máxima para colocação do texto no grid
      nC := 0;
      nR := 0;
      uDM.Itens.FindNearest([4,0]);
      while (uDM.ItensGrupo.AsInteger = 4) and (not uDM.Itens.Eof) do
      begin
        wCodBasico[nC,nR] := uDM.ItensCodigo.AsInteger;
        nC := nC + 1;
        if nC > (nCols-1) then
        begin
          nC := 0;
          nR := nR + 1;
        end;
        uDM.Itens.Next;
      end;
    end;

{
    if TSBufDiv.TabVisible then                  // Aba Buffet de sorvetes && Diversos
    begin
      TSBufDiv.Caption := ObtemParametro('LanctoBufDiv');
      if TSBufDiv.Caption = '' then TSBufDiv.Caption := '< Sorvetes && Diversos >';
    end;
}
    //
    // DBNavigator do pedido
    NavPedido.Left      := 4;
    NavPedido.Width     := 120;
    btEditar.Left       := NavPedido.Left + NavPedido.Width + 4;
    btEditar.Width      :=(PanPedCtle.Width - (btEditar.Left + 8)) div 2;
    btEditar.Caption    := 'Alterar' + #13 + 'ítem';
    btExcluir.Left      := btEditar.Left + btEditar.Width + 4;
    btExcluir.Width     := btEditar.Width;
    btExcluir.Caption   := 'Excluir' + #13 + 'ítem';
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
  FuPedBalcaoV2.totalPedido := 0;
  FuPedBalcaoV2.itensPedido := uDM.PedWrk.RecordCount;
  nrLcto := uDM.PedWrkNrLcto.AsInteger;
  uDM.PedWrk.First;
  while not uDM.PedWrk.Eof do
  begin
    FuPedBalcaoV2.totalPedido := FuPedBalcaoV2.totalPedido + uDM.PedWrkVlrTotal.AsCurrency;
    uDM.PedWrk.Next;
  end;
  uDM.PedWrk.FindKey([nrLcto]);
  FuPedBalcaoV2.edItens.Text := IntToStr(FuPedBalcaoV2.itensPedido);
  FuPedBalcaoV2.edTotal.Text := FloatToStrF(FuPedBalcaoV2.totalPedido,ffNumber,15,2);
  FuPedBalcaoV2.btDummy.SetFocus;

end;


Procedure InclueBuffet;
var nLct: Integer;
    wDescr: String;
    wValor: Currency;
begin
  with uDM
  do begin
    if not uDM.Itens.FindKey([15,1]) then Exit;
    wDescr := stringReplace(uDM.ItensDescricao.AsString,'#','',[rfIgnoreCase, rfReplaceAll]);
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


Procedure InclueProdBalcaoV2(pTipo:Integer;         // Cachorro-quente, fritura, hamburguer...
                             pCodProd:Integer;      // Código do produto
                             pExtras:String;        // Extras
                             pObserv:String;        // Observ
                             pValor:Currency=0);    // Valor considerado
// 3-Bebidas e 35-Drinks não são tratados aqui
var nLct: Integer;
    wDescr,wExtra,wObserv: String;
    wValor,wTotal: Currency;
    wAltPr: Boolean;
    wPeso,wQuant: Integer;
    wKg: Real;
begin
  with uDM
  do begin
    FuPedBalcaoV2.FormResize(nil);
    wExtra := pExtras;         // Comum a todos (exceto cachorro quente)
    wObserv := pObserv;        // Comum
    wValor := pValor;          //
    wPeso := 0;                // Utilizado somente em buffet de sorvete
    if not uDM.Itens.FindKey([pTipo,pCodProd]) then
    begin
      MessageDlg('Item: ' + IntToStr(pTipo) + '-' + IntToStr(pCodProd) + '  Inexistente',
                 mtError,[mbOk],0);
      Exit;
    end;
    wDescr := stringReplace(uDM.ItensDescricao.AsString,'#','',[rfIgnoreCase, rfReplaceAll]);
    wValor := uDM.ItensPreco.AsCurrency;
    wAltPr := uDM.ItensAlteraPreco.AsBoolean;
    wExtra := stringFiller('.',100);
    wTotal := wValor;
    wQuant := 1;
    //
    if pTipo = 6 then
    begin        // Diversos  (Cód.barras)
      wDescr := uDM.CDDiversosDescr.AsString;
      wValor := uDM.CDDiversosVlrUnit.AsCurrency;
      wAltPr := False;
      wExtra := '';
      wObserv := '';
      wTotal := uDM.CDDiversosVlrTotal.AsCurrency;
      wQuant := uDM.CDDiversosQuant.AsInteger;
    end;
    if pTipo = 15 then      // Buffet sorvete  (Obtem dados de CDBuffet)
    begin
      if uDM.CDBuffet.RecordCount = 0 then
        Exit;
      wKg := uDM.CDBuffetPeso.AsInteger / 1000;
      wDescr := Trim(stringReplace(uDM.CDBuffetDescr.AsString,'#','',[rfIgnoreCase, rfReplaceAll])) +
                '(' + FloatToStrF(wKg,ffNumber,8,3) + 'Kg)';
      wValor := uDM.CDBuffetVlrUnit.AsCurrency;
      wAltPr := False;
      wTotal := uDM.CDBuffetZC_Valor.AsCurrency;
      wPeso  := uDM.CDBuffetPeso.AsInteger;
      wObserv := wDescr;
      wQuant := 1;
    end;
    //
    PedWrk.Last;
    nLct := PedWrkNrLcto.AsInteger + 1;
    PedWrk.Append;
    PedWrkNrLcto.AsInteger    := nLct;
    PedWrkTpProd.AsInteger    := pTipo;
    PedWrkCodProd.AsInteger   := pCodProd;
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
    //
    if pTipo in [1,4,21,31] then
      TratativaExtrasV2(pTipo, pCodProd, True, nMaxExtras);
    //
    if PedWrk.State = dsEdit then
       PedWrk.Post;
    TotalizaPedidoBalcao;
  end;

end;

Procedure AlteraLancheV2;
var nSeq,nTipo,nProd: Integer;
begin
  nSeq  := uDM.PedWrkNrLcto.AsInteger;
  nTipo := uDM.PedWrkTpProd.AsInteger;
  nProd := uDM.PedWrkCodProd.AsInteger;
  uDM.PedWrk.Edit;
  TratativaExtrasV2(nTipo, nProd, False, nMaxExtras);
  //TratativaLanchesV2(nProd,False,nMaxExtras);
  if uDM.PedWrk.State = dsEdit
     then uDM.PedWrk.Post;
  TotalizaPedidoBalcao;

end;

Procedure AlteraProdutoV2(pTipo:Integer);    // AlteraBebidaV2;
begin
  with FuPedBalcaoV2
  do begin
    PanAlteraProduto.Visible := True;
    case pTipo of
      3:Panel2.Caption := 'Bebida';
     35:Panel2.Caption := 'Drink';
    end;
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


Procedure AlteraFrituraV2;
var nSeq,nTipo,nProd: Integer;
begin
  nSeq  := uDM.PedWrkNrLcto.AsInteger;
  nTipo := uDM.PedWrkTpProd.AsInteger;
  nProd := uDM.PedWrkCodProd.AsInteger;
  uDM.PedWrk.Edit;
  TratativaExtrasV2(nTipo, nProd, False, nMaxExtras);
  if uDM.PedWrk.State = dsEdit
     then uDM.PedWrk.Post;
  TotalizaPedidoBalcao;

end;



Procedure InclueBebidaV2(pNrBebida:Integer);
var nSeq: Integer;
    lExiste,lProcura: Boolean;
begin
  if not uDM.Itens.FindKey([3,pNrBebida]) then
    Exit;
  with uDM
  do begin
    lExiste := False;
    lProcura := True;
    PedWrk.First;
    // Verifica se a bebida já existe no pedido
    while lProcura
    do begin
      if (PedWrkTpProd.AsInteger = 3) and (PedWrkCodProd.AsInteger = pNrBebida)
      then begin
        lExiste := True;
        lProcura := False;
      end
      else PedWrk.Next;
      if PedWrk.Eof then
        lProcura := False;
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
      PedWrkDescricao.AsString  := stringReplace(ItensDescricao.AsString,'#','',[rfIgnoreCase, rfReplaceAll]);
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
    then FuPedBalcaoV2.PanAlteraProduto.Visible := False;

end;


Procedure InclueDrinkV2(pNrDrink:Integer);
var nSeq: Integer;
    lExiste,lProcura: Boolean;
begin
  if not uDM.Itens.FindKey([35,pNrDrink]) then
    Exit;
  with uDM
  do begin
    lExiste := False;
    // Verifica se o drink já existe no pedido (Somente os que não tem sabores diferenciados DescrCompleta='')
    if uDM.ItensDescrCompleta.AsString = '' then
    begin
      lProcura := True;
      PedWrk.First;
      while lProcura
      do begin
        if (PedWrkTpProd.AsInteger = 35) and (PedWrkCodProd.AsInteger = pNrDrink)
        then begin
          lExiste := True;
          lProcura := False;
        end
        else PedWrk.Next;
        if PedWrk.Eof then
          lProcura := False;
      end;
    end;
    //
    if lExiste then
    begin          // Altera qtd do drink;
      nSeq := PedWrkNrLcto.AsInteger;
      PedWrk.Edit;
      PedWrkQuant.AsInteger := PedWrkQuant.AsInteger + 1;
      PedWrkVlrTotal.AsCurrency := PedWrkVlrUnit.AsCurrency * PedWrkQuant.AsInteger;
      PedWrk.Post;
    end
    else begin     // Inclue drink
      wSaborDrink := ObtemSaborDrink(uDM.ItensDescricao.AsString,uDM.ItensDescrCompleta.AsString);
      PedWrk.Last;
      nSeq := PedWrkNrLcto.AsInteger + 1;
      PedWrk.Append;
      PedWrkNrLcto.AsInteger    := nSeq;
      PedWrkTpProd.AsInteger    := 35;
      PedWrkCodProd.AsInteger   := pNrDrink;
      PedWrkDescricao.AsString  := stringReplace(ItensDescricao.AsString,'#','',[rfIgnoreCase, rfReplaceAll]);
      PedWrkQuant.AsInteger     := 1;
      PedWrkVlrUnit.AsCurrency  := ItensPreco.AsCurrency;
      PedWrkVlrTotal.AsCurrency := ItensPreco.AsCurrency;
      PedWrkExtras.AsString     := stringFiller('.',48);
      PedWrkObserv.AsString     := wSaborDrink;
      PedWrk.Post;
    end;
  end;
  TotalizaPedidoBalcao;

end;


procedure AjustaFonteGridDrinks;
begin
  with FuPedBalcaoV2
  do begin
    GridDrinks.Canvas.Font.Name := LabAux1.Font.Name;
    GridDrinks.Canvas.Font.Size := LabAux1.Font.Size;
    GridDrinks.Canvas.Font.Style := LabAux1.Font.Style;
    GridDrinks.Canvas.Font.Color := LabAux1.Font.Color;

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

procedure TFuPedBalcaoV2.btCancelarClick(Sender: TObject);
begin
  PanAlteraProduto.Visible := False;
  PanWork.Visible := False;
  if ObtemParametro('LanctoCancelar') = 'N' then
    btAbrirPedidoClick(nil)
  else
    btAbrirPedido.SetFocus;

end;

procedure TFuPedBalcaoV2.btEditarClick(Sender: TObject);
begin
  if uDM.PedWrk.RecordCount = 0 then
    Exit;


  case uDM.PedWrkTpProd.AsInteger of
    1:AlteraLancheV2;
    4:SHowMessage('AlteraMontagem');    // AlteraMontagem;
    6:ShowMessage('AlteraDiversos');
    11:ShowMessage('AlteraCrepe');
    21:AlteraFrituraV2;
    31:ShowMessage('AlteraHamburguer');
    else AlteraProdutoV2(uDM.PedWrkTpProd.AsInteger);         // 3-Bebida  35-Drink
  end;

end;

procedure TFuPedBalcaoV2.btExcluirClick(Sender: TObject);
begin
  if uDM.PedWrk.RecordCount = 0 then Exit;
  if MessageDlg('Excluir ' + uDM.PedWrkDescricao.AsString + ' ?',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
  then begin
    uDM.Pedwrk.Delete;
    TotalizaPedidoBalcao;
  end;

end;

procedure TFuPedBalcaoV2.btFinalizarClick(Sender: TObject);
var nRet,nroPedido: Integer;
    lstPedido: String;
begin
  PanAlteraProduto.Visible := False;
  nRet := 0;
  if FuPedBalcaoV2.totalPedido > 0 then
  begin            // Pedido COM valor
    nRet := FinalizaPedido(nroPedido, FuPedBalcaoV2.totalPedido, FuPedBalcaoV2.itensPedido);
    {  nRet:1 Retornar à pagina anterior (incluir novos lançamentos)
       nRet:0 Pedido finalizado    }
    if nRet = 0 then       // Pedido finalizado
    begin
      DebugMensagem(uDM.lDebug,'Gravou pedido, atualizou caixa e emitiu NFCe(se for o caso)' + #13 +
                               'Vai imprimir pedido nr: ' + IntToStr(nroPedido));
      if (nroPedido > 0) and uDM.sysImprimePedido then
      begin
        lstPedido := ObtemParametro('PedidoImprimir');
        if Pos(lstPedido,'SNQ') = 0 then lstPedido := 'Q';       // Sim  Não  Questiona
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
  // nRet = 3 --> Pedido whatsapp... já foi impresso
  // nRet = 1 --> Volta à tela anterior
  if nRet <> 1 then       // Novo pedido ou pedido cancelado
  begin
    PanWork.Visible := False;
    if ObtemParametro('LanctoFinalizar') = 'N' then
      btAbrirPedidoClick(nil)
    else
      btAbrirPedido.SetFocus;
  end;

end;

procedure TFuPedBalcaoV2.btAcrescBuffetClick(Sender: TObject);
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

procedure TFuPedBalcaoV2.btAcrescDiversosClick(Sender: TObject);
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

procedure TFuPedBalcaoV2.btMaisClick(Sender: TObject);
begin
  BebidaMaisMenos(True);

end;

procedure TFuPedBalcaoV2.btMenosClick(Sender: TObject);
begin
  BebidaMaisMenos(False);
  if uDM.PedWrkQuant.AsInteger = 0 then btNadaClick(nil);

end;

procedure TFuPedBalcaoV2.btMontarLancheClick(Sender: TObject);
begin
{
  InclueProdBalcaoV2(4,0,'','');           // Lanche 'montado'
  MontagemDoLanche(True);
  TotalizaPedidoBalcao;
}
  SHowMessage('Aba montagem....');

end;

procedure TFuPedBalcaoV2.btNadaClick(Sender: TObject);
begin
  PanAlteraProduto.Visible := False;
  btDummy.SetFocus;

end;

procedure TFuPedBalcaoV2.btNrCancClick(Sender: TObject);
begin
  //edNrPedido.Text := '';
  PanBuscaPedido.Visible := False;
  btAbrirPedido.SetFocus;

end;

procedure TFuPedBalcaoV2.btNrOkClick(Sender: TObject);
var nPos,wNrPedido: Integer;
    xPedido: String;
begin
  xPedido := cbPedidos.Text + ' x';
  nPos := Pos(' ',xPedido);
  wNrPedido := StrToIntDef(Copy(xPedido,1,nPos-1),0);
  if not uDM.Pedidos.FindKey([wNrPedido]) then
  begin
    MessageDlg('Pedido ' + IntToStr(wNrPedido) + ' não encontrado, reinforme',mtError,[mbOk],0);
    cbPedidos.SetFocus;
    Exit;
  end;
  if uDM.PedidosTurno.AsInteger <> uDM.turnoCorrente then
    if MessageDlg('Pedido: ' + IntToStr(wNrPedido) + '   Turno: ' + uDM.PedidosTurno.AsString +
                  '   Turno atual: ' + IntToStr(uDM.turnoCorrente) + #13 +
                  'utilizar ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) <> mrYes
    then begin
      cbPedidos.SetFocus;
      Exit;
    end;
  PanBuscaPedido.Visible := False;
  //
  // ShowMessage('Usar pedido nr: ' + intToStr(wNrPedido));
  //
  pgControleBalV2.ActivePageIndex := uDM.sysIniBalcao;
  pgControleBalV2Change(nil);
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
  FuPedBalcaoV2.FormResize(nil);
  btDummy.SetFocus;

end;

procedure TFuPedBalcaoV2.btConfirmaBuffetClick(Sender: TObject);
begin
  if uDM.CDBuffetPeso.AsInteger = 0 then
  begin
    uDM.CDBuffet.Cancel;
    edPeso.Enabled := False;
    btFinalizar.SetFocus;
    Exit;
  end;
  uDM.CDBuffet.Post;
  InclueProdBalcaoV2(15,1,'','');             // Sorvete
  uDM.PedWrk.Post;
  TotalizaPedidoBalcao;
  FuPedBalcaoV2.FormResize(nil);
  uDM.CDBuffet.Delete;
  edPeso.Enabled := False;
  btDummy.SetFocus;

end;

procedure TFuPedBalcaoV2.btConfirmaDiversosClick(Sender: TObject);
begin
  if uDM.CDDiversosQuant.AsInteger = 0 then
  begin
    uDM.CDDiversos.Cancel;
    btFinalizar.SetFocus;
    Exit;
  end;
  uDM.CDDiversos.Post;
  InclueProdBalcaoV2(uDM.CDDiversosCodGrupo.AsInteger,            // Diversos
                     uDM.CDDiversosCodItem.AsInteger,
                     '','');
  uDM.PedWrk.Post;
  TotalizaPedidoBalcao;
  FuPedBalcaoV2.FormResize(nil);
  uDM.CDDiversos.Delete;
  btDummy.SetFocus;

end;

procedure TFuPedBalcaoV2.ApdComPortTriggerAvail(CP: TObject; Count: Word);
Var
  I: Integer;
  C: AnsiChar;
  S2: String;
begin
  If pgControleBalV2.ActivePage <> TSBufDiv Then
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

procedure TFuPedBalcaoV2.ApdComPortTriggerLineError(CP: TObject; Error: Word;
  LineBreak: Boolean);
begin
  S:= EmptyStr;
  FApdComPort.Open:= False
end;

procedure TFuPedBalcaoV2.btAbrirPedidoClick(Sender: TObject);
begin
  DefineFontesDrawGrids;
  Try
    pgControleBalV2.ActivePageIndex := uDM.sysIniBalcao;
  Except
    pgControleBalV2.ActivePageIndex := 0;
  End;
  Sleep(200);
  //
  uDM.sysAtivo := 'BALCAO';
  uDM.sysPedePlaca := True;
  if CriaAbrePedidoWrk(0) <> 0 then
    Exit;
  itensPedido := 0;
  edItens.Text := IntToStr(itensPedido);
  totalPedido := 0;
  edTotal.Text := FloatToStrF(totalpedido,ffCurrency,15,2);
  PanWork.Visible := True;
  FuPedBalcaoV2.FormResize(nil);
  btDummy.SetFocus;

end;

procedure TFuPedBalcaoV2.btSairClick(Sender: TObject);
begin
  FuPedBalcaoV2.Close;

end;

procedure TFuPedBalcaoV2.cbPedidosExit(Sender: TObject);
begin
  if cbPedidos.Text <> '' then
    btNrOk.SetFocus
  else btNrCanc.SetFocus;

end;

procedure TFuPedBalcaoV2.CriarApdComPortV2;
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

procedure TFuPedBalcaoV2.edCodBarrasDblClick(Sender: TObject);
begin
  tvLeft := genLeft + edCodBarras.Left - 3;
  tvTop := genTop + edCodBarras.Top + edCodBarras.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedBalcaoV2.edCodBarrasExit(Sender: TObject);
var wCdGrp,wCdBar: String;
begin
  Teclado.Visible := False;
  wCdBar := uDM.CDDiversosCodBarras.AsString;
  if wCdBar = '' then
    Exit;
  wCdGrp := edCodBarras.Text;
  while Length(Trim(wCdGrp)) < 3 do
    wCdGrp := '0' + wCdGrp;
  wCdGrp := '06' + wCdGrp;
  //
  uDM.CDItens.IndexName := '';
  if not uDM.CDItens.FindKey([wCdGrp]) then
  begin
    uDM.CDItens.IndexName := 'CODIGOBARRAS';
    if not uDM.CDItens.FindKey([wCdBar]) then
    begin
      MessageDlg('Código informado não existe no cadastro, reinforme',mtError,[mbOk],0);
      uDM.CDDiversosCodBarras.AsString := '';
      edCodBarras.SetFocus;
      Exit;
    end;
  end;
  uDM.CDDiversosQuant.AsInteger := 1;
  uDM.CDDiversosVlrUnit.AsCurrency := uDM.CDItensPreco.AsCurrency;
  uDM.CDDiversosVlrTotal.AsCurrency := uDM.CDDiversosQuant.AsInteger * uDM.CDItensPreco.AsCurrency;
  uDM.CDDiversosCodGrupo.AsInteger := uDM.CDItensGrupo.AsInteger;
  uDM.CDDiversosCodItem.AsInteger := uDM.CDItensCodigo.AsInteger;
  uDM.CDDiversosDescr.AsString := uDM.CDItensDescricao.AsString;

end;

procedure TFuPedBalcaoV2.edCodBarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedBalcaoV2.edCodBarrasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbRight then
    Exit;
  tvLeft := genLeft + edCodBarras.Left - 3;
  tvTop := genTop + edCodBarras.Top + edCodBarras.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedBalcaoV2.edDescrEnter(Sender: TObject);
begin
  tvLeft := genLeft + edDescr.Left - 3;
  tvTop := genTop + edDescr.Top + edDescr.Height + 3;
  ExibeTecladoVirtual('Standard',tvTop,tvLeft);

end;

procedure TFuPedBalcaoV2.edDescrExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuPedBalcaoV2.edGrupoEnter(Sender: TObject);
begin
  tvLeft := genLeft + edGrupo.Left - 3;
  tvTop := genTop + edGrupo.Top + edGrupo.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedBalcaoV2.edGrupoExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuPedBalcaoV2.edGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedBalcaoV2.edItemEnter(Sender: TObject);
begin
  tvLeft := genLeft + edItem.Left - 3;
  tvTop := genTop + edItem.Top + edItem.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedBalcaoV2.edItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedBalcaoV2.edPesoEnter(Sender: TObject);
begin
  if cbTVBuffet.Checked then
  begin
    tvLeft := genLeft + edPeso.Left - 3;
    tvTop := genTop + edPeso.Top + edPeso.Height + 3;
    ExibeTecladoVirtual('NumPad',tvTop,tvLeft);
  end;

end;

procedure TFuPedBalcaoV2.edPesoExit(Sender: TObject);
begin
  Teclado.Visible := False;
  btConfirmaBuffet.SetFocus;
//  btConfirmaBuffetClick(nil);

end;

procedure TFuPedBalcaoV2.edPesoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then
    SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedBalcaoV2.edQuantEnter(Sender: TObject);
begin
  tvLeft := genLeft + edQuant.Left - 3;
  tvTop := genTop + edQuant.Top + edQuant.Height + 3;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuPedBalcaoV2.edQuantExit(Sender: TObject);
begin
  Teclado.Visible := False;
  uDM.CDDiversosVlrTotal.AsCurrency := uDM.CDDiversosQuant.AsInteger * uDM.CDItensPreco.AsCurrency;
  uDM.CDDiversos.Post;
  uDM.CDDiversos.Edit;
  btConfirmaDiversos.SetFocus;

end;

procedure TFuPedBalcaoV2.edQuantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPedBalcaoV2.FormClose(Sender: TObject; var Action: TCloseAction);
var vIniFile: TIniFile;
begin
  // Se houve alteração de tamanho de fonte das abas, salva no .ini
  if (pgControleBalV2.Font.Size <> uDM.sysAbasFonte) or
     (pgControleBalV2.MultiLine <> uDM.sysAbasMultiline)
  then begin
    vIniFile := TIniFile.Create(uDM.sysIniFile);
     uDM.sysAbasFonte := pgControleBalV2.Font.Size;
    uDM.sysAbasMultiline := pgControleBalV2.MultiLine;
    vIniFile.WriteInteger('AbasPedidos','Fonte',uDM.sysAbasFonte);
    vIniFile.WriteBool('AbasPedidos','Multiline',uDM.sysAbasMultiline);
    vIniFile.Free;
  end;

end;

procedure TFuPedBalcaoV2.FormCreate(Sender: TObject);
begin
  Align := alClient;
  PanWork.Align := alClient;
  btAbrirPedido.Left := 20;
  btAbrirPedido.Top := 60;
  btAbrirPedido.Width := 220;
  btAbrirPedido.Height := 80;
  //
  btSair.Left := btAbrirPedido.Left;
  btSair.Top := btAbrirPedido.Top + btAbrirPedido.Height + 20;
  btSair.Width := btAbrirPedido.Width;
  btSair.Height := btAbrirPedido.Height;
  //
  cbTVBuffet.Checked     := False;
  cbBalConectada.Checked := False;
  //
  edItens.Text := '0';
  edTotal.Text := '0,00';
  //
  panBuffet.Height := 300;
  panDiversos.Height := 300;
  btConfirmaDiversos.Top := 150;

  CriarApdComPortV2;
  vTentativasLeituraBalanca:= 0;

  //btConfSabor.Caption := 'Confirma' + #13 + 'sabor';

end;

procedure TFuPedBalcaoV2.FormDestroy(Sender: TObject);
begin
  FApdComPort.Open:= False;

end;

procedure TFuPedBalcaoV2.FormResize(Sender: TObject);
begin
  PanTotalizaPedido.Width := FuPedBalcaoV2.Width div 4;    // PanWork.Width div 4;
  GridPedido := DefineGrid(GridPedido, [0.06, 0.33, 0.05, 0.22], 1, 0);

end;

procedure TFuPedBalcaoV2.FormShow(Sender: TObject);
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
  MontaTelaPedidosV2;
  btAbrirPedido.SetFocus;

end;

procedure TFuPedBalcaoV2.GridBasicoDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica o basico na célula
  wKey := wCodBasico[ACol,ARow];
  if wKey = 0 then
    Exit;   // Não há basico na célula
  if not uDM.Itens.FindKey([4,wKey]) then
    Exit;   // Hamburguer não encontrado
  GridBasico.Canvas.Brush.Style := bsClear;
  GridBasico.Canvas.FillRect(Rect);
  GridBasico.Color := clWhite;
  //
  if FileExists(uDM.ItensImagem.AsString) and (not uDM.usaCorItem)
  then begin
    wImagem := TImage.Create(nil);
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridBasico.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
    wImagem.Free;
  end
  else begin  // Não há imagem ou utiliza as cores dinamicamente, 'escreve/desenha' a identificação do Fritura
    LabAux1.Font.Name := wRegsFonte[5].Name;
    LabAux1.Font.Size := wRegsFonte[5].Size;
    LabAux1.Font.Style := wRegsFonte[5].Style;
    LabAux1.Font.Color := wRegsFonte[5].Color;
    LabAux2.Font := LabAux1.Font;
    LabAux1.Caption := '00';
    nTop := 8 + LabAux1.Height;    // Obtem 'top' para descrição
    //
    if uDM.ItensCorItem.AsString <> '' then
    begin
      Try
        GridBasico.Canvas.Brush.Color := StringToColor(uDM.ItensCorItem.AsString);
      Except
        GridBasico.Canvas.Brush.Color := clWhite;
      End;
    end
    else GridBasico.Canvas.Brush.Color := clWhite;
    GridBasico.Canvas.FillRect(Rect);
    //
    wTxt := Trim(AnsiLowerCase(Trim(uDM.ItensDescricao.AsString)));
    wTxt := AnsiUpperCase(Copy(wTxt,1,1)) + Copy(wTxt,2,Length(wTxt)-1);
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
    GridBasico.Canvas.Font := LabAux1.Font;
    GridBasico.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux1.Caption);
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 4;
      GridBasico.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux2.Caption);
    end;
  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Style := [];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then
    wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  GridBasico.Canvas.Font := LabAux1.Font;
  GridBasico.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  GridBasico.Canvas.Pen.Color := clBlack;
  GridBasico.Canvas.Pen.Width := 2;
  GridBasico.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridBasico.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+3);
  GridBasico.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+LabAux1.Height+3);
  GridBasico.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+3);
  GridBasico.Canvas.LineTo(Rect.Left+3, Rect.Top+3);

end;


procedure TFuPedBalcaoV2.GridBasicoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridHamburg.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodBasico[nCol,nLin];
  if wKey = 0 then
    Exit;
  InclueProdBalcaoV2(4,wKey,'','');

end;

procedure TFuPedBalcaoV2.GridBebidasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica a bebida na célula  - wRegsFonte[0]
  wKey := wCodBebida[ACol,ARow];
  if wKey = 0 then
    Exit;   // Não há bebida na célula
  if not uDM.Itens.FindKey([3,wKey]) then
    Exit;   // Bebida não encontrada
  GridBebidas.Canvas.Brush.Style := bsClear;
  GridBebidas.Canvas.FillRect(Rect);
  GridBebidas.Color := clWhite;
  //
  if FileExists(uDM.ItensImagem.AsString) and (not uDM.usaCorItem)
  then begin
    wImagem := TImage.Create(nil);
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridBebidas.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
    wImagem.Free;
  end
  else begin  // Não há imagem ou utiliza as cores dinamicamente, 'escreve/desenha' a identificação do lanche
    LabAux1.Font.Name := wRegsFonte[1].Name;
    LabAux1.Font.Size := wRegsFonte[1].Size;
    LabAux1.Font.Style := wRegsFonte[1].Style;
    LabAux1.Font.Color := wRegsFonte[1].Color;
    LabAux2.Font := LabAux1.Font;
    LabAux1.Caption := '00';
    nTop := 8 + LabAux1.Height;    // Obtem 'top' para descrição
    //
    if uDM.ItensCorItem.AsString <> '' then
    begin
      Try
        GridBebidas.Canvas.Brush.Color := StringToColor(uDM.ItensCorItem.AsString);
      Except
        GridBebidas.Canvas.Brush.Color := clWhite;
      End;
    end
    else GridBebidas.Canvas.Brush.Color := clWhite;
    GridBebidas.Canvas.FillRect(Rect);
    //
    wTxt := Trim(AnsiLowerCase(Trim(uDM.ItensDescricao.AsString)));
    wTxt := AnsiUpperCase(Copy(wTxt,1,1)) + Copy(wTxt,2,Length(wTxt)-1);
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
    GridBebidas.Canvas.Font := LabAux1.Font;
    GridBebidas.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux1.Caption);
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 2;
      GridBebidas.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux2.Caption);
    end;
  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Style := [];             // [fsBold];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then
    wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  GridBebidas.Canvas.Font := LabAux1.Font;
  GridBebidas.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  GridBebidas.Canvas.Pen.Color := clBlack;
  GridBebidas.Canvas.Pen.Width := 2;
  GridBebidas.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridBebidas.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+3);
  GridBebidas.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+LabAux1.Height+3);
  GridBebidas.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+3);
  GridBebidas.Canvas.LineTo(Rect.Left+3, Rect.Top+3);

end;


procedure TFuPedBalcaoV2.GridBebidasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  if PanAlteraProduto.Visible then
    PanAlteraProduto.Visible := False;
  GridBebidas.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodBebida[nCol,nLin];
  if wKey = 0 then
    Exit;
  InclueBebidaV2(wKey);
  FormResize(nil);

end;

procedure TFuPedBalcaoV2.GridDrinksDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica o drink na célula  - wRegsFonte[0]
  wKey := wCodDrinks[ACol,ARow];
  if wKey = 0 then
    Exit;   // Não há drink na célula
  if not uDM.Itens.FindKey([35,wKey]) then
    Exit;   // Drink não encontrado
  GridDrinks.Canvas.Brush.Style := bsClear;
  GridDrinks.Canvas.FillRect(Rect);
  GridDrinks.Color := clWhite;
  //
  if FileExists(uDM.ItensImagem.AsString) and (not uDM.usaCorItem)
  then begin
    wImagem := TImage.Create(nil);
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridBebidas.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
    wImagem.Free;
  end
  else begin  // Não há imagem ou utiliza as cores dinamicamente, 'escreve/desenha' a identificação do lanche
    LabAux1.Font.Name := wRegsFonte[2].Name;
    LabAux1.Font.Size := wRegsFonte[2].Size;
    LabAux1.Font.Style := wRegsFonte[2].Style;
    LabAux1.Font.Color := wRegsFonte[2].Color;
    LabAux2.Font := LabAux1.Font;
    LabAux1.Caption := '00';
    nTop := 8 + LabAux1.Height;    // Obtem 'top' para descrição
    //
    if uDM.ItensCorItem.AsString <> '' then
    begin
      Try
        GridDrinks.Canvas.Brush.Color := StringToColor(uDM.ItensCorItem.AsString);
      Except
        GridDrinks.Canvas.Brush.Color := clWhite;
      End;
    end
    else GridDrinks.Canvas.Brush.Color := clWhite;
    GridDrinks.Canvas.FillRect(Rect);
    //
    wTxt := Trim(AnsiLowerCase(Trim(uDM.ItensDescricao.AsString)));
    wTxt := AnsiUpperCase(Copy(wTxt,1,1)) + Copy(wTxt,2,Length(wTxt)-1);
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
    GridDrinks.Canvas.Font := LabAux1.Font;
    GridDrinks.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux1.Caption);
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 4;
      GridDrinks.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux2.Caption);
    end;
  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Style := [];             // [fsBold];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then
    wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  GridDrinks.Canvas.Font := LabAux1.Font;
  GridDrinks.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  GridDrinks.Canvas.Pen.Color := clBlack;
  GridDrinks.Canvas.Pen.Width := 2;
  GridDrinks.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridDrinks.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+3);
  GridDrinks.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+LabAux1.Height+3);
  GridDrinks.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+3);
  GridDrinks.Canvas.LineTo(Rect.Left+3, Rect.Top+3);
  //
  if uDM.ItensDescrCompleta.AsString <> '' then
  begin
    GridDrinks.Canvas.TextOut(Rect.Left+(Rect.Width-24),Rect.Top+12,'[*]');
  end;


end;

procedure TFuPedBalcaoV2.GridDrinksMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridDrinks.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodDrinks[nCol,nLin];
  if wKey = 0 then Exit;
  InclueDrinkV2(wKey);
  FormResize(nil);

end;

procedure TFuPedBalcaoV2.GridFriturasComplDrawCell(Sender: TObject; ACol,ARow: Integer; Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
{
  // Identifica o sabor do crepe na linha
  wKey := wCodFrituraCompl[ARow];
  if wKey = 0 then Exit;     // Não há complemento na linha
  if not uDM.Itens.FindKey([22,wKey]) then Exit;   // Complemento não encontrado
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
}
end;

procedure TFuPedBalcaoV2.GridFriturasComplMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,nCodCompl: Integer;
begin
{
  GridFriturasCompl.MouseToCell(X,Y,nCol,nLin);
  nCodCompl := wCodFrituraCompl[nLin];
  if wSelFrituraCompl[nLin] = '' then
    wSelFrituraCompl[nLin] := 'X'
  else
    wSelFrituraCompl[nLin] := '';
  GridFriturasCompl.Refresh;
}
end;


procedure TFuPedBalcaoV2.GridFriturasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica a fritura na célula
  wKey := wCodFritura[ACol,ARow];
  if wKey = 0 then
    Exit;   // Não há fritura na célula
  if not uDM.Itens.FindKey([21,wKey]) then
    Exit;   // Fritura não encontrado
  GridFrituras.Canvas.Brush.Style := bsClear;
  GridFrituras.Canvas.FillRect(Rect);
  GridFrituras.Color := clWhite;
  //
  if FileExists(uDM.ItensImagem.AsString) and (not uDM.usaCorItem)
  then begin
    wImagem := TImage.Create(nil);
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridFrituras.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
    wImagem.Free;
  end
  else begin  // Não há imagem ou utiliza as cores dinamicamente, 'escreve/desenha' a identificação do Fritura
    LabAux1.Font.Name := wRegsFonte[3].Name;
    LabAux1.Font.Size := wRegsFonte[3].Size;
    LabAux1.Font.Style := wRegsFonte[3].Style;
    LabAux1.Font.Color := wRegsFonte[3].Color;
    LabAux2.Font := LabAux1.Font;
    LabAux1.Caption := '00';
    nTop := 8 + LabAux1.Height;    // Obtem 'top' para descrição
    //
    if uDM.ItensCorItem.AsString <> '' then
    begin
      Try
        GridFrituras.Canvas.Brush.Color := StringToColor(uDM.ItensCorItem.AsString);
      Except
        GridFrituras.Canvas.Brush.Color := clWhite;
      End;
    end
    else GridFrituras.Canvas.Brush.Color := clWhite;
    GridFrituras.Canvas.FillRect(Rect);
    //
    wTxt := Trim(AnsiLowerCase(Trim(uDM.ItensDescricao.AsString)));
    wTxt := AnsiUpperCase(Copy(wTxt,1,1)) + Copy(wTxt,2,Length(wTxt)-1);
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
    GridFrituras.Canvas.Font := LabAux1.Font;
    GridFrituras.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux1.Caption);
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 4;
      GridFrituras.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux2.Caption);
    end;
  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Style := [];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then
    wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  GridFrituras.Canvas.Font := LabAux1.Font;
  GridFrituras.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  GridFrituras.Canvas.Pen.Color := clBlack;
  GridFrituras.Canvas.Pen.Width := 2;
  GridFrituras.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridFrituras.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+3);
  GridFrituras.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+LabAux1.Height+3);
  GridFrituras.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+3);
  GridFrituras.Canvas.LineTo(Rect.Left+3, Rect.Top+3);

end;

procedure TFuPedBalcaoV2.GridFriturasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridFrituras.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodFritura[nCol,nLin];
  if wKey = 0 then
    Exit;
  InclueProdBalcaoV2(21,wKey,'','');             // Fritura

end;


procedure TFuPedBalcaoV2.GridHamburgDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica o hamburguer na célula
  wKey := wCodHamburg[ACol,ARow];
  if wKey = 0 then
    Exit;   // Não há hamburguer célula
  if not uDM.Itens.FindKey([31,wKey]) then
    Exit;   // Hamburguer não encontrado
  GridHamburg.Canvas.Brush.Style := bsClear;
  GridHamburg.Canvas.FillRect(Rect);
  GridHamburg.Color := clWhite;
  //
  if FileExists(uDM.ItensImagem.AsString) and (not uDM.usaCorItem)
  then begin
    wImagem := TImage.Create(nil);
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridHamburg.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
    wImagem.Free;
  end
  else begin  // Não há imagem ou utiliza as cores dinamicamente, 'escreve/desenha' a identificação do Fritura
    LabAux1.Font.Name := wRegsFonte[4].Name;
    LabAux1.Font.Size := wRegsFonte[4].Size;
    LabAux1.Font.Style := wRegsFonte[4].Style;
    LabAux1.Font.Color := wRegsFonte[4].Color;
    LabAux2.Font := LabAux1.Font;
    LabAux1.Caption := '00';
    nTop := 8 + LabAux1.Height;    // Obtem 'top' para descrição
    //
    if uDM.ItensCorItem.AsString <> '' then
    begin
      Try
        GridHamburg.Canvas.Brush.Color := StringToColor(uDM.ItensCorItem.AsString);
      Except
        GridHamburg.Canvas.Brush.Color := clWhite;
      End;
    end
    else GridHamburg.Canvas.Brush.Color := clWhite;
    GridHamburg.Canvas.FillRect(Rect);
    //
    wTxt := Trim(AnsiLowerCase(Trim(uDM.ItensDescricao.AsString)));
    wTxt := AnsiUpperCase(Copy(wTxt,1,1)) + Copy(wTxt,2,Length(wTxt)-1);
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
    GridHamburg.Canvas.Font := LabAux1.Font;
    GridHamburg.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux1.Caption);
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 4;
      GridHamburg.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux2.Caption);
    end;
  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Style := [];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then
    wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  GridHamburg.Canvas.Font := LabAux1.Font;
  GridHamburg.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  GridHamburg.Canvas.Pen.Color := clBlack;
  GridHamburg.Canvas.Pen.Width := 2;
  GridHamburg.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridHamburg.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+3);
  GridHamburg.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+LabAux1.Height+3);
  GridHamburg.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+3);
  GridHamburg.Canvas.LineTo(Rect.Left+3, Rect.Top+3);

end;

procedure TFuPedBalcaoV2.GridHamburgMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridHamburg.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodHamburg[nCol,nLin];
  if wKey = 0 then
    Exit;
  InclueProdBalcaoV2(31,wKey,'','');

end;

procedure TFuPedBalcaoV2.GridLanchesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nPos: Integer;
    wImagem: TImage;
begin
  // Identifica o lanche na célula  - wRegsFonte[0]
  wKey := wCodLanche[ACol,ARow];
  if wKey = 0 then
    Exit;   // Não há lanche na célula
  if not uDM.Itens.FindKey([1,wKey]) then
    Exit;   // Lanche não encontrado
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
  else begin  // Não há imagem ou utiliza as cores dinamicamente, 'escreve/desenha' a identificação do lanche
    LabAux1.Font.Name := wRegsFonte[0].Name;
    LabAux1.Font.Size := wRegsFonte[0].Size;
    LabAux1.Font.Style := wRegsFonte[0].Style;
    LabAux1.Font.Color := wRegsFonte[0].Color;
    LabAux2.Font := LabAux1.Font;
    LabAux1.Caption := '00';
    nTop := 8 + LabAux1.Height;    // Obtem 'top' para descrição
    //
    if uDM.ItensCorItem.AsString <> '' then
    begin
      Try
        GridLanches.Canvas.Brush.Color := StringToColor(uDM.ItensCorItem.AsString);
      Except
        GridLanches.Canvas.Brush.Color := clWhite;
      End;
    end
    else GridLanches.Canvas.Brush.Color := clWhite;
    GridLanches.Canvas.FillRect(Rect);
    //
    wTxt := Trim(AnsiLowerCase(Trim(uDM.ItensDescricao.AsString)));
    wTxt := AnsiUpperCase(Copy(wTxt,1,1)) + Copy(wTxt,2,Length(wTxt)-1);
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
    GridLanches.Canvas.Font := LabAux1.Font;
    GridLanches.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux1.Caption);
    if LabAux2.Caption <> '' then
    begin
      nTop := nTop + LabAux1.Height + 4;
      GridLanches.Canvas.TextOut(Rect.Left+12,Rect.Top+nTop, LabAux2.Caption);
    end;
  end;
  LabAux1.Font.Name := 'Tahoma';
  LabAux1.Font.Style := [];
  LabAux1.Font.Color := clBlack;
  wTxt := IntToStr(wKey);
  if wKey < 10 then
    wTxt := '0' + wTxt;
  LabAux1.Caption := wTxt;
  GridLanches.Canvas.Font := LabAux1.Font;
  GridLanches.Canvas.TextOut(Rect.Left+6, Rect.Top+4, wTxt);
  GridLanches.Canvas.Pen.Color := clBlack;
  GridLanches.Canvas.Pen.Width := 2;
  GridLanches.Canvas.MoveTo(Rect.Left+3, Rect.Top+3);
  GridLanches.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+3);
  GridLanches.Canvas.LineTo(Rect.Left+LabAux1.Width+8, Rect.Top+LabAux1.Height+3);
  GridLanches.Canvas.LineTo(Rect.Left+3, Rect.Top+LabAux1.Height+3);
  GridLanches.Canvas.LineTo(Rect.Left+3, Rect.Top+3);

end;

procedure TFuPedBalcaoV2.GridLanchesMouseDown(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridLanches.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodLanche[nCol,nLin];
  if wKey = 0 then
    Exit;
  InclueProdBalcaoV2(1,wKey,'','');             // Cachorro quente Ok

end;

procedure TFuPedBalcaoV2.GridPedidoDblClick(Sender: TObject);
begin
  btEditarClick(nil);

end;

procedure TFuPedBalcaoV2.PanBuffetEnter(Sender: TObject);
begin
  // Left/Top para cada área que pode ter teclado virtual
  genLeft := PanWork.Left + PanPgControle.Left + pgControleBalV2.Left + TSBufDiv.Left + PanBuffet.Left;
  genTop := PanWork.Top + PanPgControle.Top + pgControleBalV2.Top + TSBufDiv.Top + PanBuffet.Top;

end;

procedure TFuPedBalcaoV2.PanDiversosEnter(Sender: TObject);
begin
  genLeft := PanWork.Left + PanPgControle.Left + pgControleBalV2.Left + TSBufDiv.Left + PanDiversos.Left;
  genTop := PanWork.Top + PanPgControle.Top + pgControleBalV2.Top + TSBufDiv.Top + PanDiversos.Top;

end;

procedure TFuPedBalcaoV2.pgControleBalV2Change(Sender: TObject);
begin
  btMontarLanche.Enabled := False;
  tBalanca.Enabled := False;
  if pgControleBalV2.ActivePage = TSLanches then
    btMontarLanche.Enabled := True;
  if pgControleBalV2.ActivePage = TSBufDiv then
    tBalanca.Enabled := True;
  {
  if pgControleBalV2.ActivePageIndex = 0 then      xxxx
    btMontarLanche.Enabled := True;
  if pgControleBalV2.ActivePageIndex = 5 then     xxx
    tBalanca.Enabled := True;
  }
end;

procedure TFuPedBalcaoV2.pgControleBalV2Changing(Sender: TObject; var AllowChange: Boolean);
begin
{
  case pgControleBalV2.ActivePage.PageIndex of
    3:btCancelaFrituraClick(nil);
    4:BtCancelaHamburguerClick(nil);
  end;
}
end;

procedure TFuPedBalcaoV2.sbAbasMaiorClick(Sender: TObject);
begin
  if pgControleBalV2.Font.Size > 46
     then Exit;
  pgControleBalV2.Font.Size := pgControleBalV2.Font.Size + 2;

end;

procedure TFuPedBalcaoV2.sbAbasMenorClick(Sender: TObject);
begin
  if pgControleBalV2.Font.Size < 14
     then Exit;
  pgControleBalV2.Font.Size := pgControleBalV2.Font.Size - 2;

end;

procedure TFuPedBalcaoV2.sbAbasMultiClick(Sender: TObject);
begin
  if pgControleBalV2.MultiLine
     then pgControleBalV2.MultiLine := False
     else pgControleBalV2.Multiline := True;

end;

procedure TFuPedBalcaoV2.tBalancaTimer(Sender: TObject);
begin
  if not cbBalConectada.checked then
    Exit;

  if pgControleBalV2.ActivePage <> TSBufDiv Then
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
    LabBal.Caption := 'Balança Ok'
  else
    LabBal.Caption := 'Balança desconectada';

end;

end.
