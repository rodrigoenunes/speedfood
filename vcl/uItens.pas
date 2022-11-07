unit uItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask,
  Data.DB, Datasnap.DBClient, Vcl.ExtDlgs;
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
    SpeedButton1: TSpeedButton;
    ImgItem: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure btSairClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure dbTipoClick(Sender: TObject);
    procedure edZC_KeyChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
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
begin
  FuItens := TFuItens.Create(nil);
  FuItens.Top := 12;
  FuItens.Height := Screen.Height - 96;
  FuItens.ShowModal;
  FuItens.Free;

end;

Function CtleProds(pAcao:Integer;pModo:Boolean): Integer;
begin
  with FuItens
  do begin
    btOk.Visible     := pModo;
    btCancel.Visible := pModo;
    panManut.Enabled := pModo;
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
  wAcao := CtleProds(0,False);
  wMsgRegEmUso := 'Registro em usos por outro usu�rio' + #13 + 'Tente novamente mais tarde';
  uDM.Itens.Refresh;
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
  DefineGrid(GridProds,[0.11,0.05,0.33,0.11,0.10,0.04,0.10],2,0);

end;

procedure TFuItens.SpeedButton1Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute();
  if OpenPictureDialog1.FileName = '' then Exit;
  if not FileExists(OpenPictureDialog1.FileName) then Exit;
  imgItem.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  imgItem.Visible := True;
  if MessageDlg('Manter a imagem indicada para o �tem?',
                mtConfirmation,[mbYes,mbNo],0,mbYes,['Sim','N�o']) = mrNo then Exit;
  uDM.ItensImagem.AsString := OpenPictureDialog1.FileName;

end;

procedure TFuItens.btAlterarClick(Sender: TObject);
begin
  if uDM.Itens.RecordCount = 0 then Exit;
  Try
    uDM.Itens.Edit;
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
  uDM.ItensGrupo.AsInteger := 0;
  uDM.ItensDescrCompleta.AsString := '';
  dbTipo.ItemIndex := -1;
  dbTipo.SetFocus;

end;

procedure TFuItens.btOkClick(Sender: TObject);
begin
  case wAcao of
    1:begin
        Try
          uDM.Itens.Post;
        Except
          MessageDlg('Tipo/C�digo j� existe no cadastro, reinforme',mtError,[mbOk],0);
          dbCodigo.SetFocus;
          Exit;
        End;
      end;
    2:begin
        uDM.Itens.Post;
      end;
  end;
  wAcao := CtleProds(0,False);

end;

procedure TFuItens.btSairClick(Sender: TObject);
begin
  FuItens.Close;

end;

procedure TFuItens.dbTipoClick(Sender: TObject);
begin
  case dbTipo.ItemIndex of
    0:begin     // Lanches
        uDM.ItensCFOP.AsInteger := 5101;
        uDM.ItensNCM.AsString  := '21069090';
        uDM.ItensCSOSN.AsInteger := 102;
        uDM.ItensCST.AsInteger := 90;
        uDM.ItensCST_IPI.AsInteger := 99;
        uDM.ItensCST_PIS.AsInteger := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat := 0;
        uDM.ItensAliqICMS.AsFloat := 0;
      end;
    3:begin     // Bebidas
        uDM.ItensCFOP.AsInteger := 5102;
        uDM.ItensNCM.AsString  := '22021000';
        uDM.ItensCSOSN.AsInteger := 102;
        uDM.ItensCST.AsInteger := 90;
        uDM.ItensCST_IPI.AsInteger := 99;
        uDM.ItensCST_PIS.AsInteger := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat := 0;
        uDM.ItensAliqICMS.AsFloat := 0;
      end;
    4:begin     // Diversos
        uDM.ItensCFOP.AsInteger := 5102;
        uDM.ItensNCM.AsString  := '22021000';
        uDM.ItensCSOSN.AsInteger := 102;
        uDM.ItensCST.AsInteger := 90;
        uDM.ItensCST_IPI.AsInteger := 99;
        uDM.ItensCST_PIS.AsInteger := 99;
        uDM.ItensCST_COFINS.AsInteger := 99;
        uDM.ItensPcReduz.AsFloat := 0;
        uDM.ItensAliqICMS.AsFloat := 0;
        end;
    else begin
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
  if (uDM.ItensGrupo.AsString = '1')       // Lanches
     or (uDM.ItensGrupo.AsString = '4')    // Bebidas
     or (uDM.ItensGrupo.AsString = '5')    // Diversos
  then gbFiscais.Visible := True
  else gbFiscais.Visible := False;
  if FileExists(uDM.ItensImagem.AsString)
  then begin
     imgItem.Picture.LoadFromFile(uDM.ItensImagem.AsString);
     imgItem.Visible := True;
  end
  else imgItem.Visible := False;

end;

end.
