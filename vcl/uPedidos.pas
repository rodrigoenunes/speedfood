unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.CheckLst,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.UITypes;
  Procedure LancamentoPedidos;

type
  TFuPedidos = class(TForm)
    PanWork: TPanel;
    PanGridPed: TPanel;
    pgControle: TPageControl;
    TSLanches: TTabSheet;
    TSBebidas: TTabSheet;
    GridLanches: TDrawGrid;
    GridBebidas: TDrawGrid;
    PanPedCtle: TPanel;
    GridPedido: TDBGrid;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    NavPedido: TDBNavigator;
    PanAlteraBebida: TPanel;
    imgFundo: TImage;
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
    Label3: TLabel;
    btFinalizar: TBitBtn;
    btCancelar: TBitBtn;
    btDummy: TBitBtn;
    LabAux1: TLabel;
    LabAux2: TLabel;
    procedure btAbrirPedidoClick(Sender: TObject);
    procedure btFinalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
    itensPedido: Integer;
    totalPedido: Currency;

  end;

var
  FuPedidos: TFuPedidos;
  wCodLanche: array[0..19,0..19] of Integer;
  wCodBebida: array[0..19,0..19] of Integer;
  lrgLanche,altLanche,lrgBebida,altBebida: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas, uFinPedido, uTrataLanche, uBiblioteca;

Procedure LancamentoPedidos;
begin
  FuPedidos := TFuPedidos.Create(nil);
  FuPedidos.ShowModal;
  FuPedidos.Free;

end;


Procedure MontaTelaPedidos;
var i,j: Integer;
    nCol,nRow,nColBeb,nRowBeb: Integer;
    nAltura,nLargura: Integer;
    nLanches,nExtras,nBebidas,nDiversos:Integer;
begin
  // Monta tela de pedidos (FuPedidos) e tratativa de lanches (FuTrataLanche)
  with FuPedidos
  do begin
    for i := 0 to 19
    do for j := 0 to 19
       do begin
         wCodLanche[i,j] := 0;
         wCodBebida[i,j] := 0;
       end;
    FuPedidos.Align := alClient;
    //
    imgFundo.Top      := 0;
    imgFundo.Left     := 0;
    imgFundo.Stretch  := False;
    imgFundo.AutoSize := True;
    imgFundo.Picture.LoadFromFile(uDM.pathWork + '\imgFundo.BMP');
    imgFundo.AutoSize := False;
    imgFundo.Stretch  := True;
    while imgFundo.Height > (FuPedidos.ClientHeight-20) do
    begin
      imgFundo.Height := Trunc(imgFundo.Height * 0.99);
      imgFundo.Width  := Trunc(imgFundo.Width * 0.99);
    end;
    imgFundo.Top     := (FuPedidos.ClientHeight - imgFundo.Height) div 2;
    imgFundo.Left    := (FuPedidos.ClientWidth - imgFundo.Width) div 2;
    PanGridPed.Width := PanWork.Width div 4;    // (PanWork.Width div 5) * 2;
    PanGridPed.Align := alRight;
    pgControle.Align := alClient;
    // Obtem quantidade de ítens de cada grupo
    nLanches  := 0;
    nExtras   := 0;
    nBebidas  := 0;
    nDiversos := 0;
    uDM.Itens.First;
    while not uDM.Itens.Eof do
    begin
      case uDM.ItensGrupo.AsInteger of
        1:nLanches  := nLanches + 1;
        2:nExtras   := nExtras + 1;
        3:nBebidas  := nBebidas + 1;
        4:nDiversos := nDiversos + 1;
      end;
      uDM.Itens.Next;
    end;

    // Celulas ... COL, ROW
    // Montagem dos grids
    // Define largura das células, para LANCHES, de 2 a 4 COLUNAS ..............
    if TSLanches.Width > 1000
    then nCol := 4
    else if TSLanches.Width > 800
         then nCol := 3
         else nCol := 2;
    nLargura := (TSLanches.Width div nCol) - 8;      // Largura da célula
    nRow := nLanches div nCol;                       // Qtd necessária de linhas
    if nRow < 1
    then nRow := 1
    else if (nLanches mod nRow) > 0
         then nRow := nRow + 1;
    nAltura := ((TSLanches.Height-8) div nRow) - 4; // Altura da célula
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
    altLanche := nAltura - 6;     // Altura máxima para colocação do texto no grid
    //
    // Define largura das células, para Bebidas, de 2 a 5 COLUNAS ..............
    if TSBebidas.Width > 1000
    then nCol := 5
    else if TSBebidas.Width > 800
         then nCol := 4
         else if TSBebidas.Width > 600
              then nCol := 3
              else nCol := 2;
    nLargura := (TSBebidas.Width div nCol) - 2;          // Largura da célula
    nRow := nBebidas div nCol;                           // Qtd necessária de linhas
    if nRow < 1 
    then nRow := 1
    else if (nBebidas mod nCol) > 0
         then nRow := nRow + 1;
    nAltura := (TSBebidas.Height-8) div nRow;      // Altura da célula
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
    //
    nRow := 0;
    nCol := 0;
    nRowBeb := 0;
    nColBeb := 0;
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
      end;
      uDM.Itens.Next;
    end;
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
    btDummy.Left      := btCancelar.Left + btCancelar.Width + 16;
    btDummy.Top       := btCancelar.Top + 10;
    PanWork.Visible   := False;

 end;

