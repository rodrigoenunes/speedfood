unit uTrataLanche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, System.UITypes, Vcl.Touch.Keyboard, Vcl.Mask;
  Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean; pMaxExtras:Integer);

type
  TFuTrataLanche = class(TForm)
    PanInfoLanche: TPanel;
    PanRodape: TPanel;
    PanBtOk: TPanel;
    btOkLanche: TBitBtn;
    PanObservacoes: TPanel;
    dbMais: TDBMemo;
    btCanLanche: TBitBtn;
    dbObserv: TDBMemo;
    btExcLanche: TBitBtn;
    imgObs: TImage;
    GridExtras: TDrawGrid;
    dbMenos: TDBMemo;
    dbSem: TDBMemo;
    Teclado: TTouchKeyboard;
    PanIdLanche: TPanel;
    dbPreco: TDBEdit;
    dbDescricao: TDBText;
    imgMais: TImage;
    imgMenos: TImage;
    imgPreco: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbExtras: TDBEdit;
    dbTotal: TDBEdit;
    PanPrensarCortar: TPanel;
    dbCortado: TDBCheckBox;
    dbPrensado: TDBCheckBox;
    Label4: TLabel;
    panMais: TPanel;
    panSem: TPanel;
    panMenos: TPanel;
    PanZerar: TPanel;
    LabReset: TLabel;
    ImgReset: TImage;
    LabTaman: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btOkLancheClick(Sender: TObject);
    procedure btCanLancheClick(Sender: TObject);
    procedure btExcLancheClick(Sender: TObject);
    procedure GridExtrasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure GridExtrasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbObservEnter(Sender: TObject);
    procedure dbObservExit(Sender: TObject);
    procedure dbObservKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgPrecoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbPrecoEnter(Sender: TObject);
    procedure dbPrecoExit(Sender: TObject);
    procedure dbPrecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure ImgResetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuTrataLanche: TFuTrataLanche;
  lInclusao: Boolean;
  altBtn,lrgBtn,lrgImg: Integer;
  tvLeft,tvTop: Integer;
  maxExtras: Integer;

implementation

{$R *.dfm}

uses uGenericas, uDados;

Procedure MontaTelaExtras;
var nCols,nLins,nAlt,i,dimUtil: Integer;
    largs: array of real;
    posBarra: String;
    altBarra,lrgBarra,altMaxima,lrgMaxima: Integer;
begin
  with FuTrataLanche
  do begin
    posBarra := ObtemConfiguracaoTela(altBarra,lrgBarra,altMaxima,lrgMaxima);
    Width  := Trunc(lrgMaxima * 0.80);
    Height := altMaxima;
    Top    := 0;
    if posBarra = 'T' then Top := altBarra + 1;
    Left   := (Screen.Width - Width) div 2;
    GridExtras.Align := alClient;
    nCols  := 5;
    nLins  := uDM.nExtras;
    largs  := [0.05, 0.10, 0.70, 0.10, 0.05];
    //          Nr    +     xx     -     L
    if uDM.nExtras > 10
    then begin
      nCols := 9;
      nLins := (uDM.nExtras div 2) + (uDM.nExtras mod 2);
      largs  := [0.05, 0.06, 0.31, 0.06, 0.04, 0.05, 0.06, 0.31, 0.06];
      //           Nr   +     xx     -    L     Nr     +    xx     -
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
    CarregaExtras(nCols,nLins);
  end;

