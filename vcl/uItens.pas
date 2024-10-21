unit uItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.Mask, Data.DB, Datasnap.DBClient, Vcl.ExtDlgs, System.UITypes;
  Procedure ManutencaoProdutos;

type
  TFuItens = class(TForm)
    PanDados: TPanel;
    PanBottom: TPanel;
    PanManut: TPanel;
    GridProds: TDBGrid;
    NavProds: TDBNavigator;
    dbTipo: TDBRadioGroup;
    btIncluir: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btSair: TBitBtn;
    LabNRegs: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    ColorDialog1: TColorDialog;
    cbSelec: TComboBox;
    Label19: TLabel;
    cbSelCod: TComboBox;
    PanDetalhe: TPanel;
    Label2: TLabel;
    dbCodigo: TDBEdit;
    dbDescricao: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    dbPreco: TDBEdit;
    PanCor: TPanel;
    edZC_Key: TDBEdit;
    dbUnid: TDBEdit;
    Label16: TLabel;
    Label4: TLabel;
    dbTamanho: TDBEdit;
    dbCodBarras: TDBEdit;
    Label17: TLabel;
    cbAlteraPreco: TDBCheckBox;
    ImgItem: TImage;
    Label1: TLabel;
    dbDescrCompl: TDBMemo;
    Label15: TLabel;
    dbImagem: TDBEdit;
    sbImagem: TSpeedButton;
    gbFiscais: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    dbCFOP: TDBEdit;
    dbNCM: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    cbEtiqueta: TDBCheckBox;
    btAjustaEtq: TBitBtn;
    Label20: TLabel;
    procedure btSairClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure dbTipoClick(Sender: TObject);
    procedure edZC_KeyChange(Sender: TObject);
    procedure sbImagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure dbImagemExit(Sender: TObject);
    procedure PanCorClick(Sender: TObject);
    procedure GridProdsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbSelecChange(Sender: TObject);
    procedure btIncluirMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btAjustaEtqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wMsgRegEmUso: String;

  end;

var
  FuItens: TFuItens;
  wAcao: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas;

Procedure ManutencaoProdutos;
var i,nPos: Integer;
    wTxt: String;
begin
  uDM.filGrupoItens := 0;
  uDM.Itens.Filtered := False;
  with FuItens
  do begin
    dbTipo.Items.Clear;
    dbTipo.Values.Clear;
    cbSelec.Items.Clear;
    cbSelCod.Items.Clear;
    cbSelec.Items.Add('Sem seleção');
    cbSelCod.Items.Add('0');
    for i := 1 to Length(uDM.xGrupos) do
      if uDM.xGrupos[i] <> '' then
      begin
        wTxt := uDM.xGrupos[i];
        nPos := Pos('&',wTxt);
        if nPos > 0 then
          wTxt := Copy(wTxt,1,nPos) + '&' + Copy(wTxt,nPos+1,Length(wTxt)-nPos);
        dbTipo.Items.Add(wTxt);     //uDM.xGrupos[i]
        dbTipo.Values.Add(IntToStr(i));
        cbSelec.Items.Add(uDM.xGrupos[i]);
        cbSelCod.Items.Add(IntToStr(i));
      end;
    //
    Top := 12;
    Height := Screen.Height - 96;
    cbSelec.ItemIndex := 0;
    cbSelCod.ItemIndex := 0;
    uDM.filGrupoItens := 0;
    uDM.Itens.Filtered := True;
    //
    uDM.Itens.Last;
    uDM.Itens.First;
    cbSelCod.Visible := uDM.lDebug;
    ShowModal;
    uDM.Itens.Filtered := False;

  end;

end;

Function CtleProds(pAcao:Integer;pModo:Boolean): Integer;
begin
  with FuItens
  do begin
    btOk.Visible     := pModo;
    btCancel.Visible := pModo;
    panManut.Enabled := pModo;
    sbImagem.Visible := pModo;
    if pModo then pModo := False
             else pModo := True;
    GridProds.Enabled := pModo;
    NavProds.Enabled  := pModo;
    btIncluir.Enabled := pModo;
    btAlterar.Enabled := pModo;
    btExcluir.Enabled := pModo;
    btSair.Enabled    := pModo;
    btAjustaEtq.Enabled := pModo;
    LabNRegs.Caption := IntToStr(uDM.Itens.RecordCount) + ' itens';

    dbTipo.Enabled := True;
    if pAcao = 2 then dbTipo.Enabled := False;
    Result := pAcao;

  end;

