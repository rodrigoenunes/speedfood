unit uTrataLancheBtns;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;
  Procedure MontaTelaExtras;
  Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean);

type
  TFuTrataLanche = class(TForm)
    PanInfoLanche: TPanel;
    PanExtras: TPanel;
    LabExtras: TLabel;
    PanIdLanche: TPanel;
    PanRodape: TPanel;
    DBText3: TDBText;
    imgMenos1: TImage;
    imgMenos2: TImage;
    imgMenos3: TImage;
    imgMenos4: TImage;
    imgMenos5: TImage;
    imgMenos6: TImage;
    imgMenos7: TImage;
    imgMenos8: TImage;
    imgMenos9: TImage;
    imgMenos10: TImage;
    imgMenos11: TImage;
    imgMenos12: TImage;
    PanBtOk: TPanel;
    btOkLanche: TBitBtn;
    PanObserv: TPanel;
    DBMemo1: TDBMemo;
    btCancelLanche: TBitBtn;
    LabNomeLanche: TLabel;
    DBMemo2: TDBMemo;
    btExclusLanche: TBitBtn;
    DBMemo3: TDBMemo;
    imgExtra: TImage;
    imgExclus: TImage;
    imgObs: TImage;
    imgMais1: TImage;
    imgMais2: TImage;
    imgMais3: TImage;
    imgMais4: TImage;
    imgMais5: TImage;
    imgMais6: TImage;
    imgMais7: TImage;
    imgMais8: TImage;
    imgMais9: TImage;
    imgMais10: TImage;
    imgMais11: TImage;
    imgMais12: TImage;
    PanExtra1: TPanel;
    PanExtra2: TPanel;
    PanExtra3: TPanel;
    PanExtra4: TPanel;
    PanExtra5: TPanel;
    PanExtra6: TPanel;
    PanExtra7: TPanel;
    PanExytra8: TPanel;
    PanExtra9: TPanel;
    PanExtra10: TPanel;
    PanExtra11: TPanel;
    PanExtra12: TPanel;
    imgMais13: TImage;
    PanExtra13: TPanel;
    imgMenos13: TImage;
    imgMais14: TImage;
    PanExtra14: TPanel;
    imgMenos14: TImage;
    imgMais15: TImage;
    PanExtra15: TPanel;
    imgMenos15: TImage;
    imgMenos16: TImage;
    PanExtra16: TPanel;
    imgMais16: TImage;
    imgMais17: TImage;
    PanExtra17: TPanel;
    imgMenos17: TImage;
    imgMenos18: TImage;
    PanExtra18: TPanel;
    imgMais18: TImage;
    imgMais19: TImage;
    PanExtra19: TPanel;
    imgMenos19: TImage;
    imgMenos20: TImage;
    PanExtra20: TPanel;
    imgMais20: TImage;
    imgMais21: TImage;
    PanExtra21: TPanel;
    imgMenos21: TImage;
    imgMenos22: TImage;
    PanExtra22: TPanel;
    imgMais22: TImage;
    imgMais23: TImage;
    PanExtra23: TPanel;
    imgMenos23: TImage;
    imgMenos24: TImage;
    PanExtra24: TPanel;
    imgMais24: TImage;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExtra1Click(Sender: TObject);
    procedure btExtra2Click(Sender: TObject);
    procedure btExtra3Click(Sender: TObject);
    procedure btExtra4Click(Sender: TObject);
    procedure btExtra5Click(Sender: TObject);
    procedure btExtra6Click(Sender: TObject);
    procedure btExtra7Click(Sender: TObject);
    procedure btExtra8Click(Sender: TObject);
    procedure btExtra9Click(Sender: TObject);
    procedure btExtra10Click(Sender: TObject);
    procedure btExtra11Click(Sender: TObject);
    procedure btExtra12Click(Sender: TObject);
    procedure btExcl1Click(Sender: TObject);
    procedure btExcl2Click(Sender: TObject);
    procedure btExcl3Click(Sender: TObject);
    procedure btExcl4Click(Sender: TObject);
    procedure btExcl5Click(Sender: TObject);
    procedure btExcl6Click(Sender: TObject);
    procedure btExcl7Click(Sender: TObject);
    procedure btExcl8Click(Sender: TObject);
    procedure btExcl9Click(Sender: TObject);
    procedure btExcl10Click(Sender: TObject);
    procedure btExcl11Click(Sender: TObject);
    procedure btExcl12Click(Sender: TObject);
    procedure btOkLancheClick(Sender: TObject);
    procedure btCancelLancheClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btExclusLancheClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuTrataLanche: TFuTrataLanche;
  lInclusao: Boolean;
  altBtn,lrgBtn,lrgImg: Integer;

  wrkExtras,wrkExcluir: String;
  wrkVlrExtra: array[1..12] of Currency;


