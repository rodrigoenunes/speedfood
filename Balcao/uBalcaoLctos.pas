unit uBalcaoLctos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Buttons;

type
  TFuBalcaoLctos = class(TForm)
    PanGridPed: TPanel;
    PanPedCtle: TPanel;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    NavPedido: TDBNavigator;
    btFinalizar: TBitBtn;
    btCancelar: TBitBtn;
    btDummy: TBitBtn;
    GridPedido: TDBGrid;
    PanTotalizacao: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edItens: TEdit;
    edTotal: TEdit;
    PanOpcoes: TPanel;
    LabOpcoes: TLabel;
    btCQuente: TBitBtn;
    btCQEspecial: TBitBtn;
    btBebidas: TBitBtn;
    btCrepes: TBitBtn;
    btFrituras: TBitBtn;
    btGelados: TBitBtn;
    btMShake: TBitBtn;
    btBuffet: TBitBtn;
    btDiversos: TBitBtn;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btCQEspecialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuBalcaoLctos: TFuBalcaoLctos;

implementation

{$R *.dfm}

uses uDados, uGenericas, uMontarLanche;


Procedure InclueItem(pTipo:Integer);
var nLct,wCodItem,i: Integer;
    wDescr: String;
    wValor: Currency;
    wAltPr: Boolean;
begin
  with uDM
  do begin
    FuMontarLanche.nRowBas := 0;
    FuMontarLanche.nRowExt := 0;
    case pTipo  of
      1:begin
          //if not uDM.Itens.FindKey([1,pCodLanche]) then Exit;
          //wDescr := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
          //wValor := uDM.ItensPreco.AsCurrency;
          //wAltPr := uDM.ItensAlteraPreco.AsBoolean;
        end;
      4:begin
          for i := 0 to 19
          do begin
            FuMontarLanche.wCodBas[i] := 0;
            FuMontarLanche.wSelBas[i] := '';
            FuMontarLanche.wCodExt[i] := 0;
            FuMontarLanche.wSelExt[i] := '';
          end;
          uDM.Itens.First;
          while not uDM.Itens.Eof do
          begin
           case uDM.ItensGrupo.AsInteger of
             {
             1:begin    // Lanches
                 wCodLanche[nCol,nRow] := uDM.ItensCodigo.AsInteger;
                 nCol := nCol + 1;
                 if nCol = GridLanches.ColCount
                 then begin
                   nRow := nRow + 1;
                   nCol := 0;
                 end;
               end;
             3:begin    // Bebidas
                 wCodBebida[nColBeb,nRowBeb] := uDM.ItensCodigo.AsInteger;
                 nColBeb := nColBeb + 1;
                 if nColBeb = GridBebidas.ColCount
                 then begin
                   nRowBeb := nRowBeb + 1;
                   nColBeb := 0;
                 end;
             end;
             }
             4:begin    // Basicos
                 FuMontarLanche.wCodBas[FuMontarLanche.nRowBas] := uDM.ItensCodigo.AsInteger;
                 FuMontarLanche.nRowBas := FuMontarLanche.nRowBas + 1;
               end;
             5:begin    // Complementos (montar lanche)
                 FuMontarLanche.wCodExt[FuMontarLanche.nRowExt] := uDM.ItensCodigo.AsInteger;
                 FuMontarLanche.nRowExt := FuMontarLanche.nRowExt + 1;
               end;
           end;
           uDM.Itens.Next;
         end;
          wCodItem := 0;
          wDescr := 'Montar lanche - ';
          wValor := 0;
          wAltPr := False;
        end;
      else Exit;
    end;
    //
    PedWrk.Last;
    nLct := PedWrkNrLcto.AsInteger + 1;
    PedWrk.Append;
    PedWrkNrLcto.AsInteger    := nLct;
    PedWrkTpProd.AsInteger    := pTipo;            // 1-Lanche, 2-Bebida, 4-Lanche montado
    PedWrkCodProd.AsInteger   := wCodItem;
    PedWrkDescricao.AsString  := wDescr;
    PedWrkQuant.AsInteger     := 1;
    PedWrkVlrUnit.AsCurrency  := wValor;
    PedWrkVlrTotal.AsCurrency := wValor;
    PedWrkExtras.AsString     := stringFiller('.',24);
    PedWrkAltPreco.AsBoolean  := wAltPr;
    PedWrkCortado.AsBoolean   := False;
    PedWrkPrensado.AsBoolean  := False;
    PedWrkEtqImpressa.AsInteger := 0;
    PedWrk.Post;
    PedWrk.Edit;