end;


Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean; pMaxExtras:Integer);
var nAltura: Integer;
begin
  lInclusao := pInclusao;     // True:Inclusão   False:Alteração ou Exclusão
  maxExtras := pMaxExtras;
  if not uDM.Itens.FindKey([1,pCodLanche]) then
  begin
    MessageDlg('Erro: Lanche inexistente no cadastro',mtError,[mbOk],0);
    Exit;
  end;
  with FuTrataLanche
  do begin
    imgPreco.Visible := uDM.PedWrkAltPreco.AsBoolean;
    dbPreco.ReadOnly := True;
    if uDM.PedWrkAltPreco.AsBoolean then dbPreco.ReadOnly := False;

    if lInclusao then
    begin
      nAltura := (panBtOk.Height - 15) div 2;
      btOkLanche.Visible := True;
      btExcLanche.Visible := False;
      btCanLanche.Visible := True;
      btOkLanche.Top := 4;
      btOkLanche.Height := nAltura;
      btCanLanche.Top := btOkLanche.Top + btOkLanche.Height + 5;
      btCanLanche.Height := nAltura;
    end
    else begin
      nAltura := (panBtOk.Height - 15) div 3;
      btOkLanche.Visible := True;
      btExcLanche.Visible := True;
      btCanLanche.Visible := True;
      btOkLanche.Top := 4;
      btOkLanche.Height := nAltura;
      btExcLanche.Top := btOkLanche.Top + btOkLanche.Height + 5;
      btExcLanche.Height := nAltura;
      btCanLanche.Top := btExcLanche.Top + btExcLanche.Height + 5;
      btCanLanche.Height := nAltura;
    end;
    btOkLanche.Caption  := 'Ok';
    btExcLanche.Caption := 'Excluir';
    btCanLanche.Caption := 'Cancelar';
    if not uDM.SisPessoaTecladoVirtual.AsBoolean then
    begin
      btOkLanche.Caption  := '&' + btOkLanche.Caption;
      btExcLanche.Caption := '&' + btExcLanche.Caption;
      btCanLanche.Caption := '&' + btCanLanche.Caption;
    end;
    ShowModal;
  end;

end;

Procedure ExibeTecladoVirtual(pTipo:String; pTop,pLeft:Integer);
begin
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  with FuTrataLanche
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

Procedure AjustaFonteGridExtras(pCol,pRow:Integer);
begin
  with FuTrataLanche
  do begin
    GridExtras.Canvas.Font.Name := LabTaman.Font.Name;
    GridExtras.Canvas.Font.Size := LabTaman.Font.Size;
    GridExtras.Canvas.Font.Style := LabTaman.Font.Style;

  end;

end;


procedure TFuTrataLanche.btCanLancheClick(Sender: TObject);
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

procedure TFuTrataLanche.dbPrecoEnter(Sender: TObject);
begin
  if not imgPreco.Visible then Exit;
  tvLeft := dbPreco.Left - 20;
  tvTop := PanIdLanche.Top + PanIdLanche.Height;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuTrataLanche.dbPrecoExit(Sender: TObject);
begin
  Teclado.Visible := False;
  uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency + uDM.PedWrkZC_Extras.AsCurrency;

end;

procedure TFuTrataLanche.dbPrecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuTrataLanche.dbPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ',';

end;

procedure TFuTrataLanche.dbObservEnter(Sender: TObject);
begin
  tvLeft := dbObserv.Left - 20;
  tvTop := (PanRodape.Top + dbObserv.Top) - 310;
  ExibeTecladoVirtual('Standard',tvTop,tvLeft);

end;

procedure TFuTrataLanche.dbObservExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuTrataLanche.dbObservKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuTrataLanche.FormResize(Sender: TObject);
var nTam: Integer;
begin
  PanPrensarCortar.Width := (PanRodape.Width - PanObservacoes.Width) div 4;
  PanZerar.Width := PanPrensarCortar.Width - 40;
  ImgReset.Left := (PanZerar.Width - ImgReset.Width) div 2;
  LabReset.Left := (PanZerar.Width - LabReset.Width) div 2;
  nTam := PanObservacoes.Width - 8;
  panSem.Width := Trunc(nTam * 0.30);
  panMenos.Width := panSem.Width;
  panMais.Width := nTam - (panSem.Width + panMenos.Width);
  panMais.Left := 0;
  panSem.Left := panMais.Left + panMais.Width + 4;
  panMenos.Left := panSem.Left + panSem.Width + 4;
  dbMais.Left := panMais.Left;
  dbMais.Width := panMais.Width;
  dbSem.Left := panSem.Left;
  dbSem.Width := panSem.Width;
  dbMenos.Left := panMenos.Left;
  dbMenos.Width := panMenos.Width;

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
    nCol,nRow,nTop,nLeft,nPos,nLinTxt: Integer;
    descr1,descr2,descr3: String;
    naoCabe: Boolean;