implementation

{$R *.dfm}

uses uGenericas, uDados;

Procedure  IdentificaExtras(pBotao:TBitBtn;
                            pIndice:Integer;
                            pImage:TImage;
                            var pTop:Integer);
begin
  pBotao.Visible := False;
  pImage.Visible := False;
  if uDM.wCodExtras[pIndice] > 0 then
  begin
    pBotao.Left    := 4;
    pBotao.Top     := pTop;
    pBotao.Height  := altBtn;
    pBotao.Width   := lrgBtn;
    pImage.Left    := pBotao.Left + pBotao.Width + 8;
    pImage.Top     := pTop;
    pImage.Height  := altBtn;
    pImage.Width   := altBtn;
    pImage.Stretch := True;
    pTop           := pTop + altBtn;
    pBotao.Visible := True;
    pBotao.Caption := uDM.wTxtExtras[pIndice];
  end;

end;



Procedure MontaTelaExtras;
var nCol,nLin,tmImg,tmPan,nLeft,nTop,nAlt: Integer;

begin
  nCol  := 1;
  nLin  := uDM.nExtras;
  nTop  := 24;
  tmImg := 24;
  tmPan := 180;
  nLeft := 200;
  if uDM.nExtras > 12
  then begin
    nCol := 2;
    nLin := (uDM.nExtras div 2) + (uDM.nExtras mod 2);
  end;
  nAlt := FuTrataLanche.PanExtras.Height - (FuTrataLanche.LabExtras.Height + nLin * 2);
  nAlt := nAlt div nLin;
  uDM.Itens.FindNearest(['2','']);
  while uDM.ItensCodigo.AsString = '2' do
  begin

    xxxxxxxxxx
  end;


  nAlt :=

                      else nCol := 1;





  nConta := 0;
  uDM.Itens.FindNearest(['2','']);
  while (uDM.ItensGrupo.AsString = '2') and (not uDM.Itens.Eof)
  do begin
    nConta := nConta + 1;


  end;
end;


Procedure TratativaLanche(pCodLanche:Integer; pInclusao:Boolean);
begin
  lInclusao := pInclusao;     // True:Inclusão   False:Alteração ou Exclusão
  FuTrataLanche.LabNomeLanche.Caption := uDM.ItensDescricao.AsString;
  FuTrataLanche.btExclusLanche.Visible := False;
  if not lInclusao
     then FuTrataLanche.btExclusLanche.Visible := True;
  FuTrataLanche.ShowModal;

end;

Procedure DefineTextoExtrasExclusoes;
var i: Integer;
    wAuxil,wTexto: String;
    wVlr: array[1..12] of Currency;
begin
  wTexto := '';
  wAuxil := uDM.PedWrkExtras.AsString;
  if wAuxil <> '000000000000'
  then begin
    wTexto := wTexto + 'Extras: ' ;
    wVlr[1] := uDM.PedWrkVlrExt1.AsCurrency;
    wVlr[2] := uDM.PedWrkVlrExt2.AsCurrency;
    wVlr[3] := uDM.PedWrkVlrExt3.AsCurrency;
    wVlr[4] := uDM.PedWrkVlrExt4.AsCurrency;
    wVlr[5] := uDM.PedWrkVlrExt5.AsCurrency;
    wVlr[6] := uDM.PedWrkVlrExt6.AsCurrency;
    wVlr[7] := uDM.PedWrkVlrExt7.AsCurrency;
    wVlr[8] := uDM.PedWrkVlrExt8.AsCurrency;
    wVlr[9] := uDM.PedWrkVlrExt9.AsCurrency;
    wVlr[10] := uDM.PedWrkVlrExt10.AsCurrency;
    wVlr[11] := uDM.PedWrkVlrExt11.AsCurrency;
    wVlr[12] := uDM.PedWrkVlrExt12.AsCurrency;
    for i := 1 to 12
    do if wAuxil[i] = '1'
       then begin
         wTexto := wTexto + uDM.wTxtExtras[i];
         if wVlr[i] > 0 then wTexto := wTexto + '(' + FloatToStrF(wVlr[i],ffNumber,15,2) + ')';
         wTexto := wTexto + '  ';
       end;
  end;
  uDM.PedWrkTxtExtras.AsString := wTexto;
  //
  wTexto := '';
  wAuxil := uDM.PedWrkExcluir.AsString;
  if wAuxil <> '000000000000'
  then begin
    wTexto := wTexto + 'SEM: ';
    for i := 1 to 12
    do if wAuxil[i] = '1'
       then wTexto := wTexto + uDM.wTxtExclus[i] + '  ';
  end;
  uDM.PedWrkTxtExclus.AsString := wTexto;
  FuTrataLanche.btOkLanche.setFocus;

