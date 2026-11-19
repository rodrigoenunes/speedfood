unit uTrataExtrasV2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, System.UITypes, Vcl.Touch.Keyboard, Vcl.Mask;
  Procedure TratativaExtrasV2(pTipo:Integer; pCodigo:Integer; pInclusao:Boolean; pMaxExtras:Integer);

type
  TFuTrataExtrasV2 = class(TForm)
    PanInfoLanche: TPanel;
    PanRodape: TPanel;
    PanBtOk: TPanel;
    btOkExtra: TBitBtn;
    PanObservacoes: TPanel;
    btCanExtra: TBitBtn;
    btExcExtra: TBitBtn;
    GridExtras: TDrawGrid;
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
    LabTaman: TLabel;
    PanObsTexto: TPanel;
    imgObs: TImage;
    dbObserv: TDBMemo;
    PanObsMais: TPanel;
    PanObsSem: TPanel;
    PanObsMenos: TPanel;
    PanMais: TPanel;
    dbMais: TDBMemo;
    PanSem: TPanel;
    panMenos: TPanel;
    dbSem: TDBMemo;
    dbMenos: TDBMemo;
    ImgReset: TImage;
    LabReset: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btOkExtraClick(Sender: TObject);
    procedure btCanExtraClick(Sender: TObject);
    procedure btExcExtraClick(Sender: TObject);
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
    procedure ImgResetMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuTrataExtrasV2: TFuTrataExtrasV2;
  lInclusao: Boolean;
  altBtn,lrgBtn,lrgImg: Integer;
  tvLeft,tvTop: Integer;
  maxExtras: Integer;
  kGrupo,kItem,kGrpExtras: Integer;
  wCodExtras:  array[0..1,0..39] of Integer;
  wTxtExtras:  array[0..1,0..39] of String;
  wVlrExtras:  array[0..1,0..39] of Currency;
  wQtdExtras:   Integer;
  wAltLin: Integer;
  lCortarPrensar: Boolean;

implementation

{$R *.dfm}

uses uGenericas, uDados, uPedBalcaoV2;

Procedure MontaTelaExtrasV2;
var posBarra: String;
    altBarra,lrgBarra,altMaxima,lrgMaxima: Integer;
    nColunas,nLinhas: Integer;
    i,dimUtil: Integer;
    largs: array of real;

begin
  with FuTrataExtrasV2
  do begin
    posBarra := ObtemConfiguracaoTela(altBarra,lrgBarra,altMaxima,lrgMaxima);
    Width  := lrgMaxima - 20;  // Trunc(lrgMaxima * 0.80);
    Height := altMaxima;
    Top    := 0;
    if posBarra = 'T' then
      Top := altBarra + 1;
    Left   := (Screen.Width - Width) div 2;
    GridExtras.Align := alClient;
    //
    nColunas := 9;
    nLinhas := (wQtdExtras div 2) + (wQtdExtras mod 2);                // Linhas do DrawGrid (Variável)
    largs  := [0.04, 0.05, 0.31, 0.05, 0.03, 0.04, 0.05, 0.31, 0.05];  // |Nr|+|descricao|-|Espaco|Nr|+|descricao|-|
    GridExtras.ColCount := nColunas;
    GridExtras.RowCount := nLinhas;
    for i := 0 to GridExtras.RowCount-1 do
      GridExtras.RowHeights[i] := wAltLin;
    dimUtil := GridExtras.Width - (24 + nColunas);
    for i := 0 to GridExtras.ColCount-1 do
      GridExtras.ColWidths[i] := Trunc(dimUtil * largs[i]);

  end;

end;


