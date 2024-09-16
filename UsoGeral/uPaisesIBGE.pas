unit uPaisesIBGE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, DBCtrls, DB, DBTables, Grids, DBGrids,
  Mask, Buttons, DateUtils;
  Procedure ManutencaoPaisesIBGE(pmtDBName:String);

type
  TFPaisesIBGE = class(TForm)
    Panel1: TPanel;
    MenuPrinc: TMainMenu;
    Pais1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    PanCtle: TPanel;
    Nav: TDBNavigator;
    LabNRegs: TLabel;
    CbOrdem: TComboBox;
    Label2: TLabel;
    Grid: TDBGrid;
    LabLocaliz: TLabel;
    EdLocaliz: TEdit;
    PanManut: TPanel;
    LabAcao: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edCodigo: TDBEdit;
    BtOk: TBitBtn;
    BtCanc: TBitBtn;
    btSair: TBitBtn;
    Sair: TMenuItem;
    Paises: TTable;
    SPaises: TDataSource;
    PaisesCod: TSmallintField;
    PaisesPais: TStringField;
    edDenom: TDBEdit;
    btNothing: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CbOrdemChange(Sender: TObject);
    procedure EdLocalizChange(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure BtCancClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FPaisesIBGE: TFPaisesIBGE;
  fTime: Boolean;
  wAcao: Integer;

implementation

uses uGenericas, uMensagem;


{$R *.dfm}

Procedure ManutencaoPaisesIBGE(pmtDBName:String);
begin
  FPaisesIBGE := TFPaisesIBGE.Create(nil);
  with FPaisesIBGE
  do begin
    Paises.DatabaseName := pmtDBName;
    Paises.IndexName := '';
    Paises.Active := True;
    FPaisesIBGE.ShowModal;
    Paises.Active := False;
  end;
  FPaisesIBGE.Free;

end;


Function Controle(Acao:Integer;Modo:Boolean): Integer;
var i: Integer;
const XOper: Array[1..3] of String = ('Inclusão','Alteração','');
begin
  Result := Acao;
  with FPaisesIBGE
  do begin
    LabAcao.Caption := XOper[Acao];
    PanManut.Enabled := Modo;
    BtOk.Visible := Modo;
    BtCanc.Visible := Modo;
    if Modo then Modo := False
            else Modo := True;
    for i := 0 to MenuPrinc.Items.Count-1 do MenuPrinc.Items[i].Enabled := Modo;
    Grid.Enabled := Modo;
    PanCtle.Enabled := Modo;
    if Acao = 3
       then btNothing.SetFocus;
       
  end;

end;

procedure TFPaisesIBGE.FormCreate(Sender: TObject);
begin
  fTime := True;

end;

procedure TFPaisesIBGE.FormActivate(Sender: TObject);
begin
  if not fTime then Exit;
  fTime := False;
  Form_Define(FPaisesIBGE);
  FormResize(nil);
  cbOrdem.ItemIndex := 1;
  cbOrdemChange(nil);

end;

procedure TFPaisesIBGE.CbOrdemChange(Sender: TObject);
begin
  EdLocaliz.Text := '';
  if CbOrdem.ItemIndex = 0
     then Paises.IndexName := ''               // Código
     else Paises.IndexName := 'Alfabetica';    // Denominação
  LabNRegs.Caption := '';
  if not Paises.Active
     then Exit;
  Paises.Refresh;
  Paises.First;
  LabNRegs.Caption := IntToStr(Paises.RecordCount) + ' registros';
  btNothing.SetFocus;

end;

procedure TFPaisesIBGE.EdLocalizChange(Sender: TObject);
begin
  if not Paises.Active then Exit;
  if cbOrdem.ItemIndex = 0
     then Paises.FindNearest([StrToIntDef(EdLocaliz.Text,0),0])     // Codigo
     else Paises.FindNearest([EdLocaliz.Text]);                     // Denominação
  
end;

procedure TFPaisesIBGE.Incluir1Click(Sender: TObject);
begin
  wAcao := Controle(1,True);
  Paises.Append;
  EdDenom.SetFocus;

end;

procedure TFPaisesIBGE.BtCancClick(Sender: TObject);
begin
  WAcao := Controle(3,False);

end;

procedure TFPaisesIBGE.BtOkClick(Sender: TObject);
var Msg: String;
begin
  Msg := '';
  if PaisesCod.AsInteger = 0 then Msg := Msg + 'Código do país não informado' + #13;
  if Length(Trim(PaisesPais.AsString)) = 0 then Msg := Msg + 'Denominação do país obrigatória' + #13;
  if Length(Trim(Msg)) > 0
  then begin
    msgSistema(1,'Erros detectados',Msg,1,1);
    edCodigo.SetFocus;
    Exit;
  end;
  Try
    Paises.Post;
  Except
    MessageDlg('Código de País ou Denominação duplicada, reinforme',mtError,[mbOk],0);
    EdCodigo.SetFocus;
    Exit;
  End;
  wAcao := Controle(3,False);
  LabNRegs.Caption := IntToStr(Paises.RecordCount) + ' registros';

end;

procedure TFPaisesIBGE.Alterar1Click(Sender: TObject);
begin
  if Paises.RecordCount = 0 then Exit;
  if not GenRecordLock(Paises,True) then Exit;
  wAcao := Controle(2,True);
  EdCodigo.SetFocus;

end;

procedure TFPaisesIBGE.Excluir1Click(Sender: TObject);
begin
  if Paises.RecordCount = 0 then Exit;
  if msgSistema(3,'Exclusão de país',
                  'Código: ' + PaisesCod.AsString + #13 +
                  'Denominação: ' + PaisesPais.AsString + #13
                  + #13 + 'Confirme a exclusão',3,2) <> 1 then Exit;
  Paises.Delete;
  Paises.Refresh;
  LabNRegs.Caption := IntToStr(Paises.RecordCount) + ' registros';
  btNothing.SetFocus;

end;

procedure TFPaisesIBGE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FPaisesIBGE);

end;

procedure TFPaisesIBGE.btSairClick(Sender: TObject);
begin
  FPaisesIBGE.Close;

end;

procedure TFPaisesIBGE.FormResize(Sender: TObject);
const wLrg: array[0..1] of Real = (0.12, 0.33);
begin
  if FPaisesIBGE.Width < 492
     then FPaisesIBGE.Width := 492;
  if FPaisesIBGE.Height < 560
     then FPaisesIBGE.Height := 560;
  Grid := DefineGrid(Grid, wLrg, 1, 0);

end;

end.
