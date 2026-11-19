unit uTrataFrituraV2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, System.UITypes, Vcl.Touch.Keyboard, Vcl.Mask;
  Procedure TratativaFriturasV2(pCodFritura:Integer; pInclusao:Boolean; pMaxExtras:Integer);

type
  TFuTrataFrituraV2 = class(TForm)
    PanInfoLanche: TPanel;
    PanRodape: TPanel;
    PanBotoes: TPanel;
    btOkFritura: TBitBtn;
    btCanFritura: TBitBtn;
    btExcFritura: TBitBtn;
    GridExtrasFritura: TDrawGrid;
    Teclado: TTouchKeyboard;
    PanIdFritura: TPanel;
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
    PanZerar: TPanel;
    LabReset: TLabel;
    ImgReset: TImage;
    LabTaman: TLabel;
    PanObservacoes: TPanel;
    PanObsTexto: TPanel;
    imgObs: TImage;
    dbObserv: TDBMemo;
    PanObsMais: TPanel;
    PanMais: TPanel;
    dbMais: TDBMemo;
    PanObsSem: TPanel;
    PanSem: TPanel;
    dbSem: TDBMemo;
    PanObsMenos: TPanel;
    panMenos: TPanel;
    dbMenos: TDBMemo;
    procedure FormShow(Sender: TObject);
    procedure btOkFrituraClick(Sender: TObject);
    procedure btCanFrituraClick(Sender: TObject);
    procedure btExcFrituraClick(Sender: TObject);
    procedure GridExtrasFrituraDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure GridExtrasFrituraMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuTrataFrituraV2: TFuTrataFrituraV2;
  lInclusao: Boolean;
  altBtn,lrgBtn,lrgImg: Integer;
  tvLeft,tvTop: Integer;
  maxExtras: Integer;
  kItem: Integer;


implementation

{$R *.dfm}

uses uGenericas, uDados, uPedBalcaoV2;

Procedure MontaTelaExtrasFriturasV2;
var nExtras,nTpExtra,nFontes,nColunas,nLinhas,nAltLin,dimUtil,i: Integer;
    largs: array of real;
    posBarra: String;
    altBarra,lrgBarra,altMaxima,lrgMaxima: Integer;
begin
  with FuTrataFrituraV2
  do begin
    posBarra := ObtemConfiguracaoTela(altBarra,lrgBarra,altMaxima,lrgMaxima);
    Width  := lrgMaxima - 20;  // Trunc(lrgMaxima * 0.80);
    Height := altMaxima;
    Top    := 0;
    if posBarra = 'T' then
      Top := altBarra + 1;
    Left   := (Screen.Width - Width) div 2;
    GridExtrasFritura.Align := alClient;
    //
    nColunas := 9;                                       // Colunas do DrawGrid (Fixo)
    nExtras := FuPedBalcaoV2.qtdFritExt;
    nLinhas := (nExtras div 2) + (nExtras mod 2);        // Linhas do DrawGrid (Variável)
    largs  := [0.04, 0.05, 0.31, 0.05, 0.03, 0.04, 0.05, 0.31, 0.05];  // |Nr|+|descricao|-|Espaco|Nr|+|descricao|-|
    GridExtrasFritura.ColCount := nColunas;
    GridExtrasFritura.RowCount := nLinhas;
    nAltLin := StrToInt(ObtemParametro('FriturasExtrasAltura','52'));    // Altura das linhas
    if nAltLin < 44 then
      nAltLin := 44;
    if nAltLin > 120 then
      nAltLin := 120;
    if nLinhas < 4 then
      nAltLin := 100;
    for i := 0 to GridExtrasFritura.RowCount-1 do
      GridExtrasFritura.RowHeights[i] := nAltLin;
    dimUtil := GridExtrasFritura.Width - (24 + nColunas);
    for i := 0 to GridExtrasFritura.ColCount-1 do
      GridExtrasFritura.ColWidths[i] := Trunc(dimUtil * largs[i]);

  end;

end;