end;


Procedure AjustaIndicadorEtiquetas;
var newEtq: Boolean;
begin
  if FuItens.cbSelec.ItemIndex <> 0 then
  begin
    MessageDlg('Não pode haver seleção ativa, altere para "' +
               FuItens.cbSelec.Items[0] + '" e tente novamente',mtWarning,[mbOk],0);
    Exit;
  end;
  if MessageDlg('Ajustar o indicador de "etiquetas" ?',mtConfirmation,
                [mbYes,mbNo],0,mbNo,['Sim','Não']) <> mrYes then Exit;
  //
  FuItens.PanDados.Visible := False;
  FuItens.PanBottom.Visible := False;
  uDM.Itens.First;
  while not uDM.Itens.Eof do
  begin
    newEtq := False;
    if (uDM.ItensGrupo.AsInteger = 1)
       or (uDM.ItensGrupo.AsInteger = 11)
       or (uDM.ItensGrupo.AsInteger = 21)
       or (uDM.ItensGrupo.AsInteger = 31)
       or (uDM.ItensGrupo.AsInteger = 41)
    then newEtq := True
    else if uDM.ItensEtiqueta.AsBoolean
         then newEtq := True
         else newEtq := False;
    uDM.Itens.Edit;
    uDM.ItensEtiqueta.AsBoolean := newEtq;
    uDM.Itens.Post;
    uDM.Itens.Next;
  end;
  uDM.Itens.First;
  FuItens.PanBottom.Visible := True;
  FuItens.PanDados.Visible := True;

end;


procedure TFuItens.FormActivate(Sender: TObject);
begin
  uDM.Itens.First;
  wAcao := CtleProds(0,False);
  wMsgRegEmUso := 'Registro em usos por outro usuário' + #13 + 'Tente novamente mais tarde';
  Form_Define(FuItens);

end;

procedure TFuItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FuItens);

end;

procedure TFuItens.FormResize(Sender: TObject);
begin
  if FuItens.Width < 920 then FuItens.Width := 920;
  if FuItens.Height < 580 then FuItens.Height := 580;
  PanManut.Height := (PanDados.Height * 60) div 100;
  DefineGrid(GridProds,[0.11,0.05,0.33,0.11,0.02,0.02,0.04,0.10,0.04,0.10],2,0);

end;

procedure TFuItens.GridProdsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var wColor: TColor;
begin
  if (Column.Field.FieldName = 'ZC_Cor')
     and (uDM.ItensCorItem.AsString <> '') then
  begin
    wColor := StringToColor(uDM.ItensCorItem.AsString);
    GridProds.Canvas.Brush.Color := wColor;
    GridProds.Canvas.FillRect(Rect);
    GridProds.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TFuItens.PanCorClick(Sender: TObject);
var corAnt: TColor;
begin
  corAnt := PanCor.Color;
  ColorDialog1.Color := PanCor.Color;
  ColorDialog1.Execute();
  if ColorDialog1.Color <> corAnt then
  begin
    PanCor.Color := ColorDialog1.Color;
    uDM.ItensCorItem.AsString := ColorToString(PanCor.Color);
  end;
{
PanCorMouseDown.....
// var corR,corG,corB: Integer;
  if Button = mbLeft
  then begin
    Randomize;
    corR := Random(255);
    corG := Random(255);
    corB := Random(255);
    PanCor.color := RGB(corR,corG,corB);
    Exit;
  end;
  if Button = mbRight
  then begin
    uDM.ItensCorItem.AsString := ColorToString(PanCor.Color);
    DebugMensagem(uDM.lDebug,'Cor adotada');
    Exit;
  end;
}

end;

procedure TFuItens.sbImagemClick(Sender: TObject);
begin
  OpenPictureDialog1.Execute();
  if OpenPictureDialog1.FileName = '' then Exit;
  if not FileExists(OpenPictureDialog1.FileName) then Exit;
  imgItem.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  imgItem.Visible := True;
  if MessageDlg('Manter a imagem indicada para o ítem?',
                mtConfirmation,[mbYes,mbNo],0,mbYes,['Sim','Não']) = mrNo
  then begin
    if FileExists(uDM.ItensImagem.AsString)
       then imgItem.Picture.LoadfromFile(uDM.ItensImagem.AsString)
       else imgItem.Visible := False;
    Exit;
  end;
  uDM.ItensImagem.AsString := OpenPictureDialog1.FileName;

