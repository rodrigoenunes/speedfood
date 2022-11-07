unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.CheckLst, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask;
  Procedure LancamentoPedidos;

type
  TFuPedidos = class(TForm)
    PanTopo: TPanel;
    PanWork: TPanel;
    PanGridPed: TPanel;
    PanRodape: TPanel;
    btDummy: TBitBtn;
    btFinalizar: TBitBtn;
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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBEdit1: TDBEdit;
    btMais: TBitBtn;
    btMenos: TBitBtn;
    btNada: TBitBtn;
    btPedido: TBitBtn;
    Label2: TLabel;
    edNro: TEdit;
    Label3: TLabel;
    edItens: TEdit;
    Label4: TLabel;
    edValor: TEdit;
    btFinalTopo: TBitBtn;
    LabAux1: TLabel;
    LabAux2: TLabel;
    procedure btPedidoClick(Sender: TObject);
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
    procedure GridPedidoCellClick(Column: TColumn);
    procedure GridPedidoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FuPedidos: TFuPedidos;
  wCodLanche: array[0..19,0..19] of Integer;
  wCodBebida: array[0..19,0..19] of Integer;
  nroPedido,itensPedido: Integer;
  valorPedido: Currency;
  lrgLanche,altLanche,lrgBebida,altBebida: Integer;

const
  colGridPedido: array of Real = [0.09,0.33,0.05,0.25];

implementation

{$R *.dfm}

uses uDados, uGenericas; //, HDProds, HDLanche, uGenericas, HDPrincipal, HDFinPedido;


Procedure LancamentoPedidos;
begin
  FuPedidos := TFuPedidos.Create(nil);
  FuPedidos.ShowModal;
  FuPedidos.Free;

end;


Procedure MontaTelaPedidos;
var i,j: Integer;
    nCol,nLin,nColBeb,nLinBeb: Integer;
    nAltura,nLargura: Integer;
    nLanches,nExtras,nExclus,nBebidas,nDiversos:Integer;
begin
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
    imgFundo.Height  := FuPedidos.Height - FuPedidos.PanTopo.Height;
    imgFundo.Width   := imgFundo.Height;
    imgFundo.Top     := PanTopo.Top + PanTopo.Height + 8;
    imgFundo.Left    := (FuPedidos.ClientWidth - imgFundo.Width) div 2;
    imgFundo.Stretch := True;
    imgFundo.Picture.LoadFromFile(uDM.pathWork + '\HotDog1.bmp');
    //
    PanGridPed.Width := PanWork.Width div 4;    // (PanWork.Width div 5) * 2;
    PanGridPed.Align := alRight;
    pgControle.Align := alClient;
    // Obtem quantidade de ítens de cada grupo
    nLanches  := 0;
    nExtras   := 0;
    nExclus   := 0;
    nBebidas  := 0;
    nDiversos := 0;
    uDM.Itens.First;
    while not uDM.Itens.Eof do
    begin
      case uDM.ItensGrupo.AsInteger of
        1:nLanches  := nLanches + 1;
        2:nExtras   := nExtras + 1;
        3:nExclus   := nExclus + 1;
        4:nBebidas  := nBebidas + 1;
        5:nDiversos := nDiversos + 1;
      end;
      uDM.Itens.Next;
    end;

    // Montagem dos grids
    // Lanches..................................................................
    nLargura := 196;                               // Largura da célula
    nCol     := TSLanches.Width div nLargura;      // Qtd necessária de colunas
    nLin     := nLanches div nCol;                 // Qtd necessária de linhas
    if (nLanches mod nCol) > 0 then nLin := nLin + 1;
    nAltura := (TSLanches.Height-8) div nLin;      // Altura da célula
    if nAltura < 80 then nAltura := 80;
    GridLanches.ColCount := nCol;
    GridLanches.RowCount := nLin;
    for i := 0 to nCol-1 do GridLanches.ColWidths[i]  := nLargura;
    for i := 0 to nLin-1 do GridLanches.RowHeights[i] := nAltura;
    GridLanches.Align := alClient;
    lrgLanche := nLargura - 12;   // Para definir o tamanho do texto
    altLanche := nAltura - 6;     // Altura máxima para colocação do texto no grid
    // Bebidas..................................................................
    nLargura := 196;                               // Largura da célula
    nCol     := TSBebidas.Width div nLargura;      // Qtd necessária de colunas
    nLin     := nBebidas div nCol;                 // Qtd necessária de linhas
    if (nBebidas mod nCol) > 0 then nLin := nLin + 1;
    nAltura := TSBebidas.Height div nLin;          // Altura da célula
    if nAltura < 80 then nAltura := 80;
    GridBebidas.ColCount := nCol;
    GridBebidas.RowCount := nLin;
    for i := 0 to nCol-1 do GridBebidas.ColWidths[i]  := nLargura;
    for i := 0 to nLin-1 do GridBebidas.RowHeights[i] := nAltura;
    GridBebidas.Align := alClient;
    lrgBebida := nLargura - 12;
    altBebida := nAltura - 6;
    //
    nLin := 0;
    nCol := 0;
    nLinBeb := 0;
    nColBeb := 0;
    uDM.Itens.First;
    while not uDM.Itens.Eof do
    begin
      case uDM.ItensGrupo.AsInteger of
        1:begin    // Lanches
            wCodLanche[nCol,nLin] := uDM.ItensCodigo.AsInteger;
            nCol := nCol + 1;
            if nCol = GridLanches.ColCount
            then begin
              nLin := nLin + 1;
              nCol := 0;
            end;
        end;
        4:begin    // Bebidas
            wCodBebida[nColBeb,nLinBeb] := uDM.ItensCodigo.AsInteger;
            nColBeb := nColBeb + 1;
            if nColBeb = GridBebidas.ColCount
            then begin
              nLinBeb := nLinBeb + 1;
              nColBeb := 0;
            end;
        end;
      end;
      uDM.Itens.Next;
    end;
    //
    // DBNavigator do pedido
    NavPedido.Left    := 4;
    NavPedido.Width   := 120;
    btEditar.Left     := NavPedido.Left + NavPedido.Width + 4;
    btEditar.Width    :=(PanPedCtle.Width - (btEditar.Left + 8)) div 2;
    btEditar.Caption  := '&Alterar';
    btExcluir.Left    := btEditar.Left + btEditar.Width + 4;
    btExcluir.Width   := btEditar.Width;
    btExcluir.Caption := '&Excluir';
    //
    PanTopo.Visible  := False;
    PanWork.Visible   := False;
    edNro.Text        := '';
    edItens.Text := '';

 end;