Procedure TratativaFriturasV2(pCodFritura:Integer; pInclusao:Boolean; pMaxExtras:Integer);
begin
  // Específico para Lanches (Cachorro-quente)   Tipo = 1
  lInclusao := pInclusao;     // True:Inclusão   False:Alteração ou Exclusão
  maxExtras := pMaxExtras;
  kItem := pCodFritura;
  with FuTrataFrituraV2 do
  begin
    Caption := 'Especificação - Fritura';
    imgPreco.Visible := uDM.PedWrkAltPreco.AsBoolean;
    dbPreco.ReadOnly := True;
    if uDM.PedWrkAltPreco.AsBoolean then
      dbPreco.ReadOnly := False;
    if lInclusao then
    begin
      btOkFritura.Visible := True;
      btExcFritura.Visible := False;
      btCanFritura.Visible := True;
      btOkFritura.Height := (panBotoes.Height - 15) div 2;
      btOkFritura.Top := 4;
      btCanFritura.Top := btOkFritura.Top + btOkFritura.Height + 5;
      btCanFritura.Height := btOkFritura.Height;
    end
    else begin
      btOkFritura.Visible := True;
      btExcFritura.Visible := True;
      btCanFritura.Visible := True;
      btOkFritura.Top := 4;
      btOkFritura.Height := (panBotoes.Height - 15) div 3;
      btExcFritura.Top := btOkFritura.Top + btOkFritura.Height + 5;
      btExcFritura.Height := btOkFritura.Height;
      btCanFritura.Top := btExcFritura.Top + btExcFritura.Height + 5;
      btCanFritura.Height := btOkFritura.Height;
    end;

    btOkFritura.Caption  := 'Ok';
    btExcFritura.Caption := 'Excluir';
    btCanFritura.Caption := 'Cancelar';
    if not uDM.SisPessoaTecladoVirtual.AsBoolean then
    begin
      btOkFritura.Caption  := '&' + btOkFritura.Caption;
      btExcFritura.Caption := '&' + btExcFritura.Caption;
      btCanFritura.Caption := '&' + btCanFritura.Caption;
    end;
    ShowModal;

  end;

end;

Procedure ExibeTecladoVirtual(pTipo:String; pTop,pLeft:Integer);
begin
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  with FuTrataFrituraV2
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


procedure TFuTrataFrituraV2.btCanFrituraClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  if lInclusao then
    uDM.PedWrk.Delete;
  FuTrataFrituraV2.Close;

end;

procedure TFuTrataFrituraV2.btExcFrituraClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  uDM.PedWrk.Delete;
  FuTrataFrituraV2.Close;

end;

procedure TFuTrataFrituraV2.btOkFrituraClick(Sender: TObject);
begin
  uDM.PedWrk.Post;
  FuTrataFrituraV2.Close;

end;

procedure TFuTrataFrituraV2.dbPrecoEnter(Sender: TObject);
begin
  if not imgPreco.Visible then Exit;
  tvLeft := dbPreco.Left - 20;
  tvTop := PanIdFritura.Top + PanIdFritura.Height;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuTrataFrituraV2.dbPrecoExit(Sender: TObject);
begin
  Teclado.Visible := False;
  uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency + uDM.PedWrkZC_Extras.AsCurrency;

end;

procedure TFuTrataFrituraV2.dbPrecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuTrataFrituraV2.dbPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ',';

end;

procedure TFuTrataFrituraV2.dbObservEnter(Sender: TObject);
begin
  tvLeft := dbObserv.Left - 20;
  tvTop := (PanRodape.Top + dbObserv.Top) - 310;
  ExibeTecladoVirtual('Standard',tvTop,tvLeft);

end;

procedure TFuTrataFrituraV2.dbObservExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuTrataFrituraV2.dbObservKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuTrataFrituraV2.FormCreate(Sender: TObject);
begin
  // Ajusta o rodapé da tela
  panObsSem.Align := alClient;
  dbMais.Align := alClient;
  dbSem.Align := alClient;
  dbMenos.Align := alClient;