Procedure TratativaExtrasV2(pTipo:Integer; pCodigo:Integer; pInclusao:Boolean; pMaxExtras:Integer);
// pTipo: 1-Lanche --------> Extras 2
//       21-Frituras ------> Extras 22
//       31-Hamburgueres --> Extras 32
//        4-Montagem ------> Extras 5
// pCodigo: Código do produto
// pInclusao: Incluindo item
// pMaxExtras: Maximo de extras permitidos no ítem
//             Fonte[6] ....  Pré-definido  Todos os extras usam o mesmo fonte
var nC,nR: Integer;
begin
  lInclusao := pInclusao;     // True:Inclusão   False:Alteração ou Exclusão
  maxExtras := pMaxExtras;
  kGrupo := pTipo;
  kItem := pCodigo;
  with FuTrataExtrasV2
  do begin
    Caption := 'Especificação - ';
    case kGrupo of
      1:begin
          Caption := Caption + 'Cachorro-quente';
          kGrpExtras := 2;
          wAltLin := StrToInt(ObtemParametro('LanchesExtrasAltura','52'));    // Altura das linhas
          lCortarPrensar := True;

        end;
      4:begin
          Caption := Caption + 'Monte seu lanche';
          kGrpExtras := 5;
          wAltLin := StrToInt(ObtemParametro('LanchesExtrasAltura','52'));    // Altura das linhas
          lCortarPrensar := True;

        end;
     21:begin
          Caption := Caption + 'Frituras';
          kGrpExtras := 22;
          wAltLin := StrToInt(ObtemParametro('FriturasExtrasAltura','52'));    // Altura das linhas
          lCortarPrensar := False;

        end;
     31:begin
          Caption := Caption + 'Hamburgueres';
          kGrpExtras := 32;
          wAltLin := StrToInt(ObtemParametro('HamburgueresExtrasAltura','52'));    // Altura das linhas
          lCortarPrensar := False;

        end;
     else begin
          MessageDlg('Grupo inválido [' + IntToStr(kGrupo) +']',mtError,[mbOk],0);
          Exit;
        end;

    end;
    dbPrensado.Visible := lCortarPrensar;
    dbCortado.Visible := lCortarPrensar;
    FuPedBalcaoV2.FDQuery1.SQL.Text := 'Select Count(*) as nRegs from com_itens where grupo=' + IntToStr(kGrpExtras);
    FuPedBalcaoV2.FDQuery1.Open;
    wQtdExtras := FuPedBalcaoV2.FDQuery1.FieldByName('nRegs').AsInteger;
    if wAltLin < 44 then
      wAltLin := 44;
    if wAltLin > 120 then
      wAltLin := 120;
    //
    for nC := 0 to 1 do
      for nR := 0 to 39 do
        begin
          wCodExtras[nC,nR] := 0;
          wTxtExtras[nC,nR] := '';
          wVlrExtras[nC,nR] := 0;
        end;
    //
    nC := 0;
    nR := 0;
    uDM.Itens.FindNearest([kGrpExtras,0]);
    while (uDM.ItensGrupo.AsInteger = kGrpExtras) and (not uDM.Itens.Eof) do
    begin
      wCodExtras[nC,nR] := uDM.ItensCodigo.AsInteger;
      wTxtExtras[nC,nR] := stringReplace(Trim(uDM.ItensDescricao.AsString),'#','',[rfIgnoreCase, rfReplaceAll]);
      wVlrExtras[nC,nR] := uDM.ItensPreco.AsCurrency;
      nC := nC + 1;
      if nC > 1 then
      begin
        nC := 0;
        nR := nR + 1;
      end;
      if nR > 39 then
        uDM.Itens.Last;
      uDM.Itens.Next;
    end;
    //
    imgPreco.Visible := uDM.PedWrkAltPreco.AsBoolean;
    dbPreco.ReadOnly := True;
    if uDM.PedWrkAltPreco.AsBoolean then
      dbPreco.ReadOnly := False;
    if lInclusao then
    begin
      btOkExtra.Visible := True;
      btExcExtra.Visible := False;
      btCanExtra.Visible := True;
      btOkExtra.Height := (panBtOk.Height - 15) div 2;
      btOkExtra.Top := 4;
      btCanExtra.Top := btOkExtra.Top + btOkExtra.Height + 5;
      btCanExtra.Height := btOkExtra.Height;
    end
    else begin
      btOkExtra.Visible := True;
      btExcExtra.Visible := True;
      btCanExtra.Visible := True;
      btOkExtra.Top := 4;
      btOkExtra.Height := (panBtOk.Height - 15) div 3;
      btExcExtra.Top := btOkExtra.Top + btOkExtra.Height + 5;
      btExcExtra.Height := btOkExtra.Height;
      btCanExtra.Top := btExcExtra.Top + btExcExtra.Height + 5;
      btCanExtra.Height := btOkExtra.Height;
    end;
    btOkExtra.Caption  := 'Ok';
    btExcExtra.Caption := 'Excluir';
    btCanExtra.Caption := 'Cancelar';
    if not uDM.SisPessoaTecladoVirtual.AsBoolean then
    begin
      btOkExtra.Caption  := '&' + btOkExtra.Caption;
      btExcExtra.Caption := '&' + btExcExtra.Caption;
      btCanExtra.Caption := '&' + btCanExtra.Caption;
    end;
    ShowModal;

  end;