end;

Procedure AssinalaExtra(pIndice:Integer;pImage:TImage);
var i: Integer;
begin
  wrkVlrExtra[1]  := uDM.PedWrkVlrExt1.AsCurrency;
  wrkVlrExtra[2]  := uDM.PedWrkVlrExt2.AsCurrency;
  wrkVlrExtra[3]  := uDM.PedWrkVlrExt3.AsCurrency;
  wrkVlrExtra[4]  := uDM.PedWrkVlrExt4.AsCurrency;
  wrkVlrExtra[5]  := uDM.PedWrkVlrExt5.AsCurrency;
  wrkVlrExtra[6]  := uDM.PedWrkVlrExt6.AsCurrency;
  wrkVlrExtra[7]  := uDM.PedWrkVlrExt7.AsCurrency;
  wrkVlrExtra[8]  := uDM.PedWrkVlrExt8.AsCurrency;
  wrkVlrExtra[9]  := uDM.PedWrkVlrExt9.AsCurrency;
  wrkVlrExtra[10] := uDM.PedWrkVlrExt10.AsCurrency;
  wrkVlrExtra[11] := uDM.PedWrkVlrExt11.AsCurrency;
  wrkVlrExtra[12] := uDM.PedWrkVlrExt12.AsCurrency;
  wrkExtras := uDM.PedWrkExtras.AsString;
  if wrkExtras[pIndice] = '0'
  then begin
    wrkExtras[pIndice]   := '1';
    wrkVlrExtra[pIndice] := uDM.wVlrExtras[pIndice];
    pImage.Visible := True;
  end
  else begin
    wrkExtras[pIndice]   := '0';
    wrkVlrExtra[pIndice] := 0;
    pImage.Visible := False;
  end;
  uDM.PedWrkExtras.AsString := wrkExtras;
  uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency;
  for i := 1 to 12
  do uDM.PedWrkVlrTotal.AsCurrency := uDM.PedWrkVlrTotal.AsCurrency + wrkVlrExtra[i];

  uDM.PedWrkVlrExt1.AsCurrency  := wrkVlrExtra[1];
  uDM.PedWrkVlrExt2.AsCurrency  := wrkVlrExtra[2];
  uDM.PedWrkVlrExt3.AsCurrency  := wrkVlrExtra[3];
  uDM.PedWrkVlrExt4.AsCurrency  := wrkVlrExtra[4];
  uDM.PedWrkVlrExt5.AsCurrency  := wrkVlrExtra[5];
  uDM.PedWrkVlrExt6.AsCurrency  := wrkVlrExtra[6];
  uDM.PedWrkVlrExt7.AsCurrency  := wrkVlrExtra[7];
  uDM.PedWrkVlrExt8.AsCurrency  := wrkVlrExtra[8];
  uDM.PedWrkVlrExt9.AsCurrency  := wrkVlrExtra[9];
  uDM.PedWrkVlrExt10.AsCurrency := wrkVlrExtra[10];
  uDM.PedWrkVlrExt11.AsCurrency := wrkVlrExtra[11];
  uDM.PedWrkVlrExt12.AsCurrency := wrkVlrExtra[12];
  DefineTextoExtrasExclusoes;

end;

