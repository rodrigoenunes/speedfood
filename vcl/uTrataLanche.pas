unit uTrataLanche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, System.UITypes, Vcl.Touch.Keyboard, Vcl.Mask;
  Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean);

type
  TFuTrataLanche = class(TForm)
    PanInfoLanche: TPanel;
    PanRodape: TPanel;
    PanBtOk: TPanel;
    btOkLanche: TBitBtn;
    PanObserv: TPanel;
    dbSEM: TDBMemo;
    btCanLanche: TBitBtn;
    dbObserv: TDBMemo;
    btExcLanche: TBitBtn;
    imgObs: TImage;
    GridExtras: TDrawGrid;
    imgExtra: TImage;
    dbMenos: TDBMemo;
    dbMais: TDBMemo;
    Image1: TImage;
    Image2: TImage;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuTrataLanche: TFuTrataLanche;
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
    largs  := [0.04, 0.10, 0.76, 0.10, 0.04];
    if uDM.nExtras > 10
    then begin
      nCols := 9;
      nLins := (uDM.nExtras div 2) + (uDM.nExtras mod 2);
      largs  := [0.04, 0.05, 0.34, 0.05, 0.04, 0.04, 0.05, 0.34, 0.05];
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


Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean);
begin
  lInclusao := pInclusao;     // True:Inclusão   False:Alteração ou Exclusão
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
    
    btExcLanche.Visible := False;
    if not lInclusao
       then btExcLanche.Visible := True;
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
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  Teclado.Left    := dbPreco.Left - 12;
  Teclado.Top     := PanIdLanche.Top + PanIdLanche.Height;
  Teclado.Width   := 180;
  Teclado.Height  := 180;
  Teclado.Layout  := 'NumPad';
  Teclado.Visible := True;

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
  if not uDM.SisPessoaTecladoVirtual.AsBoolean then Exit;
  Teclado.Left    := 40;
  Teclado.Top     := PanRodape.Top - 50;
  Teclado.Width   := 550;
  Teclado.Height  := 180;
  Teclado.Layout  := 'Standard';
  Teclado.Visible := True;

end;

procedure TFuTrataLanche.dbObservExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuTrataLanche.dbObservKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then SelectNext((Sender as TwinControl), True, True);

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
  if ACol < 5 then nCol := 1
              else nCol := 2;
  nRow := ARow + 1;
  case ACol of
    0,5:if uDM.wCodExtra[nCol,nRow] > 0 then
    begin
      GridExtras.Canvas.Font.Size := 14;
      GridExtras.Canvas.TextOut(Rect.Left+4, Rect.Top+2, IntToStr(uDM.wCodExtra[nCol,nRow]));
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
      GridExtras.Canvas.Font.Size := 14;
      GridExtras.Canvas.TextOut(Rect.Left+8, Rect.Top+2, uDM.wTxtExtra[nCol,nRow]);
      if uDM.wVlrExtra[nCol,nRow] > 0 then
        GridExtras.Canvas.TextOut(Rect.Left+8, Rect.Top+21,
                                  'R$' + FloatToStrF(uDM.wVlrExtra[nCol,nRow],ffNumber,15,2));
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
      GridExtras.Canvas.Brush.Color := clYellow;
      GridExtras.Canvas.FillRect(Rect);
      //GridExtras.Canvas.TextOut(Rect.Left+4,Rect.Top+12,'R');
    end;
  end;

end;


procedure TFuTrataLanche.GridExtrasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol,nLin,wCol,wLin,wKey,nExtVlr,nVezes: Integer;
    xExtras: String;
    lctCods: array of integer;
    lctVlrs: array of Currency;
    i,j: Integer;
    wTxtSem,wTxtMais,wTxtMenos: String;