end;

Procedure ExibeTecladoVirtual(pTipo:String; pTop,pLeft:Integer);
begin
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  with FuTrataExtrasV2
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


procedure TFuTrataExtrasV2.btCanExtraClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  if lInclusao then
    uDM.PedWrk.Delete;
  FuTrataExtrasV2.Close;

end;

procedure TFuTrataExtrasV2.btExcExtraClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  uDM.PedWrk.Delete;
  FuTrataExtrasV2.Close;

end;

procedure TFuTrataExtrasV2.btOkExtraClick(Sender: TObject);
begin
  uDM.PedWrk.Post;
  FuTrataExtrasV2.Close;

end;

procedure TFuTrataExtrasV2.dbPrecoEnter(Sender: TObject);
begin
  if not imgPreco.Visible then Exit;
  tvLeft := dbPreco.Left - 20;
  tvTop := PanIdLanche.Top + PanIdLanche.Height;
  ExibeTecladoVirtual('NumPad',tvTop,tvLeft);

end;

procedure TFuTrataExtrasV2.dbPrecoExit(Sender: TObject);
begin
  Teclado.Visible := False;
  uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency + uDM.PedWrkZC_Extras.AsCurrency;

end;

procedure TFuTrataExtrasV2.dbPrecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuTrataExtrasV2.dbPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ',';

end;

procedure TFuTrataExtrasV2.dbObservEnter(Sender: TObject);
begin
  tvLeft := dbObserv.Left - 20;
  tvTop := (PanRodape.Top + dbObserv.Top) - 310;
  ExibeTecladoVirtual('Standard',tvTop,tvLeft);

end;

procedure TFuTrataExtrasV2.dbObservExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuTrataExtrasV2.dbObservKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuTrataExtrasV2.FormCreate(Sender: TObject);
begin
  // Ajusta o rodapé da tela
  panObsSem.Align := alClient;
  dbMais.Align := alClient;
  dbSem.Align := alClient;
  dbMenos.Align := alClient;

end;

procedure TFuTrataExtrasV2.FormResize(Sender: TObject);
begin
  PanObservacoes.Width := Width div 2;
  PanPrensarCortar.Width := 180;
  PanObsMais.Width := PanObservacoes.Width div 3;
  PanObsMenos.Width := PanObsMais.Width;

end;

procedure TFuTrataExtrasV2.FormShow(Sender: TObject);
begin
  GridExtras.SetFocus;
  GridExtras.Col := 0;
  GridExtras.Row := 0;
  MontaTelaExtrasV2;

end;

procedure TFuTrataExtrasV2.GridExtrasDrawCell(Sender: TObject; ACol,ARow: Integer; Rect: TRect; State: TGridDrawState);
var wImagem: TImage;
    nCol,nRow,nTop,nLeft,nLinTxt,nAlturaTxt: Integer;
    wText,descr1,descr3: String;
    naoCabe: Boolean;