end;


Procedure InclueLanche(pNrLanche:Integer);
var nLct: Integer;
begin
  if not uDM.Itens.FindKey([1,pNrLanche]) then Exit;
  with uDM
  do begin
    PedWrk.Last;
    nLct := PedWrkNrLcto.AsInteger + 1;
    PedWrk.Append;
    PedWrkNumero.AsInteger    := 0;
    PedWrkNrLcto.AsInteger    := nLct;
    PedWrkTpProd.AsInteger    := 1;
    PedWrkCodProd.AsInteger   := pNrLanche;
    PedWrkDescricao.AsString  := ItensDescricao.AsString;
    PedWrkQuant.AsInteger     := 1;
    PedWrkVlrUnit.AsCurrency  := ItensPreco.AsCurrency;
    PedWrkVlrTotal.AsCurrency := ItensPreco.AsCurrency;
    PedWrkExtras.AsString     := '000000000000';
    PedWrkExcluir.AsString    := '000000000000';
    PedWrk.Post;
    PedWrk.Edit;
    //TratativaLanche(pNrLanche,True); **************************
    if PedWrk.State = dsEdit
       then PedWrk.Post;
  end;
  //TotalizaPedido(nSeq, itensPedido, valorPedido);    ************
  FuPedidos.edItens.Text := IntToStr(itensPedido);
  FuPedidos.edValor.Text := FloatToStrF(valorPedido,ffNumber,15,2);
  FuPedidos.GridPedido := DefineGrid(FuPedidos.GridPedido,colGridPedido,1,0);
  FuPedidos.btDummy.SetFocus;

end;

Procedure AlteraLanche;
var nSeq,nProd: Integer;
begin
{
  nSeq  := DM.PedWrkSequencia.AsInteger;
  nProd := DM.PedWrkCodProd.AsInteger;
  DM.PedWrk.Edit;
  TratativaLanche(nProd,False);
  if DM.PedWrk.State = dsEdit
     then DM.PedWrk.Post;
  TotalizaPedido(nSeq, itensPedido, valorPedido);
  FHDLanctos.edItens.Text := IntToStr(itensPedido);
  FHDLanctos.edValor.Text := FloatToStrF(valorPedido,ffNumber,15,2);
  FHDLanctos.GridPedido := DefineGrid(FHDLanctos.GridPedido,colGridPedido,1,0);
  FHDLanctos.btDummy.SetFocus;
}
end;

Procedure InclueBebida(pNrBebida:Integer);
var nSeq,i: Integer;
    lExiste,lProcura: Boolean;
    wRect: TRect;
