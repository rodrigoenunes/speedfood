unit uTrataLanche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids;
  Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean);

type
  TFuTrataLanche = class(TForm)
    PanInfoLanche: TPanel;
    PanIdLanche: TPanel;
    PanRodape: TPanel;
    DBText3: TDBText;
    PanBtOk: TPanel;
    btOkLanche: TBitBtn;
    PanObserv: TPanel;
    dbExtras: TDBMemo;
    btCancelLanche: TBitBtn;
    LabNomeLanche: TLabel;
    dbObserv: TDBMemo;
    btExcLanche: TBitBtn;
    imgObs: TImage;
    GridExtras: TDrawGrid;
    imgMais: TImage;
    imgMenos: TImage;
    imgExtra: TImage;
    dbExclus: TDBMemo;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btOkLancheClick(Sender: TObject);
    procedure btCancelLancheClick(Sender: TObject);
    procedure btExcLancheClick(Sender: TObject);
    procedure GridExtrasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure GridExtrasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuTrataLanche: TFuTrataLanche;
  wVlrItem: Currency;

  lInclusao: Boolean;
  altBtn,lrgBtn,lrgImg: Integer;



implementation

{$R *.dfm}

uses uGenericas, uDados;

Procedure MontaTelaExtras;
var nCols,nLins,nAlt,i,j,dimUtil: Integer;
    largs: array of real;
    posBarra: String;
    altBarra,lrgBarra,altMaxima,lrgMaxima: Integer;
begin
  with FuTrataLanche
  do begin
    posBarra := ObtemConfiguracaoTela(altBarra,lrgBarra,altMaxima,lrgMaxima);
    Width  := Trunc(Screen.Width * 0.70);
    Height := altMaxima;
    Top    := 0;
    if posBarra = 'T' then Top := altBarra + 1;
    Left   := (Screen.Width - Width) div 2;
    GridExtras.Align := alClient;
    nCols  := 5;
    nLins  := uDM.nExtras;
    largs  := [0.04, 0.10, 0.70, 0.10, 0.06];
    if uDM.nExtras > 12
    then begin
      nCols := 11;
      nLins := (uDM.nExtras div 2) + (uDM.nExtras mod 2);
      largs  := [0.04, 0.05, 0.30, 0.05, 0.03, 0.06, 0.04, 0.05, 0.30, 0.05, 0.03];
    end;
    GridExtras.RowCount := nLins;
    GridExtras.ColCount := nCols;
    dimUtil := GridExtras.Height - (nLins * 2);
    nAlt := dimUtil div nLins;
    for i := 0 to GridExtras.RowCount-1 do
      GridExtras.RowHeights[i] := nAlt;
    dimUtil := GridExtras.Width - (24 + nCols);
    for i := 0 to GridExtras.ColCount-1 do
      GridExtras.ColWidths[i] := Trunc(dimUtil * largs[i]);
    CarregaExtras(nLins);
  end;

end;


Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean);
begin
  lInclusao := pInclusao;     // True:Inclusão   False:Alteração ou Exclusão
  if not uDM.Itens.FindKey([1,pCodLanche]) then
  begin
    MessageDlg('Erro: Lanche inexistente no cadastro',mtError,[mbOk],0);
    Exit;
  end;
  wVlrItem := uDM.ItensPreco.AsCurrency;
  FuTrataLanche.LabNomeLanche.Caption := uDM.ItensDescricao.AsString;
  FuTrataLanche.btExcLanche.Visible := False;
  if not lInclusao
     then FuTrataLanche.btExcLanche.Visible := True;
  FuTrataLanche.ShowModal;

end;


procedure TFuTrataLanche.btCancelLancheClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  if lInclusao
     then uDM.PedWrk.Delete;
  FuTrataLanche.Close;

end;

procedure TFuTrataLanche.btExcLancheClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  uDM.PedWrk.Delete;
  FuTrataLanche.Close;

end;

procedure TFuTrataLanche.btOkLancheClick(Sender: TObject);
begin
  uDM.PedWrk.Post;
  FuTrataLanche.Close;