begin
  GridExtras.Canvas.Brush.Style := bsClear;
  GridExtras.Canvas.FillRect(Rect);
  if ACol < 5 then
    nCol := 0
  else
    nCol := 1;
  nRow := ARow;
  case ACol of
    0,5:if wCodExtras[nCol,nRow] > 0 then
      begin
        LabTaman.Font.Name := 'Tahoma';    // Fixo Tahoma
        LabTaman.Font.Size := FuPedBalcaoV2.wRegsFonte[6].Size;
        LabTaman.Font.Style := [fsBold];
        LabTaman.Font.Color := clBlack;
        wText := StringCompleta(IntToStr(wCodExtras[nCol,nRow]),'E','0',2);
        LabTaman.Caption := wText;
        GridExtras.Canvas.Font := LabTaman.Font;
        nTop := (GridExtras.RowHeights[ARow] - LabTaman.Height) div 2;
        nLeft := (GridExtras.ColWidths[ACol] - LabTaman.Width) div 2;
        GridExtras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, wText);
      end;
    1,6:if wCodExtras[nCol,nRow] > 0 then
      begin
        wImagem := TImage.Create(nil);
        wImagem.Picture := imgMais.Picture;
        wImagem.Transparent := True;
        GridExtras.Canvas.StretchDraw(Rect,wImagem.Picture.Graphic);
        wImagem.Free;
      end;
    2,7:if wCodExtras[nCol,nRow] > 0 then
      begin
        LabTaman.Font.Name := FuPedBalcaoV2.wRegsFonte[6].Name;
        LabTaman.Font.Size := FuPedBalcaoV2.wRegsFonte[6].Size;
        LabTaman.Font.Style := FuPedBalcaoV2.wRegsFonte[6].Style;
        LabTaman.Font.Color := FuPedBalcaoV2.wRegsFonte[6].Color;
        nLinTxt := 1;
        descr1 := wTxtExtras[nCol,nRow];
        descr3 := '';
        if wVlrExtras[nCol,nRow] > 0 then
        begin
          descr3 := 'R$ ' + FloatToStrF(wVlrExtras[nCol,nRow],ffNumber,15,2);
          nLinTxt := 2;
        end;
        LabTaman.Caption := descr1;
        naoCabe := True;
        while naoCabe do
        begin
          if (LabTaman.Width > (GridExtras.ColWidths[Acol]-4)) or
             ((LabTaman.Height*nLinTxt) > (GridExtras.RowHeights[ARow]-3)) then
          begin
            LabTaman.Font.Size := LabTaman.Font.Size-1;
            if LabTaman.Font.Size < 8 then
              naoCabe := False;
          end
          else naoCabe := False;
        end;
        GridExtras.Canvas.Font := LabTaman.Font;
        if nLinTxt = 1 then
          nAlturaTxt := LabTaman.Height
        else
          nAlturaTxt := LabTaman.Height * 2 + 2;
        nTop := (GridExtras.RowHeights[ARow]-nAlturaTxt) div 2;
        nLeft := (GridExtras.ColWidths[ACol]-LabTaman.Width) div 2;
        GridExtras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, descr1);
        if descr3 <> '' then
        begin
          nTop := nTop + LabTaman.Height + 1;
          LabTaman.Caption := descr3;
          nLeft := GridExtras.ColWidths[ACol]-(LabTaman.Width + 8);
          GridExtras.Canvas.TextOut(Rect.Left+nLeft, Rect.Top+nTop, descr3);
        end;
      end;
    3,8:if wCodExtras[nCol,nRow] > 0 then
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


procedure TFuTrataExtrasV2.GridExtrasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
  GridExtras.MouseToCell(X,Y,nCol,nLin);
  if nCol in [0,4,5] then      // Colunas sem efeito
    Exit;
  // Obtem código de extra considerado/lançado (em FuPedBalcaoV2.wCodExtras)
  if nCol < 5 then
    wCol := 0
  else
    wCol := 1;
  wLin := nLin;
  wKey := wCodExtras[wCol,wLin];         // Código do extra atual
  wVlr := wVlrExtras[wCol,wLin];         // Valor unitário do extra atual
  xExtras := uDM.PedWrkExtras.AsString;                // Extras do ítem
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
      if uDM.Itens.FindKey([kGrpExtras,i]) then
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

procedure TFuTrataExtrasV2.ImgResetMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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

procedure TFuTrataExtrasV2.imgPrecoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  dbPreco.SetFocus;

end;

end.