end;

procedure TFuItens.btAjustaEtqClick(Sender: TObject);
begin
  AjustaIndicadorEtiquetas;

end;

procedure TFuItens.btAlterarClick(Sender: TObject);
begin
  if uDM.Itens.RecordCount = 0 then Exit;
  Try
    uDM.Itens.Edit;
    if (uDM.ItensGrupo.AsInteger = 4) and
       (uDM.ItensCFOP.AsInteger = 0) then dbTipoClick(nil);
  Except
    MessageDlg(wMsgRegEmUso,mtError,[mbOk],0);
    Exit;
  End;
  wAcao := CtleProds(2,True);
  dbDescricao.SetFocus;

end;

procedure TFuItens.btCancelClick(Sender: TObject);
begin
  uDM.Itens.Cancel;
  wAcao := CtleProds(0,False);

end;

procedure TFuItens.btExcluirClick(Sender: TObject);
begin
  if uDM.Itens.RecordCount = 0 then Exit;
  if MessageDlg('Excluir produto ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
  then begin
    Try
      uDM.Itens.Delete;
    Except
      MessageDlg('Não foi possível excluir produto',mtError,[mbOk],0);
    End;
    CtleProds(0,False);
  end;

end;

procedure TFuItens.btIncluirClick(Sender: TObject);
begin
  wAcao := CtleProds(1,True);
  gbFiscais.Visible := False;
  uDM.Itens.Append;
  uDM.ItensDescrCompleta.AsString := '';
  uDM.ItensAlteraPreco.AsBoolean  := False;
  uDM.ItensEtiqueta.AsBoolean := False;
  if cbSelec.ItemIndex = 0
  then begin
    uDM.ItensGrupo.AsInteger := 0;
    dbTipo.ItemIndex := -1;
    dbTipo.Enabled := True;
    dbTipo.SetFocus;
  end
  else begin
    uDM.ItensGrupo.AsInteger := StrToInt(cbSelCod.Items[cbSelec.ItemIndex]);
    dbTipo.ItemIndex := cbSelec.ItemIndex - 1;
    dbTipo.Enabled := False;
    dbTipoClick(nil);
    edZC_KeyChange(nil);
    dbCodigo.SetFocus;
  end;

end;

procedure TFuItens.btIncluirMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var wCods: TStringList;
    wExtras: TStringList;
    aFiltro: Boolean;
    i: Integer;
begin
  if Button <> mbRight then Exit;
  wCods := TStringList.Create;
  wExtras := TStringList.Create;
  aFiltro := uDM.Itens.Filtered;
  uDM.Itens.Filtered := False;
  uDM.Itens.FindNearest([2,0]);
  while (uDM.ItensGrupo.AsInteger = 2) and (not uDM.Itens.Eof)
  do begin
    if uDM.ItensPreco.AsCurrency = 0 then
    begin
      wCods.Add(uDM.ItensCodigo.AsString);
      wExtras.Add(uDM.ItensDescricao.AsString);
    end;
    uDM.Itens.Next;
  end;
  for i := 0 to wCods.Count-1 do
    if not uDM.Itens.FindKey([5,StrToInt(wCods[i])]) then
    begin
      uDM.Itens.Append;
      uDM.ItensGrupo.AsInteger := 5;
      uDM.ItensCodigo.AsInteger := StrToInt(wCods[i]);
      uDM.ItensDescricao.AsString := wExtras[i];
      uDM.Itens.Post;
    end
    else begin
      uDM.Itens.Edit;
      uDM.ItensDescricao.AsString := wExtras[i];
      uDM.Itens.Post;
    end;

end;

procedure TFuItens.btOkClick(Sender: TObject);
begin
  if ((uDM.ItensGrupo.AsInteger = 2) or (uDM.ItensGrupo.AsInteger = 5)) and
     ((uDM.ItensCodigo.AsInteger < 1) or (uDM.ItensCodigo.AsInteger > 24))
  then begin
    MessageDlg('Extras: código do ítem deve ser entre 1 e 24',mtError,[mbOk],0);
    dbCodigo.SetFocus;
    Exit;
  end;
  if (wAcao = 1) or (wAcao = 2)
  then if not gbFiscais.Visible
       then begin
         uDM.ItensCFOP.Clear;
         uDM.ItensNCM.Clear;
       end;

  case wAcao of
    1:begin
        Try
          uDM.Itens.Post;
        Except
          MessageDlg('Item já existe no cadastro, reinforme',mtError,[mbOk],0);
          dbCodigo.SetFocus;
          Exit;
        End;
      end;
    2:begin
        uDM.Itens.Post;
      end;
  end;
  if (uDM.ItensImagem.AsString = '')  or
     (not FileExists(uDM.ItensImagem.AsString)) then ImgItem.Visible := False;
  wAcao := CtleProds(0,False);

end;

procedure TFuItens.btSairClick(Sender: TObject);
var nVals: Integer;
begin
  nVals := 0;
  uDM.Itens.FindNearest([2,1]);
  while (uDM.ItensGrupo.AsInteger = 2) and (not uDM.Itens.Eof) do
  begin
    if uDM.ItensPreco.AsCurrency > 0 then nVals := nVals + 1;
    uDM.Itens.Next;
  end;
  if nVals > 6 then
  begin
    MessageDlg('Há mais de 6 (seis) ítens "EXTRA" com valor' + #13 +
               'Corrija as informações', mtError, [mbOk], 0);
    Exit;
  end;
  FuItens.Close;

end;

procedure TFuItens.cbSelecChange(Sender: TObject);
begin
  cbSelCod.ItemIndex := cbSelec.ItemIndex;
  uDM.filGrupoItens := StrToIntDef(cbSelCod.Text,0);
  uDM.Itens.Refresh;
  LabNRegs.Caption := IntToStr(uDM.Itens.RecordCount) + ' itens';

end;

procedure TFuItens.dbImagemExit(Sender: TObject);
begin
  imgItem.Visible := False;
  if uDM.ItensImagem.AsString <> '' then
     if FileExists(uDM.ItensImagem.AsString) then
        begin
          imgItem.Picture.LoadfromFile(uDM.ItensImagem.AsString);
          imgItem.Visible := True;
        end;

end;

procedure TFuItens.dbTipoClick(Sender: TObject);
var nTipo: Integer;
begin
  nTipo := StrToIntDef(dbTipo.Values[dbTipo.ItemIndex],99);
  case nTipo of
  {
    Cod/Descrição       Fiscal   Cor    Imagem  Etiqueta
    1-Lanches           sim      sim    sim      sim
    2-Extras lanches     -        -      -        -
    3-Bebidas           sim      sim    sim       -
    4-Basicos           sim      sim     -        -
    5-Extras basico      -       sim     -        -
    6-Diversos          sim       -     sim      sim
    11-Crepes           sim      sim    sim      sim
    12-Crepes sabores    -       sim     -        -
    15-Buffet sorvetes  sim       -     sim       -
    21-Frituras         sim      sim    sim      sim
    22-Extras frituras   -        -      -        -
    31-Gelados          sim      sim    sim      sim
    32-Extra gelados     -        -      -        -
    41-Milkshake        sim      sim    sim      sim
    42-Extra milkshake   -        -      -        -
  }
    1,4,11,21,31,41:begin     // Lanches e preparados
        uDM.ItensCFOP.AsInteger       := 5102;
        uDM.ItensNCM.AsString         := '21069090';
        uDM.ItensCSOSN.AsInteger      := 102;
        uDM.ItensCST.AsInteger        := 90;
        uDM.ItensCST_IPI.AsInteger    := 99;
        uDM.ItensCST_PIS.AsInteger    := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat      := 0;
        uDM.ItensAliqICMS.AsFloat     := 0;
      end;
    3:begin     // Bebidas  (3)
        uDM.ItensCFOP.AsInteger       := 5102;
        uDM.ItensNCM.AsString         := '22021000';
        uDM.ItensCSOSN.AsInteger      := 102;
        uDM.ItensCST.AsInteger        := 90;
        uDM.ItensCST_IPI.AsInteger    := 99;
        uDM.ItensCST_PIS.AsInteger    := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat      := 0;
        uDM.ItensAliqICMS.AsFloat     := 0;
      end;
    6:begin     // Diversos(6)
        uDM.ItensCFOP.AsInteger       := 5102;
        uDM.ItensNCM.AsString         := '22021000';
        uDM.ItensCSOSN.AsInteger      := 102;
        uDM.ItensCST.AsInteger        := 90;
        uDM.ItensCST_IPI.AsInteger    := 99;
        uDM.ItensCST_PIS.AsInteger    := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat      := 0;
        uDM.ItensAliqICMS.AsFloat     := 0;
        end;
    15:begin     // Buffet (15)
        uDM.ItensCFOP.AsInteger       := 5102;
        uDM.ItensNCM.AsString         := '22021000';
        uDM.ItensCSOSN.AsInteger      := 102;
        uDM.ItensCST.AsInteger        := 90;
        uDM.ItensCST_IPI.AsInteger    := 99;
        uDM.ItensCST_PIS.AsInteger    := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat      := 0;
        uDM.ItensAliqICMS.AsFloat     := 0;
        end;
     else begin      // Extras e sabores (2,5,12,22,32,42)
        uDM.ItensCFOP.Clear;
        uDM.ItensNCM.Clear;
        uDM.ItensCSOSN.Clear;
        uDM.ItensCST.Clear;
        uDM.ItensCST_IPI.Clear;
        uDM.ItensCST_PIS.Clear;
        uDM.ItensCST_COFINS.Clear;
        uDM.ItensPcReduz.Clear;
        uDM.ItensAliqICMS.Clear;
    end;
  end;

end;

procedure TFuItens.edZC_KeyChange(Sender: TObject);
begin
  gbFiscais.Visible := False;
  imgItem.Visible := False;
  panCor.Visible := False;
  cbAlteraPreco.Visible := False;
  cbEtiqueta.Visible := False;

  if (uDM.ItensGrupo.AsInteger = 1)         // Lanches
     or (uDM.ItensGrupo.AsInteger = 3)      // Bebidas
     or (uDM.ItensGrupo.AsInteger = 4)      // Basicos (Montar lanche)
     or (uDM.ItensGrupo.AsInteger = 6)      // Diversos
     or (uDM.ItensGrupo.AsInteger = 11)     // Crepes
     or (uDM.ItensGrupo.AsInteger = 15)     // Buffet
     or (uDM.ItensGrupo.AsInteger = 21)     // Frituras
     or (uDM.ItensGrupo.AsInteger = 31)     // Gelados
     or (uDM.ItensGrupo.AsInteger = 41)     // Shakes
     then gbFiscais.Visible := True;

  if (uDM.ItensGrupo.AsInteger = 1)
     or (uDM.ItensGrupo.AsInteger = 3)
     or (uDM.ItensGrupo.AsInteger = 6)
     or (uDM.ItensGrupo.AsInteger = 11)
     or (uDM.ItensGrupo.AsInteger = 15)
     or (uDM.ItensGrupo.AsInteger = 21)
     or (uDM.ItensGrupo.AsInteger = 31)
     or (uDM.ItensGrupo.AsInteger = 41)
     then cbAlteraPreco.Visible := True;

  if (uDM.ItensGrupo.AsInteger = 1)         // Lanches
     or (uDM.ItensGrupo.AsInteger = 4)      // Montar lanches
     or (uDM.ItensGrupo.AsInteger = 11)     // Crepes
     or (uDM.ItensGrupo.AsInteger = 21)     // Frituras
     or (uDM.ItensGrupo.AsInteger = 31)     // Gelados
     or (uDM.ItensGrupo.AsInteger = 41)     // Shakes
     then cbEtiqueta.Visible := True;

  if uDM.usaCorItem
  then if (uDM.ItensGrupo.AsInteger = 1)
          or (uDM.ItensGrupo.AsInteger = 3)
          or (uDM.ItensGrupo.AsInteger = 4)
          or (uDM.ItensGrupo.AsInteger = 5)
          or (uDM.ItensGrupo.AsInteger = 11)
          or (uDM.ItensGrupo.AsInteger = 12)
          or (uDM.ItensGrupo.AsInteger = 21)
          or (uDM.ItensGrupo.AsInteger = 22)
          or (uDM.ItensGrupo.AsInteger = 31)
          or (uDM.ItensGrupo.AsInteger = 32)
          or (uDM.ItensGrupo.AsInteger = 41)
          or (uDM.ItensGrupo.AsInteger = 42)
       then begin
         PanCor.Visible := True;
         if uDM.ItensCorItem.AsString = ''
            then PanCor.Color := PanManut.Color
            else PanCor.Color := StringToColor(uDM.ItensCorItem.AsString);
       end;

  if FileExists(uDM.ItensImagem.AsString)
  then begin
    imgItem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
    imgItem.Visible := True;
  end;
  //

end;

end.
