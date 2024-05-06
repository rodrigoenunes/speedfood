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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GridProds: TDBGrid;
    NavProds: TDBNavigator;
    dbTipo: TDBRadioGroup;
    dbCodigo: TDBEdit;
    dbDescricao: TDBEdit;
    dbTamanho: TDBEdit;
    dbPreco: TDBEdit;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btIncluir: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btSair: TBitBtn;
    LabNRegs: TLabel;
    Label1: TLabel;
    dbDescrCompl: TDBMemo;
    gbFiscais: TGroupBox;
    Label6: TLabel;
    dbCFOP: TDBEdit;
    dbNCM: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    edZC_Key: TDBEdit;
    Label15: TLabel;
    dbImagem: TDBEdit;
    sbImagem: TSpeedButton;
    ImgItem: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Label16: TLabel;
    dbUnid: TDBEdit;
    Label17: TLabel;
    dbCodBarras: TDBEdit;
    cbAlteraPreco: TDBCheckBox;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    PanCor: TPanel;
    ColorDialog1: TColorDialog;
    cbSelec: TComboBox;
    Label19: TLabel;
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
var i: Integer;
begin
  uDM.filGrupoItens := 0;
  uDM.Itens.Filtered := True;
  //FuItens := TFuItens.Create(nil);
  with FuItens
  do begin
    dbTipo.Items.Clear;
    dbTipo.Items.Add('Lanches');
    dbTipo.Items.Add('Extras lanches');
    dbTipo.Items.Add('Bebidas');
    dbTipo.Values.Clear;
    dbTipo.Values.Add('1');
    dbTipo.Values.Add('2');
    dbTipo.Values.Add('3');
    if ObtemParametro('LanctoMontarLanche') = 'S'
    then begin
      dbTipo.Items.Add('B�sicos');
      dbTipo.Items.Add('Extras b�sicos');
      dbTipo.Values.Add('4');
      dbTipo.Values.Add('5');
    end;
    dbTipo.Items.Add('Diversos');
    dbTipo.Values.Add('6');
    //
    Top := 12;
    Height := Screen.Height - 96;
    cbSelec.Items.Clear;
    cbSelec.Items.Add('Sem sele��o');
    for i := 0 to dbTipo.Items.Count-1 do
       cbSelec.Items.add(dbTipo.Items[i]);
    cbSelec.ItemIndex := 0;
    uDM.filGrupoItens := 0;
    uDM.Itens.Filtered := True;
//    uDM.Itens.Refresh;
    uDM.Itens.Last;
    uDM.Itens.First;
    ShowModal;
    uDM.Itens.Filtered := False;
//    Free;
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
    LabNRegs.Caption := IntToStr(uDM.Itens.RecordCount) + ' itens';

    dbTipo.Enabled := True;
    if pAcao = 2 then dbTipo.Enabled := False;
    Result := pAcao;

  end;

end;

procedure TFuItens.FormActivate(Sender: TObject);
begin
  uDM.Itens.First;
  wAcao := CtleProds(0,False);
  wMsgRegEmUso := 'Registro em usos por outro usu�rio' + #13 + 'Tente novamente mais tarde';
  //uDM.Itens.Refresh;
  Form_Define(FuItens);

end;

procedure TFuItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FuItens);

end;

procedure TFuItens.FormResize(Sender: TObject);
begin
  if FuItens.Width < 846 then FuItens.Width := 846;
  if FuItens.Height < 510 then FuItens.Height := 510;
  DefineGrid(GridProds,[0.11,0.05,0.33,0.11,0.02,0.04,0.10,0.04,0.10],2,0);

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
  if MessageDlg('Manter a imagem indicada para o �tem?',
                mtConfirmation,[mbYes,mbNo],0,mbYes,['Sim','N�o']) = mrNo
  then begin
    if FileExists(uDM.ItensImagem.AsString)
       then imgItem.Picture.LoadfromFile(uDM.ItensImagem.AsString)
       else imgItem.Visible := False;
    Exit;
  end;
  uDM.ItensImagem.AsString := OpenPictureDialog1.FileName;

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
  if MessageDlg('Excluir produto ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','N�o']) = mrYes
  then begin
    Try
      uDM.Itens.Delete;
    Except
      MessageDlg('N�o foi poss�vel excluir produto',mtError,[mbOk],0);
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
  if cbSelec.ItemIndex = 0
  then begin
    uDM.ItensGrupo.AsInteger := 0;
    dbTipo.ItemIndex := -1;
    dbTipo.Enabled := True;
    dbTipo.SetFocus;
  end
  else begin
    uDM.ItensGrupo.AsInteger := cbSelec.ItemIndex;
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
    MessageDlg('Extras: c�digo do �tem deve ser entre 1 e 24',mtError,[mbOk],0);
    dbCodigo.SetFocus;
    Exit;
  end;
  case wAcao of
    1:begin
        Try
          uDM.Itens.Post;
        Except
          MessageDlg('Item j� existe no cadastro, reinforme',mtError,[mbOk],0);
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
    MessageDlg('H� mais de 6 (seis) �tens "EXTRA" com valor' + #13 +
               'Corrija as informa��es', mtError, [mbOk], 0);
    Exit;
  end;
  FuItens.Close;

end;

procedure TFuItens.cbSelecChange(Sender: TObject);
begin
  uDM.filGrupoItens := cbSelec.ItemIndex;
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
begin
  case dbTipo.ItemIndex of
    0,3:begin     // Lanches
        uDM.ItensCFOP.AsInteger       := 5101;
        uDM.ItensNCM.AsString         := '21069090';
        uDM.ItensCSOSN.AsInteger      := 102;
        uDM.ItensCST.AsInteger        := 90;
        uDM.ItensCST_IPI.AsInteger    := 99;
        uDM.ItensCST_PIS.AsInteger    := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat      := 0;
        uDM.ItensAliqICMS.AsFloat     := 0;
      end;
    2:begin     // Bebidas
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
    5:begin     // Diversos
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
    else begin      // Extras para lanches(1) e Extras para basicos(4)
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
  if (uDM.ItensGrupo.AsInteger = 1)         // Lanches
     or (uDM.ItensGrupo.AsInteger = 3)      // Bebidas
     or (uDM.ItensGrupo.AsInteger = 4)      // Basicos (Montar lanche)
     or (uDM.ItensGrupo.AsInteger = 6)      // Diversos
  then gbFiscais.Visible := True;

  if uDM.ItensGrupo.AsInteger = 1
     then cbAlteraPreco.Visible := True
     else cbAlteraPreco.Visible := False;
  if ((uDM.ItensGrupo.AsInteger = 1)        // Lanches
      or (uDM.ItensGrupo.AsInteger = 3)     // Bebidas
      or (uDM.ItensGrupo.AsInteger = 4)     // Basicos
      or (uDM.ItensGrupo.AsInteger = 5))    // Complementos de basicos
      and (uDM.usaCorItem)                  // Usa cor de preenchimento
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
