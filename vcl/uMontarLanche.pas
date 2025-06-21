unit uMontarLanche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids;
  Procedure MontagemDoLanche(pInclus:Boolean);

type
  TFuMontarLanche = class(TForm)
    PanMontagem: TPanel;
    PanIdLanche: TPanel;
    dbDescricao: TDBText;
    Label3: TLabel;
    dbTotal: TDBEdit;
    PanRodape: TPanel;
    GridBase: TDrawGrid;
    LabBase: TLabel;
    GridComp: TDrawGrid;
    LabComp: TLabel;
    LabAux1: TLabel;
    dbPrensado: TDBCheckBox;
    dbCortado: TDBCheckBox;
    imgObs: TImage;
    dbObserv: TDBMemo;
    btOkLanche: TBitBtn;
    btCanLanche: TBitBtn;
    procedure GridBaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridBaseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridCompMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridCompDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btOkLancheClick(Sender: TObject);
    procedure btCanLancheClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nRowBas,nRowExt: Integer;
    wCodBas: array[0..39] of Integer;
    wSelBas: array[0..39] of String;
    wCodExt: array[0..39] of Integer;
    wSelExt: array[0..39] of String;

  end;

var
  FuMontarLanche: TFuMontarLanche;
  wColor: TColor;
  vlrBase,vlrComp: Currency;
  lInclus: Boolean;

implementation

{$R *.dfm}

uses uGenericas, uDados, uPedidos;

Procedure MontagemDoLanche(pInclus:Boolean);
var posBarra: String;
    altBarra,lrgBarra,altMaxima,lrgMaxima: Integer;
    i,nAlt: Integer;
begin
  with FuMontarLanche
  do begin
    lInclus := pInclus;
    posBarra := ObtemConfiguracaoTela(altBarra,lrgBarra,altMaxima,lrgMaxima);
    Width  := Trunc(lrgMaxima * 0.80);
    Height := altMaxima;
    Top    := 0;
    if posBarra = 'T' then Top := altBarra + 1;
    Left   := (Screen.Width - Width) div 2;
    //
    LabBase.Left := 8;
    LabBase.Top := PanIdLanche.Top + PanIdLanche.Height;
    GridBase.Left := LabBase.Left;
    GridBase.Top := LabBase.Top + LabBase.Height;
    GridBase.Height := PanMontagem.Height - PanRodape.Height - GridBase.Top - 4;
    GridBase.ColCount := 4;
    GridBase.RowCount := nRowBas;
    GridBase.Width := Round((PanMontagem.Width-32) * 0.6);
    GridBase.ColWidths[0] := Round(GridBase.Width * 0.10);
    GridBase.ColWidths[2] := Round(GridBase.Width * 0.20);
    GridBase.ColWidths[3] := Round(GridBase.Width * 0.10);
    GridBase.ColWidths[1] := GridBase.Width -
                            (GridBase.ColWidths[0] + GridBase.ColWidths[2] + GridBase.ColWidths[3] + 8);
    nAlt := (GridBase.Height div nRowBas) - 2;
    for i := 0 to nRowBas-1
      do GridBase.RowHeights[i] := nAlt;
    //
    LabComp.Left := GridBase.Left + GridBase.Width + 16;
    LabComp.Top := LabBase.Top;
    GridComp.Left := LabComp.Left;
    GridComp.Top := GridBase.Top;
    GridComp.Height := PanMontagem.Height - PanRodape.Height - GridComp.Top - 4;
    GridComp.ColCount := 4;
    GridComp.RowCount := nRowExt;
    GridComp.Width := Round((PanMontagem.Width-32) * 0.4);
    GridComp.ColWidths[0] := Round(GridComp.Width * 0.10);
    GridComp.ColWidths[2] := Round(GridComp.Width * 0.20);
    GridComp.ColWidths[3] := Round(GridComp.Width * 0.10);
    GridComp.ColWidths[1] := GridComp.Width -
                             (GridComp.ColWidths[0] + GridComp.ColWidths[2] + GridComp.ColWidths[3] + 8);
    nAlt := (GridComp.Height div nRowExt) - 2;
    for i := 0 to nRowExt-1
      do GridComp.RowHeights[i] := nAlt;
    //
    for i := 0 to 19 do
    begin
      wSelBas[i] := '';
      wSelExt[i] := '';
    end;
    vlrBase := 0;
    vlrComp := 0;
    ShowModal;

  end;