Procedure AssinalaExclusao(pIndice:Integer;pImage:TImage);
begin
  wrkExcluir := uDM.PedWrkExcluir.AsString;
  if wrkExcluir[pIndice] = '0'
  then begin
    wrkExcluir[pIndice] := '1';
    pImage.Visible := True;
  end
  else begin
    wrkExcluir[pIndice] := '0';
    pImage.Visible := False;
  end;
  uDM.PedWrkExcluir.AsString := wrkExcluir;
  DefineTextoExtrasExclusoes;

end;


procedure TFuTrataLanche.btCancelLancheClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  if lInclusao
     then uDM.PedWrk.Delete;
  FuTrataLanche.Close;

end;

procedure TFuTrataLanche.btExcl10Click(Sender: TObject);
begin
  AssinalaExclusao(10,imgExcl10);

end;

procedure TFuTrataLanche.btExcl11Click(Sender: TObject);
begin
  AssinalaExclusao(11,imgExcl11);

end;

procedure TFuTrataLanche.btExcl12Click(Sender: TObject);
begin
  AssinalaExclusao(12,imgExcl12);

end;

procedure TFuTrataLanche.btExcl1Click(Sender: TObject);
begin
  AssinalaExclusao(1,imgExcl1);

end;

procedure TFuTrataLanche.btExcl2Click(Sender: TObject);
begin
  AssinalaExclusao(2,imgExcl2);

end;

procedure TFuTrataLanche.btExcl3Click(Sender: TObject);
begin
  AssinalaExclusao(3,imgExcl3);

end;

procedure TFuTrataLanche.btExcl4Click(Sender: TObject);
begin
  AssinalaExclusao(4,imgExcl4);

end;

procedure TFuTrataLanche.btExcl5Click(Sender: TObject);
begin
  AssinalaExclusao(5,imgExcl5);

end;

procedure TFuTrataLanche.btExcl6Click(Sender: TObject);
begin
  AssinalaExclusao(6,imgExcl6);

end;

procedure TFuTrataLanche.btExcl7Click(Sender: TObject);
begin
  AssinalaExclusao(7,imgExcl7);

end;

procedure TFuTrataLanche.btExcl8Click(Sender: TObject);
begin
  AssinalaExclusao(8,imgExcl8);

end;

procedure TFuTrataLanche.btExcl9Click(Sender: TObject);
begin
  AssinalaExclusao(9,imgExcl9);

end;

procedure TFuTrataLanche.btExclusLancheClick(Sender: TObject);
begin
  uDM.PedWrk.Cancel;
  uDM.PedWrk.Delete;
  FuTrataLanche.Close;

end;

procedure TFuTrataLanche.btExtra10Click(Sender: TObject);
begin
  AssinalaExtra(10,imgExtra10);

end;

procedure TFuTrataLanche.btExtra11Click(Sender: TObject);
begin
  AssinalaExtra(11,imgExtra11);

end;

procedure TFuTrataLanche.btExtra12Click(Sender: TObject);
begin
  AssinalaExtra(12,imgExtra12);

end;

procedure TFuTrataLanche.btExtra1Click(Sender: TObject);
begin
  AssinalaExtra(1,imgExtra1);

end;


procedure TFuTrataLanche.btExtra2Click(Sender: TObject);
begin
  AssinalaExtra(2,imgExtra2);

end;

procedure TFuTrataLanche.btExtra3Click(Sender: TObject);
begin
  AssinalaExtra(3,imgExtra3);

end;

procedure TFuTrataLanche.btExtra4Click(Sender: TObject);
begin
  AssinalaExtra(4,imgExtra4);

end;

procedure TFuTrataLanche.btExtra5Click(Sender: TObject);
begin
  AssinalaExtra(5,imgExtra5);

end;

procedure TFuTrataLanche.btExtra6Click(Sender: TObject);
begin
  AssinalaExtra(6,imgExtra6);

end;

procedure TFuTrataLanche.btExtra7Click(Sender: TObject);
begin
  AssinalaExtra(7,imgExtra7);

end;

procedure TFuTrataLanche.btExtra8Click(Sender: TObject);
begin
  AssinalaExtra(8,imgExtra8);

end;

procedure TFuTrataLanche.btExtra9Click(Sender: TObject);
begin
  AssinalaExtra(9,imgExtra9);

end;

procedure TFuTrataLanche.btOkLancheClick(Sender: TObject);
begin
  uDM.PedWrk.Post;
  FuTrataLanche.Close;

end;

procedure TFuTrataLanche.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FuTrataLanche);

end;

