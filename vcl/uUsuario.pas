unit uUsuario;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBTables, Mask, ExtCtrls, Vcl.Buttons;
  Procedure ManutencaoUsuario;


type
  TFuUsuario = class(TForm)
    Panel1: TPanel;
    PanDados: TPanel;
    Label1: TLabel;
    edId: TDBEdit;
    EditNome: TDBEdit;
    Label2: TLabel;
    EditFantasia: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditCNPJ: TDBEdit;
    EditIE: TDBEdit;
    Label5: TLabel;
    Label13: TLabel;
    EditCEP: TDBEdit;
    EditLogradouro: TDBEdit;
    Label6: TLabel;
    EditNro: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditComplemento: TDBEdit;
    Label12: TLabel;
    EditIBGECidade: TDBEdit;
    EditUF: TDBEdit;
    Label11: TLabel;
    EditCidade: TDBEdit;
    Label10: TLabel;
    EditBairro: TDBEdit;
    Label9: TLabel;
    Label14: TLabel;
    EditTelefone: TDBEdit;
    EditWhatsApp: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    EditCSC_Homolog: TDBEdit;
    EditCSC_Producao: TDBEdit;
    Label17: TLabel;
    Label19: TLabel;
    EditNrNFCe: TDBEdit;
    EditSerieNFCe: TDBEdit;
    Label20: TLabel;
    Label18: TLabel;
    EditNSCertificado: TDBEdit;
    EditValCertificado: TDBEdit;
    Label21: TLabel;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    Label22: TLabel;
    EditPathImg: TDBEdit;
    sbImagens: TSpeedButton;
    ODImagens: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure sbImagensClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FuUsuario: TFuUsuario;

implementation


{$R *.DFM}

uses uDados;


Procedure ManutencaoUsuario;
begin
  FuUsuario := TFuUsuario.Create(nil);
  FuUsuario.ShowModal;
  FuUsuario.Free;

end;

procedure TFuUsuario.btCancelarClick(Sender: TObject);
begin
  uDM.SisPessoa.Cancel;
  FuUsuario.Close;

end;

procedure TFuUsuario.btGravarClick(Sender: TObject);
begin
  uDM.SisPessoa.Post;
  FuUsuario.Close;

end;

procedure TFuUsuario.FormActivate(Sender: TObject);
begin
  if uDM.SisPessoa.RecordCount = 0 then
  begin
    uDM.SisPessoa.Append;
    uDM.SisPessoaId.AsInteger := 1;
    uDM.SisPessoa.Post;
  end;
 uDM.SisPessoa.Edit;

end;

procedure TFuUsuario.sbImagensClick(Sender: TObject);
begin
  ODImagens.InitialDir := uDM.SisPessoaPathImagens.AsString;
  ODImagens.Execute();
  uDM.SisPessoaPathImagens.AsString := ExtractFilePath(ODImagens.FileName);

end;

end.