end;

Function ValorComplementos: Currency;
var i,wKey: Integer;
begin
  with FuMontarLanche
  do begin
    Result := 0;
    for i := 0 to 19
    do if wSelExt[i] <> ''
       then begin
         wKey := wCodExt[i];
         if uDM.itens.FindKey([5,wKey])
         then Result := Result + uDM.ItensPreco.AsCurrency;
       end;
    end;

end;


procedure TFuMontarLanche.btCanLancheClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  if lInclus
     then uDM.PedWrk.Delete;
  FuMontarLanche.Close;

end;

procedure TFuMontarLanche.btOkLancheClick(Sender: TObject);
begin
  if uDM.PedWrkVlrTotal.AsCurrency = 0 then
  begin
    MessageDlg('Lanche não indicado' + #13#13 +
               'Selecione o lanche ou cancele o lançamento',mtError,[mbOk],0);
    Exit;
  end;
  uDM.PedWrk.Post;
  FuMontarLanche.Close;

end;

procedure TFuMontarLanche.GridBaseDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var wKey,nTop,nLeft: Integer;
begin
  // Identifica o 'basico' na linha
  wKey := wCodBas[ARow];
  if wKey = 0 then Exit;   // Não há 'basico' na linha
  if not uDM.Itens.FindKey([4,wKey]) then Exit;   // 'Basico' não encontrado
  GridBase.Canvas.Brush.Style := bsClear;
  GridBase.Canvas.FillRect(Rect);
  GridBase.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  if ACol <> 3 then LabAux1.Font.Size := 18
               else LabAux1.Font.Size := 28;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridBase.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridBase.Canvas.Brush.Color := wColor;
  GridBase.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensCodigo.AsString;
    1:LabAux1.Caption := uDM.ItensDescricao.AsString;
    2:LabAux1.Caption := FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2);
    3:LabAux1.Caption := wSelBas[ARow];
  end;
  nLeft := (GridBase.ColWidths[ACol] - LabAux1.Width) div 2;
  GridBase.Canvas.Font.Name := LabAux1.Font.Name;
  GridBase.Canvas.Font.Size := LabAux1.Font.Size;
  GridBase.Canvas.Font.Style := LabAux1.Font.Style;
  GridBase.Canvas.Font.Color := LabAux1.Font.Color;
  GridBase.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridBase.Canvas.Pen.Color := clBlack;
  GridBase.Canvas.Pen.Width := 1;
  GridBase.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridBase.Canvas.LineTo(Rect.Left+GridBase.ColWidths[ACol], Rect.Top);
  GridBase.Canvas.LineTo(Rect.Left+GridBase.ColWidths[ACol], Rect.Top+GridBase.RowHeights[ARow]);
  GridBase.Canvas.LineTo(Rect.Left, Rect.Top+GridBase.RowHeights[ARow]);
  GridBase.Canvas.LineTo(Rect.Left, Rect.Top);

end;

procedure TFuMontarLanche.GridBaseMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,i: Integer;
    wKey: Integer;
    wDescricao: String;
    wPreco: Currency;
begin
  GridBase.MouseToCell(X,Y,nCol,nLin);
  wKey := wCodBas[nLin];
  for i := 0 to 19
  do if wCodBas[i] <> wKey
     then wSelBas[i] := ''
     else wSelBas[i] := 'X';
  GridBase.Refresh;
  if not uDM.Itens.FindKey([4,wKey])
  then begin
    MessageDlg('Item [4,' + IntToStr(wKey) + '] não encontrado, reinforme',mtInformation,[mbOk],0);
    Exit;
  end;
  wDescricao := Trim(uDM.ItensDescricao.AsString) + '(Montar lanche)';
  wPreco := uDM.ItensPreco.AsCurrency;
  //
  vlrBase := wPreco;       //uDM.ItensPreco.AsCurrency;
  vlrComp := ValorComplementos;
  uDM.PedWrkCodProd.AsInteger := wKey;
  uDM.PedWrkDescricao.AsString := wDescricao;
  uDM.PedWrkVlrUnit.AsCurrency := vlrBase + vlrComp;
  uDM.PedWrkVlrTotal.AsCurrency := vlrBase + vlrComp;
  //ShowMessage('ItensDescricao='+uDM.ItensDescricao.AsString + #13 + 'PedWrkDescricao=' + uDM.PedWrkDescricao.AsString);
  //GridBaseDrawCell(nil,nCol,nLin);