end;

procedure TFuTrataFrituraV2.FormResize(Sender: TObject);
begin
  PanObservacoes.Width := Width div 2;
  PanBotoes.Width := (PanObservacoes.Width div 3) * 2;
  PanZerar.Width := 100;
  PanObsMais.Width := PanObservacoes.Width div 3;
  PanObsMenos.Width := PanObsMais.Width;

end;

procedure TFuTrataFrituraV2.FormShow(Sender: TObject);
begin
  GridExtrasFritura.SetFocus;
  GridExtrasFritura.Col := 0;
  GridExtrasFritura.Row := 0;
  MontaTelaExtrasFriturasV2;

end;

procedure TFuTrataFrituraV2.GridExtrasFrituraDrawCell(Sender: TObject; ACol,ARow: Integer; Rect: TRect; State: TGridDrawState);
var wImagem: TImage;
    nCol,nRow,nTop,nLeft,nLinTxt,nAlturaTxt: Integer;
    wText,descr1,descr3: String;
    naoCabe: Boolean;
begin
  GridExtrasFritura.Canvas.Brush.Style := bsClear;
  GridExtrasFritura.Canvas.FillRect(Rect);
  if ACol < 5 then nCol := 0
              else nCol := 1;
  nRow := ARow;

  case ACol of
    0,5:if FuPedBalcaoV2.wCodFritExt[nCol,nRow] > 0 then
      begin
        LabTaman.Font.Name := 'Tahoma';    // Fixo Tahoma
        LabTaman.Font.Size := FuPedBalcaoV2.wRegsFonte[6].Size;
        LabTaman.Font.Style := [fsBold];
        LabTaman.Font.Color := clBlack;
        wText := StringCompleta(IntToStr(FuPedBalcaoV2.wCodFritExt[nCol,nRow]),'E','0',2);
        LabTaman.Caption := wText;
        GridExtrasFritura.Canvas.Font := LabTaman.Font;
        nTop := (GridExtrasFritura.RowHeights[ARow] - LabTaman.Height) div 2;
        nLeft := (GridExtrasFritura.ColWidths[ACol] - LabTaman.Width) div 2;
        GridExtrasFritura.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, wText);
      end;
    1,6:if FuPedBalcaoV2.wCodExtras[nCol,nRow] > 0 then
      begin
        wImagem := TImage.Create(nil);
        wImagem.Picture := imgMais.Picture;
        wImagem.Transparent := True;
        GridExtrasFritura.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
        wImagem.Free;
      end;
    2,7:if FuPedBalcaoV2.wCodExtras[nCol,nRow] > 0 then
      begin      // Font 7  Extras de lanches
        LabTaman.Font.Name := FuPedBalcaoV2.wRegsFonte[6].Name;
        LabTaman.Font.Size := FuPedBalcaoV2.wRegsFonte[6].Size;
        LabTaman.Font.Style := FuPedBalcaoV2.wRegsFonte[6].Style;
        LabTaman.Font.Color := FuPedBalcaoV2.wRegsFonte[6].Color;
        nLinTxt := 1;
        descr1 := FuPedBalcaoV2.wTxtFritExt[nCol,nRow];
        descr3 := '';
        if FuPedBalcaoV2.wVlrFritExt[nCol,nRow] > 0 then
        begin
          descr3 := 'R$ ' + FloatToStrF(FuPedBalcaoV2.wVlrFritExt[nCol,nRow],ffNumber,15,2);
          nLinTxt := 2;
        end;
        LabTaman.Caption := descr1;
        naoCabe := True;
        while naoCabe do
        begin
          if (LabTaman.Width > (GridExtrasFritura.ColWidths[Acol]-4)) or
             ((LabTaman.Height*nLinTxt) > (GridExtrasFritura.RowHeights[ARow]-3)) then
          begin
            LabTaman.Font.Size := LabTaman.Font.Size-1;
            if LabTaman.Font.Size < 8 then
              naoCabe := False;
          end
          else naoCabe := False;
        end;
        GridExtrasFritura.Canvas.Font := LabTaman.Font;
        if nLinTxt = 1 then
          nAlturaTxt := LabTaman.Height
        else
          nAlturaTxt := LabTaman.Height * 2 + 2;
        nTop := (GridExtrasFritura.RowHeights[ARow]-nAlturaTxt) div 2;
        nLeft := (GridExtrasFritura.ColWidths[ACol]-LabTaman.Width) div 2;
        GridExtrasFritura.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, descr1);
        if descr3 <> '' then
        begin
          nTop := nTop + LabTaman.Height + 1;
          LabTaman.Caption := descr3;
          nLeft := GridExtrasFritura.ColWidths[ACol]-(LabTaman.Width + 8);
          GridExtrasFritura.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, descr3);
        end;
      end;
    3,8:if FuPedBalcaoV2.wCodExtras[nCol,nRow] > 0 then
      begin
        wImagem := TImage.Create(nil);
        wImagem.Picture := imgMenos.Picture;
        wImagem.Transparent := True;
        GridExtrasFritura.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
        wImagem.Free;
      end;
    4:begin
        GridExtrasFritura.Canvas.Brush.Color := $00CDCDCD;    // clYellow;
        GridExtrasFritura.Canvas.FillRect(Rect);
      end;
  end;