end;

procedure TFuTrataLanche.FormResize(Sender: TObject);
var topBtn: Integer;
begin

end;

procedure TFuTrataLanche.FormShow(Sender: TObject);
var wStrAuxil: String;
begin
  MontaTelaExtras;
  wStrAuxil := uDM.PedWrkExtras.AsString;
  btOkLanche.SetFocus;

end;

procedure TFuTrataLanche.GridExtrasDrawCell(Sender: TObject; ACol,ARow: Integer; Rect: TRect; State: TGridDrawState);
var wImagem: TImage;
    nCol,nRow: Integer;
    wTexto: String;
begin
  GridExtras.Canvas.Brush.Style := bsClear;
  GridExtras.Canvas.FillRect(Rect);
  if ACol < 6 then nCol := 1
              else nCol := 2;
  nRow := ARow + 1;
  //ShowMessage('ACol=' + IntToStr(ACol) + '  ARow=' + IntToStr(ARow) + #13 +
  //            'nCol=' + IntToStr(nCol) + '  nRow=' + IntToStr(nRow));
  case ACol of
    0,6:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
      GridExtras.Canvas.Font.Size := 14;
      GridExtras.Canvas.TextOut(Rect.Left+4, Rect.Top+2, IntToStr(uDM.wCodExtra[nCol,nRow]));
    end;
    1,7:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
        wImagem := TImage.Create(nil);
        wImagem.Picture := imgMais.Picture;
        wImagem.Transparent := True;
        GridExtras.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
        wImagem.Free;
    end;
    2,8:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
      GridExtras.Canvas.Font.Size := 14;
      GridExtras.Canvas.TextOut(Rect.Left+8, Rect.Top+2, uDM.wTxtExtra[nCol,nRow]);
      if uDM.wVlrExtra[nCol,nRow] > 0 then
        GridExtras.Canvas.TextOut(Rect.Left+8, Rect.Top+21,
                                  'R$' + FloatToStrF(uDM.wVlrExtra[nCol,nRow],ffNumber,15,2));
    end;
    3,9:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
      wImagem := TImage.Create(nil);
      wImagem.Picture := imgMenos.Picture;
      wImagem.Transparent := True;
      GridExtras.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
      wImagem.Free;
    end;
    4,10:begin
    end;
    5:begin

    end;
  end;

end;

procedure TFuTrataLanche.GridExtrasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,wCol,wLin,wKey,wQtd: Integer;
    xExtras,xValPos,wTxtExtra,wTxtExclu: String;
    lctCods: array of integer;
    lctVlrs: array of Currency;
    nValPos,indVal,nMax: Integer;
    lSoma: Boolean;
    i: Integer;