end;

procedure TFuMontarLanche.GridCompDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var wTxt: String;
    wKey,nTop,nLeft: Integer;
begin
  // Identifica o 'cpmplemento' na linha
  wKey := wCodExt[ARow];
  if wKey = 0 then Exit;   // Não há 'basico' na linha
  if not uDM.Itens.FindKey([5,wKey]) then Exit;   // 'Basico' não encontrado
  GridComp.Canvas.Brush.Style := bsClear;
  GridComp.Canvas.FillRect(Rect);
  GridComp.Color := clWhite;
  //
  LabAux1.Font.Name := 'Tahoma';
  if ACol <> 3 then LabAux1.Font.Size := 14
               else LabAux1.Font.Size := 22;
  LabAux1.Font.Style := [fsBold];
  LabAux1.Font.Color := clBlack;
  LabAux1.Caption := '00';
  nTop := (GridComp.RowHeights[ARow] - LabAux1.Height) div 2;
  if uDM.ItensCorItem.AsString <> '' then
    wColor := StringToColor(uDM.ItensCorItem.AsString)
  else wColor := clWhite;
  GridComp.Canvas.Brush.Color := wColor;
  GridComp.Canvas.FillRect(Rect);
  //
  case ACol of
    0:LabAux1.Caption := uDM.ItensCodigo.AsString;
    1:LabAux1.Caption := uDM.ItensDescricao.AsString;
    2:LabAux1.Caption := FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2);
    3:LabAux1.Caption := wSelExt[ARow];
  end;
  nLeft := (GridComp.ColWidths[ACol] - LabAux1.Width) div 2;
  GridComp.Canvas.Font.Name := LabAux1.Font.Name;
  GridComp.Canvas.Font.Size := LabAux1.Font.Size;
  GridComp.Canvas.Font.Style := LabAux1.Font.Style;
  GridComp.Canvas.Font.Color := LabAux1.Font.Color;
  if ACol = 1 then nLeft := 2;
  GridComp.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, LabAux1.Caption);
  //
  GridComp.Canvas.Pen.Color := clBlack;
  GridComp.Canvas.Pen.Width := 1;
  GridComp.Canvas.MoveTo(Rect.Left, Rect.Top);
  GridComp.Canvas.LineTo(Rect.Left+GridComp.ColWidths[ACol], Rect.Top);
  GridComp.Canvas.LineTo(Rect.Left+GridComp.ColWidths[ACol], Rect.Top+GridComp.RowHeights[ARow]);
  GridComp.Canvas.LineTo(Rect.Left, Rect.Top+GridComp.RowHeights[ARow]);
  GridComp.Canvas.LineTo(Rect.Left, Rect.Top);

end;

procedure TFuMontarLanche.GridCompMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,i,wKey: Integer;
    wValor: Currency;
    wExtras: String;
    wUso: Char;
    wTexto: TStringList;
begin
  if vlrBase = 0 then Exit;
  GridComp.MouseToCell(X,Y,nCol,nLin);
  if wSelExt[nLin] <> ''
  then begin
    wSelExt[nLin] := '';
    wUso := '.';
  end
  else begin
    wSelExt[nLin] := 'X';
    wUso := '+';
  end;
  wKey := wCodExt[nLin];
  GridComp.Refresh;
  //GridCompDrawCell(nil,nCol,nLin);
  wExtras := uDM.PedWrkExtras.AsString;
  wExtras[wKey] := wUso;
  vlrComp := ValorComplementos;
  uDM.PedWrkVlrUnit.AsCurrency := vlrBase + vlrComp;
  uDM.PedWrkVlrTotal.AsCurrency := vlrBase + vlrComp;
  uDM.PedWrkExtras.AsString := wExtras;

  wTexto := TStringList.Create;
  for i := 1 to 24
  do if wExtras[i] <> '.'
     then if uDM.Itens.FindKey([5,i])
          then wTexto.Add(Trim(uDM.ItensDescricao.AsString));
  uDM.PedWrkTxtSem.Clear;
  uDM.PedWrkTxtMais.Assign(wTexto);
  uDM.PedWrkTxtMenos.Clear;
  wTexto.Free;

end;

end.