end;

Procedure TotalizaPedido;
var nrLcto: Integer;
begin
  FuPedidos.totalPedido := 0;
  FuPedidos.itensPedido := uDM.PedWrk.RecordCount;
  nrLcto := uDM.PedWrkNrLcto.AsInteger;
  uDM.PedWrk.First;
  while not uDM.PedWrk.Eof do
  begin
    FuPedidos.totalPedido := FuPedidos.totalPedido + uDM.PedWrkVlrTotal.AsCurrency;
    uDM.PedWrk.Next;
  end;
  uDM.PedWrk.FindKey([nrLcto]);
  FuPedidos.edItens.Text := IntToStr(FuPedidos.itensPedido);
  FuPedidos.edTotal.Text := FloatToStrF(FuPedidos.totalPedido,ffNumber,15,2);
  FuPedidos.FormResize(nil);
  FuPedidos.btDummy.SetFocus;

end;

Procedure InclueLanche(pCodLanche:Integer);
var nLct: Integer;
begin
  if not uDM.Itens.FindKey([1,pCodLanche]) then Exit;
  with uDM
  do begin
    PedWrk.Last;
    nLct := PedWrkNrLcto.AsInteger + 1;
    PedWrk.Append;
    PedWrkNrLcto.AsInteger    := nLct;
    PedWrkTpProd.AsInteger    := 1;
    PedWrkCodProd.AsInteger   := pCodLanche;
    PedWrkDescricao.AsString  := stringReplace(ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
    PedWrkQuant.AsInteger     := 1;
    PedWrkVlrUnit.AsCurrency  := ItensPreco.AsCurrency;
    PedWrkVlrTotal.AsCurrency := ItensPreco.AsCurrency;
    PedWrkExtras.AsString     := stringFiller('.',24);
    PedWrkAltPreco.AsBoolean  := ItensAlteraPreco.AsBoolean;
    PedWrkCortado.AsBoolean   := False;
    PedWrkPrensado.AsBoolean  := False;
    PedWrk.Post;
    PedWrk.Edit;
    FuPedidos.FormResize(nil);
    TratativaLanche(pCodLanche,True);
    if PedWrk.State = dsEdit
       then PedWrk.Post;
  end;
  TotalizaPedido;

end;


Procedure AlteraLanche;
var nSeq,nProd: Integer;
begin
  nSeq  := uDM.PedWrkNrLcto.AsInteger;
  nProd := uDM.PedWrkCodProd.AsInteger;
  uDM.PedWrk.Edit;
  TratativaLanche(nProd,False);
  if uDM.PedWrk.State = dsEdit
     then uDM.PedWrk.Post;
  TotalizaPedido;

end;

Procedure AlteraBebida;
begin
  with FuPedidos
  do begin
    PanAlteraBebida.Visible := True;
    btNada.SetFocus;
  end;

end;


Procedure InclueBebida(pNrBebida:Integer);
var nSeq: Integer;
    lExiste,lProcura: Boolean;
begin
  if not uDM.Itens.FindKey([3,pNrBebida]) then Exit;
  lExiste := False;
  lProcura := True;
  uDM.PedWrk.First;
  while lProcura
  do begin
    if (uDM.PedWrkTpProd.AsInteger = 3) and
       (uDM.PedWrkCodProd.AsInteger = pNrBebida)
    then begin
      lExiste := True;
      lProcura := False;
    end
    else uDM.PedWrk.Next;
    if uDM.PedWrk.Eof then lProcura := False;
  end;
  if lExiste then
  begin
    nSeq := uDM.PedWrkNrLcto.AsInteger;
    uDM.PedWrk.Edit;
    uDM.PedWrkQuant.AsInteger := uDM.PedWrkQuant.AsInteger + 1;
    uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency * uDM.PedWrkQuant.AsInteger;
    uDM.PedWrk.Post;
    //AlteraBebida;
  end
  else begin
    uDM.PedWrk.Last;
    nSeq := uDM.PedWrkNrLcto.AsInteger + 1;
    uDM.PedWrk.Append;
    uDM.PedWrkNrLcto.AsInteger    := nSeq;
    uDM.PedWrkTpProd.AsInteger    := 3;
    uDM.PedWrkCodProd.AsInteger   := pNrBebida;
    uDM.PedWrkDescricao.AsString  := uDM.ItensDescricao.AsString;
    uDM.PedWrkQuant.AsInteger     := 1;
    uDM.PedWrkVlrUnit.AsCurrency  := uDM.ItensPreco.AsCurrency;
    uDM.PedWrkVlrTotal.AsCurrency := uDM.ItensPreco.AsCurrency;
    uDM.PedWrkExtras.AsString     := stringFiller('.',24);
    uDM.PedWrk.Post;
  end;
  TotalizaPedido;

end;

Procedure BebidaMaisMenos(pMais:Boolean);
var wQtd: Integer;
    lDeletou: Boolean;
begin
  // pMais:  True: Mais    False: Menos
  lDeletou := False;
  if pMais
     then wQtd := uDM.PedWrkQuant.AsInteger + 1
     else wQtd := uDM.PedWrkQuant.AsInteger - 1;
  if wQtd = 0
  then begin
    uDM.PedWrk.Delete;
    lDeletou := True;
  end
  else begin
    uDM.PedWrk.Edit;
    uDM.PedWrkQuant.AsInteger := wQtd;
    uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkQuant.AsInteger * uDM.PedWrkVlrUnit.AsCurrency;
    uDM.PedWrk.Post;
  end;
  TotalizaPedido;
  if lDeletou
    then FuPedidos.PanAlteraBebida.Visible := False;

end;



procedure TFuPedidos.btCancelarClick(Sender: TObject);
begin
  PanAlteraBebida.Visible := False;
  PanWork.Visible := False;
  btAbrirPedido.SetFocus;

end;

procedure TFuPedidos.btEditarClick(Sender: TObject);
begin
  if uDM.PedWrk.RecordCount = 0 then Exit;
  if uDM.PedWrkTpProd.AsInteger = 1
     then AlteraLanche
     else AlteraBebida;

end;

procedure TFuPedidos.btExcluirClick(Sender: TObject);
begin
  if uDM.PedWrk.RecordCount = 0 then Exit;
  if MessageDlg('Excluir ' + uDM.PedWrkDescricao.AsString + ' ?',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
  then begin
    uDM.Pedwrk.Delete;
    TotalizaPedido;
  end;

end;

procedure TFuPedidos.btFinalizarClick(Sender: TObject);
var nRet: Integer;
begin
  PanAlteraBebida.Visible := False;
  if FuPedidos.totalPedido = 0
    then nRet := 2
    else nRet := FinalizaPedido;
  if nRet = 0
  then begin
    {
    With uBiblioteca.EmitirNFCeDePV(1, uDM.Pedidos.FieldByName('numero').AsInteger ) Do
    Begin
      if Not Resultado then
      Begin
        ShowMessage(Mensagem);
        Exit;
      End;
    End;
    }


    ShowMessage('Gravou pedido, emite pedido, emite NFCe(se for o caso) e atualiza caixa');
    nRet := 2;
  end;
  if nRet = 2 then       // Novo pedido ou pedido cancelado
  begin
    PanWork.Visible := False;
    btAbrirPedido.SetFocus;
  end;

end;

procedure TFuPedidos.btMaisClick(Sender: TObject);
begin
  BebidaMaisMenos(True);

end;

procedure TFuPedidos.btMenosClick(Sender: TObject);
begin
  BebidaMaisMenos(False);
  if uDM.PedWrkQuant.AsInteger = 0 then btNadaClick(nil);

end;

procedure TFuPedidos.btNadaClick(Sender: TObject);
begin
  PanAlteraBebida.Visible := False;
  btDummy.SetFocus;

end;

procedure TFuPedidos.btAbrirPedidoClick(Sender: TObject);
begin
  pgControle.ActivePageIndex := 0;
  if CriaAbrePedidoWrk(0) <> 0 then Exit;
  itensPedido := 0;
  totalPedido := 0;
  PanWork.Visible := True;
  FuPedidos.FormResize(nil);
  btDummy.SetFocus;

end;

procedure TFuPedidos.btSairClick(Sender: TObject);
begin
  FuPedidos.Close;

end;

procedure TFuPedidos.FormCreate(Sender: TObject);
begin
  PanWork.Align   := alClient;
  btAbrirPedido.Left   := 20;
  btAbrirPedido.Top    := 60;
  btAbrirPedido.Width  := 180;
  btAbrirPedido.Height := 80;
  btSair.Left     := btAbrirPedido.Left;
  btSair.Top      := btAbrirPedido.Top + btAbrirPedido.Height + 20;
  btSair.Width    := btAbrirPedido.Width;
  btSair.Height   := btAbrirPedido.Height;

end;

procedure TFuPedidos.FormResize(Sender: TObject);
begin
  GridPedido := DefineGrid(GridPedido, [0.06, 0.33, 0.05, 0.22], 1, 0);

end;

procedure TFuPedidos.FormShow(Sender: TObject);
begin
  edItens.Text := '0';
  edTotal.Text := '0,00';
  MontaTelaPedidos;

end;


procedure TFuPedidos.GridBebidasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,i,nTop: Integer;
    wImagem: TImage;
    lin2: Boolean;
begin
  // Preenche a celula com código, descrição, preço e imagem
  wKey := wCodBebida[ACol,ARow];
  if wKey = 0 then Exit;   // Não há bebida na célula
  if not uDM.Itens.FindKey([3,wKey]) then Exit;   // Bebida não encontrada
  //
  wImagem := TImage.Create(nil);
  GridBebidas.Canvas.Brush.Style := bsClear;
  GridBebidas.Canvas.FillRect(Rect);
  GridBebidas.Color := clWhite;
  //
  if uDM.ItensImagem.AsString <> '' then
  begin
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridBebidas.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
  end;
  //
  wTxt := IntToStr(wKey);
  if wKey < 10 then wTxt := '0' + wTxt;
  GridBebidas.Canvas.Font.Color := clBlue;
  GridBebidas.Canvas.Font.Size  := 28;
  GridBebidas.Canvas.Font.Style := [fsBold];
  GridBebidas.Canvas.TextOut(Rect.Left+4, Rect.Top, wTxt);
  //
  GridBebidas.Canvas.Font.Size  := 20;
  GridBebidas.Canvas.Font.Color := clBlack;
  wTxt := uDM.ItensDescricao.AsString;
  LabAux1.Caption   := '';
  LabAux1.Font.Size := GridBebidas.Canvas.Font.Size;
  LabAux2.Caption   := '';
  LabAux2.Font.Size := GridBebidas.Canvas.Font.Size;
  lin2 := False;
  for i := 1 to Length(wTxt)
  do begin
    if wTxt[i] = '#' then lin2 := True
    else if not lin2 then
           LabAux1.Caption := LabAux1.Caption + wTxt[i]
         else
           LabAux2.Caption := LabAux2.Caption + wTxt[i];
  end;
  nTop := Rect.Height - ((LabAux1.Height * 2) + 4);
  GridBebidas.Canvas.TextOut(Rect.Left+4, Rect.Top+nTop, LabAux1.Caption);
  nTop := nTop + LabAux1.Height;
  GridBebidas.Canvas.TextOut(Rect.Left+4, Rect.Top+nTop, LabAux2.Caption);
  //
  wImagem.Free;

end;

procedure TFuPedidos.GridBebidasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  if PanAlteraBebida.Visible then PanAlteraBebida.Visible := False;  
  GridBebidas.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodBebida[nCol,nLin];
  if wKey = 0 then Exit;
  InclueBebida(wKey);

end;

procedure TFuPedidos.GridLanchesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,i,nTop: Integer;
    wImagem: TImage;
    lin2: Boolean;
begin
  // Identifica o lanche na célula
  wKey := wCodLanche[ACol,ARow];
  if wKey = 0 then Exit;   // Não há lanche na célula
  if not uDM.Itens.FindKey([1,wKey]) then Exit;   // Lanche não encontrado
  //
  wImagem := TImage.Create(nil);
  GridLanches.Canvas.Brush.Style := bsClear;
  GridLanches.Canvas.FillRect(Rect);
  GridLanches.Color := clWhite;
  //
  if uDM.ItensImagem.AsString <> '' then
  begin
    wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    GridLanches.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
  end
  else begin      // Se não houver imagem, 'escreve' a identificação do lanche
    GridLanches.Canvas.Font.Size  := 18;
    GridLanches.Canvas.Font.Color := clBlack;
    wTxt := uDM.ItensDescricao.AsString;
    LabAux1.Caption   := '';
    LabAux1.Font.Size := GridLanches.Canvas.Font.Size;
    LabAux2.Caption   := '';
    LabAux2.Font.Size := GridLanches.Canvas.Font.Size;
    lin2 := False;
    for i := 1 to Length(wTxt)
    do begin
      if wTxt[i] = '#' then lin2 := True
      else if not lin2 then
             LabAux1.Caption := LabAux1.Caption + wTxt[i]
           else
             LabAux2.Caption := LabAux2.Caption + wTxt[i];
    end;
    nTop := Rect.Height - ((LabAux1.Height * 2) + 4);
    GridLanches.Canvas.TextOut(Rect.Left+4, Rect.Top+nTop, LabAux1.Caption);
    nTop := nTop + LabAux1.Height;
    GridLanches.Canvas.TextOut(Rect.Left+4, Rect.Top+nTop, LabAux2.Caption);
  end;
  wTxt := IntToStr(wKey);
  if wKey < 10 then wTxt := '0' + wTxt;
  GridLanches.Canvas.Font.Color := clRed;
  GridLanches.Canvas.Font.Size  := 28;
  GridLanches.Canvas.Font.Style := [fsBold];
  GridLanches.Canvas.TextOut(Rect.Left+4, Rect.Top, wTxt);


  wImagem.Free;

end;

procedure TFuPedidos.GridLanchesMouseDown(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridLanches.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodLanche[nCol,nLin];
  if wKey = 0 then Exit;
  InclueLanche(wKey);

end;

procedure TFuPedidos.GridPedidoDblClick(Sender: TObject);
begin
  btEditarClick(nil);

end;

end.