begin
  GridExtras.MouseToCell(X,Y,nCol,nLin);
  // Col 0 e 5: Codigo do extra
  // Col 1 e 6: Indica MAIS
  // Col 2 e 7: Indica SEM
  // Col 3 e 8: Indica MENOS
  // Col 4: Separador - Lanche PADRAO
  // 'Extras' (1 a 24) '.' Sem ação; '+' Mais; '1' ou '2' Mais um ou dois (com valor);
  //                   '-' Menos  e '0' SEM
  xExtras := uDM.PedWrkExtras.AsString;    // String de 24 posições (24 extras possíveis)
  // Obtem código de extra considerado/lançado
  if nCol < 5 then wCol := 1
              else wCol := 2;
  wLin    := nLin + 1;
  wKey    := uDM.wCodExtra[wCol,wLin];                  // Obtem o Código do 'extra'
  // Verifica quantos e quais os extras com valor já utilizados no lanche
  nExtVlr := 0;
  lctCods := [99,0,0,0];
  j := 1;
  for i := 1 to 24
  do if (xExtras[i] = '1') or (xExtras[i] = '2')
     then begin
       nExtVlr := nExtVlr + 1;
       if j < 4
       then begin     // Armazena os códigos de extras com valor
         lctCods[j] := i;
         j := j + 1;
       end;
     end;
  // Verifica se um dos extras já utilizados é o extra atualmente solicitado
  // Não pode haver um quarto extra com valor
  if (nCol <> 4) and (nExtVlr >= 3)
  then if (wKey <> lctCods[1]) and (wKey <> lctCods[2]) and (wKey <> lctCods[3])
       then Exit;
  //
  case nCol of
    0,5:begin
          xExtras[wKey] := '.';
        end;

    1,6:begin              // MAIS
          if uDM.wVlrExtra[wCol,wLin] > 0 then
          begin          // Extra com valor
            if xExtras[wKey] = '-'        // 'Menos'  -> Padrão
               then xExtras[wKey] := '.'
               else if (xExtras[wKey] = '0') or       // 'SEM' ou
                       (xExtras[wKey] = '.')          // 'Padrão' -> '1'
                       then xExtras[wKey] := '1'
                       else if xExtras[wKey] = '1'        // '1' -> '2'
                               then xExtras[wKey] := '2'
          end
          else xExtras[wKey] := '+';      // Extra sem valor
        end;
    2,7:begin              // SEM
        xExtras[wKey] := '0';
    end;
    3,8:begin              // Menos
        if xExtras[wKey] = '2'
           then xExtras[wKey] := '1'
           else if xExtras[wKey] = '1'
                   then xExtras[wKey] := '.'
                   else xExtras[wKey] := '-';        // Se '.' ou '+'  vira MENOS
    end;
    4:begin                // Restaura padrão do extra ('.')
        xExtras := stringFiller('.',24);
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
  //uDM.PedWrkVlrTotal.AsCurrency := wVlrItem + lctVlrs[1] + lctVlrs[2] + lctVlrs[3];
  //
  wTxtSem   := '';
  wTxtMais  := '';
  wTxtMenos := '';
  for i := 1 to 24 do
  begin
    if uDM.Itens.FindKey([2,i]) then
    begin
      if xExtras[i] = '0' then wTxtSem   := wTxtSem + Trim(uDM.ItensDescricao.AsString) + '; ';
      if xExtras[i] = '-' then wTxtMenos := wTxtMenos + Trim(uDM.ItensDescricao.AsString) + '; ';
      if xExtras[i] = '+' then wTxtMais  := wTxtMais  + Trim(uDM.ItensDescricao.AsString) + '; ';
      if (xExtras[i] = '1') or
         (xExtras[i] = '2') then wTxtMais := wTxtMais + Trim(uDM.ItensDescricao.AsString) +
                                 '(' + xExtras[i] + 'X' + FloatToStrF(uDM.ItensPreco.AsCurrency,ffNumber,15,2) + ');';
    end;
  end;
  //if wTxtSem   <> '' then wTxtSem   := 'Sem ' + wTxtSem;
  //if wTxtMais  <> '' then wTxtMais  := '+ ' + wTxtMais;
  //if wTxtMenos <> '' then wTxtMenos := '- ' + wTxtMenos;
  uDM.PedWrkTxtSem.AsString   := wTxtSem;
  uDM.PedWrkTxtMais.AsString  := wTxtMais;
  uDM.PedWrkTxtMenos.AsString := wTxtMenos;

end;

procedure TFuTrataLanche.imgPrecoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if True then

  dbPreco.Visible := True;
  dbPreco.SetFocus;
  //if not uDM.SisPessoaTecladoVirtual.AsBoolean then EXit;

end;

end.