{
    if pTipo = 1
    then begin
      FuPedidos.FormResize(nil);
      TratativaLanche(pCodLanche,True,nMaxExtras);
      if PedWrk.State = dsEdit
         then PedWrk.Post;
      TotalizaPedido;
    end;
}
  end;

end;


procedure TFuBalcaoLctos.btCancelarClick(Sender: TObject);
begin
  FuBalcaoLctos.Close;

end;

procedure TFuBalcaoLctos.btCQEspecialClick(Sender: TObject);
begin
  InclueItem(4);
  MontagemDoLanche(True);
  //TotalizaPedido;

end;

procedure TFuBalcaoLctos.FormActivate(Sender: TObject);
begin
  FuBalcaoLctos.Align := alClient;

end;

procedure TFuBalcaoLctos.FormResize(Sender: TObject);
begin
  if FuBalcaoLctos.Width < 920 then FuBalcaoLctos.Width := 920;
  if FuBalcaoLctos.Height < 540 then FuBalcaoLctos.Height := 540;
  PanOpcoes.Width := Trunc(FuBalcaoLctos.Width * 0.20);
  if PanOpcoes.Width < 120
  then PanOpcoes.Width := 120
  else if PanOpcoes.Width > 240
       then PanOpcoes.Width := 240;
  //
  btCQuente.Height := (PanOpcoes.Height - (LabOpcoes.Height + 16)) div 9;
  btCQuente.Width := PanOpcoes.Width - 4;
  btCQuente.Left := 2;
  btCQuente.Top := LabOpcoes.Height + 2;
  //
  btCQEspecial.Left := btCQuente.Left;
  btCQEspecial.Width := btCQuente.Width;
  btCQEspecial.Height := btCQuente.Height;
  btCQEspecial.Top := btCQuente.Top + btCQuente.Height + 2;
  //
  btBebidas.Left := btCQuente.Left;
  btBebidas.Width := btCQuente.Width;
  btBebidas.Height := btCQuente.Height;
  btBebidas.Top := btCQEspecial.Top + btCQuente.Height + 2;
  //
  btCrepes.Left := btCQuente.Left;
  btCrepes.Width := btCQuente.Width;
  btCrepes.Height := btCQuente.Height;
  btCrepes.Top := btBebidas.Top + btCQuente.Height + 2;
  //
  btFrituras.Left := btCQuente.Left;
  btFrituras.Width := btCQuente.Width;
  btFrituras.Height := btCQuente.Height;
  btFrituras.Top := btCrepes.Top + btCQuente.Height + 2;
  //
  btGelados.Left := btCQuente.Left;
  btGelados.Width := btCQuente.Width;
  btGelados.Height := btCQuente.Height;
  btGelados.Top := btFrituras.Top + btCQuente.Height + 2;
  //
  btMShake.Left := btCQuente.Left;
  btMShake.Width := btCQuente.Width;
  btMShake.Height := btCQuente.Height;
  btMShake.Top := btGelados.Top + btCQuente.Height + 2;
  //
  btBuffet.Left := btCQuente.Left;
  btBuffet.Width := btCQuente.Width;
  btBuffet.Height := btCQuente.Height;
  btBuffet.Top := btMShake.Top + btCQuente.Height + 2;
  //
  btDiversos.Left := btCQuente.Left;
  btDiversos.Width := btCQuente.Width;
  btDiversos.Height := btCQuente.Height;
  btDiversos.Top := btBuffet.Top + btCQuente.Height + 2;
  //
  if CriaAbrePedidoWrk(0) <> 0 then Exit;
  btDummy.SetFocus;

end;

end.