begin
{
  if not DM.Prods.FindKey([4,pNrBebida]) then Exit;
  lExiste := False;
  lProcura := True;
  DM.PedWrk.First;
  while lProcura
  do begin
    if (DM.PedWrkTpProd.AsInteger = 4) and
       (DM.PedWrkCodProd.AsInteger = pNrBebida)
    then begin
      lExiste := True;
      lProcura := False;
    end
    else DM.PedWrk.Next;
    if DM.PedWrk.Eof then lProcura := False;
  end;
  if lExiste then
  begin
    nSeq := DM.PedWrkSequencia.AsInteger;
    DM.PedWrk.Edit;
    DM.PedWrkQuant.AsInteger := DM.PedWrkQuant.AsInteger + 1;
    DM.PedWrkVlrTotal.AsCurrency := DM.PedWrkVlrUnit.AsCurrency * DM.PedWrkQuant.AsInteger;
    DM.PedWrk.Post;
  end
  else begin
    DM.PedWrk.Last;
    nSeq := DM.PedWrkSequencia.AsInteger + 1;
    DM.PedWrk.Append;
    DM.PedWrkNumero.AsInteger    := nroPedido;
    DM.PedWrkSequencia.AsInteger := nSeq;
    DM.PedWrkTpProd.AsInteger    := 4;
    DM.PedWrkCodProd.AsInteger   := pNrBebida;
    DM.PedWrkDescricao.AsString  := DM.ProdsDescricao.AsString;
    DM.PedWrkQuant.AsInteger     := 1;
    DM.PedWrkVlrUnit.AsCurrency  := DM.ProdsValor.AsCurrency;
    DM.PedWrkVlrTotal.AsCurrency := DM.ProdsValor.AsCurrency;
    DM.PedWrkExtras.AsString     := '000000000000';
    DM.PedWrkExcluir.AsString    := '000000000000';
    DM.PedWrk.Post;
  end;
  TotalizaPedido(nSeq, itensPedido, valorPedido);
  FHDLanctos.edItens.Text := IntToStr(itensPedido);
  FHDLanctos.edValor.Text := FloatToStrF(valorPedido,ffNumber,15,2);
  FHDLanctos.GridPedido := DefineGrid(FHDLanctos.GridPedido,colGridPedido,1,0);
  FHDLanctos.btDummy.SetFocus;
}
end;

Procedure BebidaMaisMenos(pMais:Boolean);
var wQtd: Integer;
    lDeletou: Boolean;
begin
{
  // pMais:  True: Mais    False: Menos
  lDeletou := False;
  if pMais
     then wQtd := DM.PedWrkQuant.AsInteger + 1
     else wQtd := DM.PedWrkQuant.AsInteger - 1;
  if wQtd = 0
  then begin
    DM.PedWrk.Delete;
    lDeletou := True;
  end
  else begin
    DM.PedWrk.Edit;
    DM.PedWrkQuant.AsInteger := wQtd;
    DM.PedWrkVlrTotal.AsCurrency := DM.PedWrkQuant.AsInteger * DM.PedWrkVlrUnit.AsCurrency;
    DM.PedWrk.Post;
  end;
  TotalizaPedido(DM.PedWrkSequencia.AsInteger, itensPedido, valorPedido);
  FHDLanctos.edItens.Text := IntToStr(itensPedido);
  FHDLanctos.edValor.Text := FloatToStrF(valorPedido,ffNumber,15,2);
  FHDLanctos.GridPedido := DefineGrid(FHDLanctos.GridPedido,colGridPedido,1,0);
  if lDeletou
  then begin
    FHDLanctos.PanAlteraBebida.Visible := False;
    FHDLanctos.btDummy.SetFocus;
  end;
}
end;