begin
  GridExtras.Canvas.Brush.Style := bsClear;
  GridExtras.Canvas.FillRect(Rect);
  if ACol < 5 then nCol := 1
              else nCol := 2;
  nRow := ARow + 1;
  case ACol of
    0,5:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
      LabTaman.Font.Size := 18;
      LabTaman.Font.Style := [fsBold];
      LabTaman.Caption := IntToStr(uDM.wCodExtra[nCol,nRow]);
      AjustaFonteGridExtras(ACol,ARow);
      nTop := (GridExtras.RowHeights[ARow] - LabTaman.Height) div 2;
      nLeft := (GridExtras.ColWidths[ACol] - LabTaman.Width) div 2;
      GridExtras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, IntToStr(uDM.wCodExtra[nCol,nRow]));
    end;
    1,6:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
        wImagem := TImage.Create(nil);
        wImagem.Picture := imgMais.Picture;
        wImagem.Transparent := True;
        GridExtras.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
        wImagem.Free;
    end;
    2,7:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
      nPos := Pos('#',uDM.wTxtExtra[nCol,nRow]);
      nLinTxt := 1;
      descr1 := uDM.wtxtExtra[nCol,nRow];
      descr2 := '';
      descr3 := '';
      if nPos > 0
      then begin
        descr1 := Copy(uDM.wTxtExtra[nCol,nRow],1,nPos-1);
        descr2 := Copy(uDM.wTxtExtra[nCol,nRow],nPos+1,Length(uDM.wTxtExtra[nCol,nRow])-nPos);
        nLinTxt := nLinTxt + 1;
      end;
      if uDM.wVlrExtra[nCol,nRow] > 0 then
      begin
        descr3 := 'R$ ' + FloatToStrF(uDM.wVlrExtra[nCol,nRow],ffNumber,15,2);
        nLinTxt := nLinTxt + 1;
      end;
      LabTaman.Font.Size := 18;
      LabTaman.Font.Style := [fsBold];
      if nLinTxt > 2 then
        LabTaman.Font.Style := [];
      naoCabe := True;
      while naoCabe do
      begin
        if (LabTaman.Height*nLinTxt)+(nLinTxt-1) >= GridExtras.RowHeights[ARow]
        then begin
          LabTaman.Font.Size := LabTaman.Font.Size - 1;
          if LabTaman.Font.Size < 11 then naoCabe := False;
        end
        else naoCabe := False;
      end;
      AjustaFonteGridExtras(ACol,ARow);
      nTop := (GridExtras.RowHeights[ARow]-(LabTaman.Height*nLinTxt)) div 2;
      LabTaman.Caption := descr1;
      nLeft := (GridExtras.ColWidths[ACol]-LabTaman.Width) div 2;
      GridExtras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, descr1);
      if descr2 <> ''
      then begin
        nTop := nTop + LabTaman.Height;
        LabTaman.Caption := descr2;
        nLeft := (GridExtras.ColWidths[ACol]-LabTaman.Width) div 2;
        GridExtras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, descr2);
      end;
      if descr3 <> ''
      then begin
        LabTaman.Font.Size := 14;
        LabTaman.Font.Style := [];
        AjustaFonteGridExtras(ACol,ARow);
        nTop := nTop + LabTaman.Height;
        LabTaman.Caption := descr3;
        nLeft := GridExtras.ColWidths[ACol]-(LabTaman.Width + 12);
        GridExtras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, descr3);
      end;
    end;
    3,8:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
      wImagem := TImage.Create(nil);
      wImagem.Picture := imgMenos.Picture;
      wImagem.Transparent := True;
      GridExtras.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
      wImagem.Free;
    end;
    4:begin
      GridExtras.Canvas.Brush.Color := $00CDCDCD;    // clYellow;
      GridExtras.Canvas.FillRect(Rect);
    end;
  end;