end;


procedure TFuTrataFrituraV2.GridExtrasFrituraMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,wCol,wLin,wKey,nExtVlr,nVezes: Integer;
    wVlr: Currency;
    xExtras: String;
    lctCods: array [1..3] of integer;
    lctVlrs: array [1..3] of Currency;
    i: Integer;
    wDescrExtra: String;
    wTxtSem,wTxtMais,wTxtMenos: TStringList;
    msgMaxExtras: String;
begin
 {
   Colunas 0 e 5:Codigo do extra; 1 e 6:MAIS; 2 e 7:SEM; 3 e 8:MENOS; 4:   Col 4:Separador
   Click em 1 ou 6 Incrementa a quantidade de extra (+)
   Click em 2 ou 7 Reduz a quantidade de extra a ZERO (sem)
   Click em 3 ou 8 Reduz a quantidade de extra (-), se houver indicação anterior de incremento
   Para extras com valor, considerar 1, 2 ou 3
   Extras tem 100 posições (a posição corresponde ao código do extra)
   '.' Sem ação;  '+' ou '-';  '1 2 3' Houve incremento;  '0' SEM
   wTxtMais...: Extras a serem adicionados ou aumentados ao lanche, com ou sem valor
   wTxtSem....: Extras a serem excluídos do lanche
   wTxtMenos..: Extras a serem reduzidos no lanche
}
  GridExtrasFritura.MouseToCell(X,Y,nCol,nLin);
  if nCol in [0,4,5] then      // Colunas sem efeito
    Exit;
  // Obtem código de extra considerado/lançado (em FuPedBalcaoV2.wCodExtras)
  if nCol < 5 then
    wCol := 0
  else
    wCol := 1;
  wLin := nLin;    // + 1;
  wKey := FuPedBalcaoV2.wCodFritExt[wCol,wLin];         // Código do extra atual
  wVlr := FuPedBalcaoV2.wVlrFritExt[wCol,wLin];         // Valor unitário do extra atual
  xExtras := uDM.PedWrkExtras.AsString;                 // Extras do ítem
  // Obtém os extras com valor anteriormente utilizados no lanche (máximo 3)
  for i := 1 to 3 do
  begin
    lctCods[i] := 0;
    lctVlrs[i] := 0;
  end;
  nExtVlr := 0;
  for i := 1 to 100 do
  begin
    if (xExtras[i] = '1') or (xExtras[i] = '2') or (xExtras[i] = '3') then
    begin                            // Extra com valor
      nExtVlr := nExtVlr + 1;        // Contagem de extras com valor já utilizados
      lctCods[nExtVlr] := i;         // Salva o "extra" utilizado
      if nExtVlr = 3 then            // Máximo 3 valores
        Break;
    end;
  end;
  //
  case nCol of
    1,6:begin        // MAIS
          if (wVlr > 0) and (nExtVlr = 3) then
          begin
            MessageDlg('Já há 3 (três) extras com valor',mtWarning,[mbOk],0);
            Exit;
          end;
          if wVlr = 0 then           // Extra sem valor
            xExtras[wKey] := '+'        // Indica que deve ter mais
          else begin                 // Extra com valor
            if xExtras[wKey] = '.' then
              xExtras[wKey] := '1'
            else if xExtras[wKey] = '1' then
                   xExtras[wKey] := '2'
                 else if xExtras[wKey] = '2' then
                        xExtras[wKey] := '3';
          end;
        end;
    2,7:begin              // SEM
          if wVlr = 0 then
          begin
            if xExtras[wKey] = '.' then
              xExtras[wKey] := '0'
            else
              xExtras[wKey] := '.';
          end
          else
            xExtras[wKey] := '.';
        end;
    3,8:begin              // Menos
          if wVlr = 0 then
            xExtras[wKey] := '-'
          else begin
            if xExtras[wKey] = '3' then
              xExtras[wKey] := '2'
            else if xExtras[wKey] = '2' then
                   xExtras[wKey] := '1'
                 else if xExtras[wKey] = '1' then
                        xExtras[wKey] := '.'
                      else if xExtras[wKey] = '.' then
                             xExtras[wKey] := '-';        // Se '.' ou '+'  vira MENOS, somente se NÃO tiver valor
          end;
        end;
  end;
  //
  for i := 1 to 3 do
  begin
    lctCods[i] := 0;
    lctVlrs[i] := 0;
  end;
  wTxtMais  := TStringList.Create;
  wTxtSem   := TStringList.Create;
  wTxtMenos := TStringList.Create;
  nExtVlr   := 0;
  for i := 1 to 100
  do begin
    if xExtras[i] <> '.' then
    begin
      if uDM.Itens.FindKey([22,i]) then
      begin
        wDescrExtra := stringReplace(Trim(uDM.ItensDescricao.AsString),'#','',[rfIgnoreCase, rfReplaceAll]);
        wVlr := uDM.ItensPreco.AsCurrency;
        if (xExtras[i] in ['1','2','3']) and (nExtVlr < 3) then
        begin
          nExtVlr := nExtVlr + 1;            // Contagem de extras com valor informados
          nVezes := StrToInt(xExtras[i]);
          lctCods[nExtVlr] := i;
          lctVlrs[nExtVlr] := wVlr * nVezes;
          wTxtMais.Add(wDescrExtra + ' ' + xExtras[i] + ' x ' + FloatToStrF(wVlr,ffNumber,15,2));
        end
        else if xExtras[i] = '-' then
               wTxtMenos.Add(wDescrExtra)
             else if xExtras[i] = '0' then
                    wTxtSem.Add(wDescrExtra)
                  else if xExtras[i] = '+' then
                         wTxtMais.Add(wDescrExtra);
      end;
    end;
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
  msgMaxExtras := '';
  if wTxtMais.Count > maxExtras then
    msgMaxExtras := msgMaxExtras +  '( + MAIS )  ';
  if wTxtSem.Count > maxExtras then
    msgMaxExtras := msgMaxExtras +   '( SEM )  ';
  if wTxtMenos.Count > maxExtras then
    msgMaxExtras := msgMaxExtras + '( - MENOS )  ';
  if msgMaxExtras <> '' then
    messageDlg('Extras' + #13 + msgMaxExtras + #13 +
               'Excesso de "extras" (max.permitido: ' + IntToStr(maxExtras) + '), reinforme',
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

procedure TFuTrataFrituraV2.ImgResetMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  uDM.PedWrkExtras.AsString  := stringFiller('.',48);
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

procedure TFuTrataFrituraV2.imgPrecoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  dbPreco.SetFocus;

end;

end.