Procedure AlteraBebida;
begin
  with FuPedidos
  do begin
    PanAlteraBebida.Visible := True;
    btNada.SetFocus;
  end;

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
{
  if DM.PedWrk.RecordCount = 0 then Exit;
  if MessageDlg('Excluir ' + DM.PedWrkDescricao.AsString + ' ?',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
  then begin
    DM.Pedwrk.Delete;
    TotalizaPedido(DM.PedWrkSequencia.AsInteger, itensPedido, valorPedido);
    FHDLanctos.edItens.Text := IntToStr(itensPedido);
    FHDLanctos.edValor.Text := FloatToStrF(valorPedido,ffNumber,15,2);
    FHDLanctos.GridPedido := DefineGrid(FHDLanctos.GridPedido,colGridPedido,1,0);
    FHDLanctos.btDummy.SetFocus;
  end;
}
end;

procedure TFuPedidos.btFinalizarClick(Sender: TObject);
begin
{
  if not FinalizaPedido(nroPedido,itensPedido,valorPedido) then Exit;
  PanWork.Visible := False;
  PanTopo.Visible := False;
  btPedido.SetFocus;
}
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

procedure TFuPedidos.btPedidoClick(Sender: TObject);
begin
  pgControle.ActivePageIndex := 0;
  nroPedido := 0;   // Obter o nr. do pedido somente na gravação
  if CriaAbrePedidoWrk(NroPedido) <> 0 then Exit;
  edNro.Text   := IntToStr(nroPedido);
  edItens.Text := '';
  edValor.Text := '';
  PanTopo.Visible := True;
  PanWork.Visible := True;
  GridPedido := DefineGrid(GridPedido,colGridPedido,1,0);
  GridLanches.SetFocus;
  btDummy.SetFocus;

end;

procedure TFuPedidos.btSairClick(Sender: TObject);
begin
  FuPedidos.Close;

end;

procedure TFuPedidos.FormCreate(Sender: TObject);
begin
  PanWork.Align   := alClient;
  btPedido.Left   := 20;
  btPedido.Top    := 60;
  btPedido.Width  := 180;
  btPedido.Height := 80;
  btSair.Left     := btPedido.Left;
  btSair.Top      := btPedido.Top + btPedido.Height + 20;
  btSair.Width    := btPedido.Width;
  btSair.Height   := btPedido.Height;

end;

procedure TFuPedidos.FormShow(Sender: TObject);
begin
  MontaTelaPedidos;

end;

procedure TFuPedidos.GridBebidasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey: Integer;
begin
  // Escreve o texto na célula
  GridBebidas.Canvas.Brush.Style := bsClear;
  if (ACol = 0) and (ARow = 0)
  then begin
    GridBebidas.Canvas.Font.Size := 36;
    wTxt := '...';
    Gridbebidas.Canvas.TextOut(Rect.Left+12, Rect.Top+24, wTxt);
    Exit;
  end;
  wKey := wCodBebida[ACol,ARow];
  if wKey > 0 then
  begin
    GridBebidas.Canvas.Font.Size := 28;
    wTxt := IntToStr(wCodBebida[ACol,ARow]);
    if Length(Trim(wTxt)) = 1 then wTxt := '0' + wTxt;
    GridBebidas.Canvas.TextOut(Rect.Left, Rect.Top, wTxt);
    if uDM.Itens.FindKey([4,wKey])
    then begin
      wTxt := uDM.ItensDescricao.AsString;
      GridBebidas.Canvas.Font.Size := 12;
      GridBebidas.Canvas.TextOut(Rect.Left+2, Rect.Top+38, wTxt);
    end;

  end;

end;

procedure TFuPedidos.GridBebidasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin: Integer;
    wKey: Integer;
begin
  GridBebidas.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodBebida[nCol,nLin];
  if wKey = 0 then Exit;
  InclueBebida(wKey);

end;

procedure TFuPedidos.GridLanchesDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,i,nTop: Integer;
    wImagem: TImage;
begin
  wImagem := TImage.Create(nil);
  // Escreve o texto na célula
  GridLanches.Canvas.Brush.Style := bsClear;
  wKey := wCodLanche[ACol,ARow];
  if wKey > 0 then
  begin
    if uDM.Itens.FindKey([1,wKey])
    then begin
      GridLanches.Canvas.FillRect(Rect);
      if uDM.ItensImagem.AsString <> '' then
      begin
        wImagem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
        GridLanches.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
      end;
      wTxt := IntToStr(wKey);
      if Length(Trim(wTxt)) = 1 then wTxt := '0' + wTxt;
      //wTxt := uDM.ItensGrupo.AsString + '.' + wTxt;
      GridLanches.Canvas.Font.Size := 28;
      GridLanches.Canvas.TextOut(Rect.Left+4, Rect.Top+4, wTxt);
      GridLanches.Canvas.Font.Size := 18;
      wTxt := uDM.ItensDescricao.AsString;
      LabAux1.Caption   := '';
      LabAux1.Font.Size := GridLanches.Canvas.Font.Size;
      LabAux2.Caption   := '';
      LabAux2.Font.Size := GridLanches.Canvas.Font.Size;
      nTop := 44;
      for i := 1 to Length(wTxt)
      do begin
        LabAux1.Caption := LabAux1.Caption + wTxt[i];
        if LabAux1.Width > lrgLanche
        then begin
          GridLanches.Canvas.TextOut(Rect.Left+4, Rect.Top+nTop, LabAux2.Caption);
          nTop := nTop + LabAux2.Height;
          LabAux1.Caption := '';
          LabAux2.Caption := wTxt[i];
        end
        else LabAux2.Caption := LabAux2.Caption + wTxt[i];
      end;
      if LabAux2.Caption <> ''
         then GridLanches.Canvas.TextOut(Rect.Left+4, Rect.Top+nTop, LabAux2.Caption);
    end;

  end;
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

procedure TFuPedidos.GridPedidoCellClick(Column: TColumn);
begin
//  btEditarClick(nil);

end;

procedure TFuPedidos.GridPedidoDblClick(Sender: TObject);
begin
  btEditarClick(nil);

end;

end.