end;


procedure TFuTrataLanche.GridExtrasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,wCol,wLin,wKey,nExtVlr,nVezes: Integer;
    xExtras: String;
    lctCods: array of integer;
    lctVlrs: array of Currency;
    i,j: Integer;
    wTxtSem,wTxtMais,wTxtMenos: TStringList;
    msgMaxExtras: String;
begin
  GridExtras.MouseToCell(X,Y,nCol,nLin);
  {  Col 0 e 5: Codigo do extra
     Col 1 e 6: Indica MAIS
     Col 2 e 7: Indica SEM
     Col 3 e 8: Indica MENOS
     Col 4: Separador
     'Extras' (1 a 24)    '.' Sem ação   '+' Mais
                          '1' ou '2' Mais um ou dois (com valor)
                          '-' Menos   '0' SEM }
  if (nCol = 0) or (nCol = 4) or (nCol = 5) then Exit;      // Colunas sem efeito
  //
  xExtras := uDM.PedWrkExtras.AsString;            // String de 24 posições (24 extras possíveis)
  // Obtem código de extra considerado/lançado
  if nCol < 5 then wCol := 1
              else wCol := 2;
  wLin    := nLin + 1;
  wKey    := uDM.wCodExtra[wCol,wLin];     // 'Extra' (wCol,wLin) -> na matriz gerada qdo extras são carregados (uDM.wCodExtra[wCol,wLin])
  // Verifica quantos e quais os extras com valor já utilizados no lanche
  nExtVlr := 0;
  lctCods := [99,0,0,0];
  j := 1;
  for i := 1 to 24
  do if (xExtras[i] = '1') or (xExtras[i] = '2')
     then begin
       nExtVlr := nExtVlr + 1;         // Extras com valor
       if j < 4
       then begin     // Armazena os códigos de extras com valor
         lctCods[j] := i;
         j := j + 1;
       end;
     end;
  // Verifica se um dos extras já utilizados é o extra atualmente solicitado, não pode haver um quarto extra com valor
  if (nCol=1) or (nCol=6) then               // indicação de 'Mais'
    if uDM.wVlrExtra[wCol,wLin] > 0 then     // Item com valor
       if nExtVlr >= 3 then                  // Já há 3 extras com valor
          if (wKey<>lctCods[1]) and (wKey<>lctCods[2]) and (wKey<>lctCods[3]) then
             Exit;            // Não é nenhum dos extras com valor
  //
  case nCol of
    1,6:begin              // MAIS
          if uDM.wVlrExtra[wCol,wLin] > 0 then
          begin          // Extra com valor
            if xExtras[wKey] = '-'        // 'Menos'  -> Padrão
               then xExtras[wKey] := '.'
               else if (xExtras[wKey] = '0') or (xExtras[wKey] = '.')  // 'SEM' ou 'Padrao
                       then xExtras[wKey] := '1'
                       else if xExtras[wKey] = '1'        // '1' -> '2'
                               then xExtras[wKey] := '2'
          end
          else xExtras[wKey] := '+';      // Extra sem valor
        end;
    2,7:begin              // SEM
        if uDM.wVlrExtraTab[wKey] > 0 then Exit;
        if xExtras[wKey] = '0' then
           xExtras[wKey] := '.'
        else
           xExtras[wKey] := '0';
    end;
    3,8:begin              // Menos
        if xExtras[wKey] = '2'
           then xExtras[wKey] := '1'
           else if xExtras[wKey] = '1'
                   then xExtras[wKey] := '.'
                   else if uDM.wVlrExtraTab[wKey] = 0
                        then xExtras[wKey] := '-';        // Se '.' ou '+'  vira MENOS, somente se NÃO tiver valor
    end;
  end;
  //
  lctCods := [99,0,0,0];
  lctVlrs := [99,0,0,0];
  j := 1;
  for i := 1 to 24
  do if (xExtras[i] = '1') or (xExtras[i] = '2')
     then begin
       nVezes := StrToInt(xExtras[i]);
       lctCods[j] := i;
       lctVlrs[j] := uDM.wVlrExtraTab[i] * nVezes;
       j := j + 1;
       if j > 3 then Break;
     end;
  //
  uDM.PedWrkExtras.AsString  := xExtras;
  uDM.PedWrkCod01.AsInteger  := lctCods[1];
  uDM.PedWrkVlr01.AsCurrency := lctVlrs[1];
  uDM.PedWrkCod02.AsInteger  := lctCods[2];
  uDM.PedWrkVlr02.AsCurrency := lctVlrs[2];
  uDM.PedWrkCod03.AsInteger  := lctCods[3];
  uDM.PedWrkVlr03.AsCurrency := lctVlrs[3];
  uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency + uDM.PedWrkZC_Extras.AsCurrency;
  //
  wTxtMais := TStringList.Create;
  wTxtSem := TStringList.Create;
  wTxtMenos := TStringList.Create;
  for i := 1 to 24 do
  begin
    if xExtras[i] <> '.'
    then if uDM.Itens.FindKey([2,i])
         then begin
           if xExtras[i] = '0'
           then wTxtSem.Add(Trim(uDM.ItensDescricao.AsString))
           else if xExtras[i] = '-'
                then wTxtMenos.Add(Trim(uDM.ItensDescricao.AsString))
                else if xExtras[i] = '+'
                     then wTxtMais.Add(Trim(uDM.ItensDescricao.AsString))
                     else wTxtMais.Add(Trim(uDM.ItensDescricao.AsString) + ' ' + xExtras[i] +
                                         ' X ' + FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2));  // 1 ou 2
         end;
  end;
  msgMaxExtras := '';
  if wTxtMais.Count > maxExtras then msgMaxExtras := msgMaxExtras + 'MAIS  ';
  if wTxtSem.Count > maxExtras then msgMaxExtras := msgMaxExtras + 'SEM  ';
  if wTxtMenos.Count > maxExtras then msgMaxExtras := msgMaxExtras + 'MENO  ';
  if msgMaxExtras <> ''
  then messageDlg(msgMaxExtras + #13 +
                  'Excesso de "extras" (max:' + IntToStr(maxExtras) + '), reinforme',
                  mtError,[mbOk],0)
  else begin
    uDM.PedWrkTxtSem.Assign(wTxtSem);
    uDM.PedWrkTxtMais.Assign(wTxtMais);
    uDM.PedWrkTxtMenos.Assign(wTxtMenos);
  end;
  wTxtSem.Free;
  wTxtMais.Free;
  wTxtMenos.Free;

end;

procedure TFuTrataLanche.ImgResetMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  uDM.PedWrkExtras.AsString  := stringFiller('.',24);
  uDM.PedWrkCod01.AsInteger  := 0;
  uDM.PedWrkVlr01.AsCurrency := 0;
  uDM.PedWrkCod02.AsInteger  := 0;
  uDM.PedWrkVlr02.AsCurrency := 0;
  uDM.PedWrkCod03.AsInteger  := 0;
  uDM.PedWrkVlr03.AsCurrency := 0;
  uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency;
  uDM.PedWrkTxtSem.Clear;
  uDM.PedWrkTxtMais.Clear;
  uDM.PedWrkTxtMenos.Clear;
  uDM.PedWrkPrensado.AsBoolean := False;
  uDM.PedWrkCortado.AsBoolean := False;
  uDM.PedWrkEtqImpressa.AsInteger := 0;

end;

procedure TFuTrataLanche.imgPrecoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  dbPreco.SetFocus;

end;

end.