begin
  GridExtras.MouseToCell(X,Y,nCol,nLin);
  if (nCol <> 1) and (nCol <> 3) and (nCol <> 7) and (nCol <> 9) then Exit;
  //
  xExtras := uDM.PedWrkExtras.AsString;    // String de 24 posições (24 extras possíveis)
  // Extras com valores - Codigos com valor informados (de 0 a 3)
  lctCods := [99,uDM.PedWrkCod01.AsInteger,uDM.PedWrkCod02.AsInteger,uDM.PedWrkCod03.AsInteger];
  lctVlrs := [99,uDM.PedWrkVlr01.AsCurrency,uDM.PedWrkVlr02.AsCurrency,uDM.PedWrkVlr03.AsCurrency];
  // Obtem código de extra lançado
  if (nCol = 1) or (nCol = 7) then lSoma := True
                              else lSoma := False;
  if nCol < 6 then wCol := 1
              else wCol := 2;
  wLin := nLin + 1;
  wKey := uDM.wCodExtra[wCol,wLin];                 // Código do 'extra'
  xValPos := xExtras[wKey];                         // Indicação de uso ('0','1','2','X')
  nValPos := StrToIntDef(xExtras[wKey],9);          // 9: indica que deve ser 'Exclusão'
  if uDM.wVlrExtra[wCol,wLin] > 0 then nMax := 2    // Vezes que o extra pode ser repetido
                                  else nMax := 1;
  if lSoma
  then begin
    if xValPos = 'X' then xExtras[wKey] := '0'     // Restaura para situação inicial do extra
    else begin
      if nValPos >= nMax
      then begin
        MessageDlg('Extra anteriormente lançado (' + IntToStr(nMax) + 'X), desconsiderado',mtWarning,[mbOk],0);
        Exit;
      end;
      if uDM.wVlrExtra[wCol,wLin] > 0
      then begin          // Extra com valor
        indVal := 0;
        for i := 1 to 3
        do if wKey = lctCods[i]
              then begin
                indVal := i;          // Extra já informado
                Break;
              end;
        if indVal = 0
        then for i := 1 to 3
             do if lctCods[i] = 0
                   then begin
                     indVal := i;     // 1a. ocorrencia vazia
                     Break;
                   end;
        if indVal = 0
        then begin
          MessageDlg('Excesso de "Extras" com valores, desconsiderado',mtWarning,[mbOk],0);
          Exit;
        end;
        lctCods[indVal] := wKey;
        lctVlrs[indVal] := lctVlrs[indVal] + uDM.wVlrExtra[wCol,wLin];
      end;
      nValPos := nValPos + 1;
      case nValPos of
        1:xExtras[wKey] := '1';
        2:xExtras[wKey] := '2';
        3:xExtras[wKey] := '3';
      end;
    end;
  end
  else begin
    if xValPos = 'X' then Exit;
    if nValPos = 0
    then begin
      if uDM.wVlrExtra[wCol,wLin] > 0 then Exit;
      xExtras[wKey] := 'X';
    end
    else begin
      nValPos := nValPos - 1;
      if uDM.wVlrExtra[wCol,wLin] > 0
      then begin          // Extra com valor
        for i := 1 to 3
        do if wKey = lctCods[i]
              then begin
                lctVlrs[i] := lctVlrs[i] - uDM.wVlrExtra[wCol,wLin];
                if lctVlrs[i] = 0
                   then lctCods[i] := 0;
              end;
      end;
      case nValPos of
        0:xExtras[wKey] := '0';
        1:xExtras[wKey] := '1';
        2:xExtras[wKey] := '2';
      end;
    end;
  end;
  uDM.PedWrkExtras.AsString  := xExtras;
  uDM.PedWrkCod01.AsInteger  := lctCods[1];
  uDM.PedWrkVlr01.AsCurrency := lctVlrs[1];
  uDM.PedWrkCod02.AsInteger  := lctCods[2];
  uDM.PedWrkVlr02.AsCurrency := lctVlrs[2];
  uDM.PedWrkCod03.AsInteger  := lctCods[3];
  uDM.PedWrkVlr03.AsCurrency := lctVlrs[3];
  //
  // Total do ítem
  uDM.PedWrkVlrTotal.AsCurrency := wVlrItem + lctVlrs[1] + lctVlrs[2] + lctVlrs[3];
  wTxtExtra := '';       // Acrescentar
  wTxtExclu := '';       // Excluir
  for i := 1 to 24 do
  begin
    if xExtras[i] = 'X'
    then begin
      if wTxtExclu <> '' then wTxtExclu := wTxtExclu + '; ';
      wTxtExclu := wTxtExclu + uDM.wTxtExtraTab[i];
    end
    else if xExtras[i] <> '0'
         then begin
           if wTxtExtra <> '' then wTxtExtra := wTxtExtra + '; ';
           wTxtExtra  := wTxtExtra + uDM.wTxtExtraTab[i] + '(' + xExtras[i];
           if (i = lctCods[1]) or (i = lctCods[2]) or (i = lctCods[1])
           then wTxtExtra := wTxtExtra +  'X' + FloatToStrF(uDM.wVlrExtraTab[i],ffNumber,15,2);
           wTxtExtra := wTxtExtra + ')';
         end;
  end;
  uDM.PedWrkTxtExtras.AsString := wTxtExtra;
  uDM.PedWrkTxtExclus.AsString := wTxtExclu;

end;

end.