procedure TFuTrataLanche.FormCreate(Sender: TObject);
begin
  btExclusLanche.Left := 60;

end;

procedure TFuTrataLanche.FormResize(Sender: TObject);
var topBtn: Integer;
begin
  // Monta 'Extras' em FuTrataLanche




  altBtn := (PanExtras.Height - (LabExtras.Height + 2)) div uDM.wMaxExtraExclus;
  lrgBtn := Trunc(PanExtras.Width * 0.80);
  lrgImg := Trunc(PanExtras.Width * 0.10);
  if altBtn > 60
     then altBtn := 60;
  topBtn := LabExtras.Height + 2;
  IdentificaExtras(FuTrataLanche.btExtra1,1,FuTrataLanche.imgExtra1,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra2,2,FuTrataLanche.imgExtra2,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra3,3,FuTrataLanche.imgExtra3,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra4,4,FuTrataLanche.imgExtra4,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra5,5,FuTrataLanche.imgExtra5,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra6,6,FuTrataLanche.imgExtra6,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra7,7,FuTrataLanche.imgExtra7,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra8,8,FuTrataLanche.imgExtra8,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra9,9,FuTrataLanche.imgExtra9,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra10,10,FuTrataLanche.imgExtra10,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra11,11,FuTrataLanche.imgExtra11,topBtn);
  IdentificaExtras(FuTrataLanche.btExtra12,12,FuTrataLanche.imgExtra12,topBtn);
  //

end;

procedure TFuTrataLanche.FormShow(Sender: TObject);
var wStrAuxil: String;
begin
  Form_Define(FuTrataLanche);
  FuTrataLanche.FormResize(nil);
  if not lInclusao
  then begin
    wStrAuxil := uDM.PedWrkExtras.AsString;
    if wStrAuxil[1]  = '1' then FuTrataLanche.imgExtra1.Visible := True;
    if wStrAuxil[2]  = '1' then FuTrataLanche.imgExtra2.Visible := True;
    if wStrAuxil[3]  = '1' then FuTrataLanche.imgExtra3.Visible := True;
    if wStrAuxil[4]  = '1' then FuTrataLanche.imgExtra4.Visible := True;
    if wStrAuxil[5]  = '1' then FuTrataLanche.imgExtra5.Visible := True;
    if wStrAuxil[6]  = '1' then FuTrataLanche.imgExtra6.Visible := True;
    if wStrAuxil[7]  = '1' then FuTrataLanche.imgExtra7.Visible := True;
    if wStrAuxil[8]  = '1' then FuTrataLanche.imgExtra8.Visible := True;
    if wStrAuxil[9]  = '1' then FuTrataLanche.imgExtra9.Visible := True;
    if wStrAuxil[10] = '1' then FuTrataLanche.imgExtra10.Visible := True;
    if wStrAuxil[11] = '1' then FuTrataLanche.imgExtra11.Visible := True;
    if wStrAuxil[12] = '1' then FuTrataLanche.imgExtra12.Visible := True;
    wStrAuxil := uDM.PedWrkExcluir.AsString;
    if wStrAuxil[1]  = '1' then FuTrataLanche.imgExcl1.Visible := True;
    if wStrAuxil[2]  = '1' then FuTrataLanche.imgExcl2.Visible := True;
    if wStrAuxil[3]  = '1' then FuTrataLanche.imgExcl3.Visible := True;
    if wStrAuxil[4]  = '1' then FuTrataLanche.imgExcl4.Visible := True;
    if wStrAuxil[5]  = '1' then FuTrataLanche.imgExcl5.Visible := True;
    if wStrAuxil[6]  = '1' then FuTrataLanche.imgExcl6.Visible := True;
    if wStrAuxil[7]  = '1' then FuTrataLanche.imgExcl7.Visible := True;
    if wStrAuxil[8]  = '1' then FuTrataLanche.imgExcl8.Visible := True;
    if wStrAuxil[9]  = '1' then FuTrataLanche.imgExcl9.Visible := True;
    if wStrAuxil[10] = '1' then FuTrataLanche.imgExcl10.Visible := True;
    if wStrAuxil[11] = '1' then FuTrataLanche.imgExcl11.Visible := True;
    if wStrAuxil[12] = '1' then FuTrataLanche.imgExcl12.Visible := True;
  end;
  btOkLanche.SetFocus;

end;

end.
