unit uFinPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;
  Function FinalizaPedido: Integer;

type
  TFuFinPedido = class(TForm)
    PanRodape: TPanel;
    PanInform: TPanel;
    PanTexto: TPanel;
    MemPedido: TMemo;
    PanTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabTaman: TLabel;
    dbNro: TDBEdit;
    dbLcts: TDBEdit;
    dbValor: TDBEdit;
    dbMeioPagto: TDBRadioGroup;
    dbCPF: TDBEdit;
    Label4: TLabel;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btRetornar: TBitBtn;
    gbEspecif: TGroupBox;
    edReais: TDBEdit;
    edCDeb: TDBEdit;
    edCCred: TDBEdit;
    edPIX: TDBEdit;
    edCheque: TDBEdit;
    edVRef: TDBEdit;
    edOutros: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure btGravarClick(Sender: TObject);
    procedure btRetornarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dbCPFExit(Sender: TObject);
    procedure dbCPFEnter(Sender: TObject);
    procedure dbMeioPagtoEnter(Sender: TObject);
    procedure dbMeioPagtoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuFinPedido: TFuFinPedido;
  nRetorno,nrPedido: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas, uPedidos;

Function FinalizaPedido: Integer;
var linHifen: String;
    xDescr,xTotal,wTxtAux: String;
    i,tMax: Integer;
    strItem: TStringList;
begin
  with FuFinPedido
  do begin
    Width := Trunc(Screen.Width * 0.70);
    Left := (Screen.Width - Width) div 2;
    Height := Trunc(Screen.Height * 0.80);
    Top := (Screen.Height - Height) div 2;
    linHifen := stringFiller('-',70);
    LabTaman.Font.Name := 'Lucida Console';
    LabTaman.Font.Size := 8;
    LabTaman.Caption := linHifen;
    PanTexto.Width := LabTaman.Width + 32;
    MemPedido.Font.Name := LabTaman.Font.Name;
    MemPedido.Font.Size := LabTaman.Font.Size;
    //
    strItem := TStringList.Create;
    uDM.Pedidos.Last;
    nrPedido := uDM.PedidosNumero.AsInteger + 1;
    uDM.Pedidos.Append;
    uDM.PedidosNumero.AsInteger := nrPedido;
    uDM.PedidosData.AsDateTime := Now;
    uDM.PedidosCPF_CNPJ.Clear;
    uDM.PedidosLanctos.AsInteger := FuPedidos.itensPedido;
    uDM.PedidosValor.AsCurrency := FuPedidos.totalPedido;
    uDM.PedidosMeioPagto.AsInteger := 0;      // Reais
    uDM.PedidosVlrReais.AsCurrency := FuPedidos.totalPedido;
    uDM.PedidosVlrCDeb.Clear;
    uDM.PedidosVlrCCred.Clear;
    uDM.PedidosVlrPIX.Clear;
    uDM.PedidosVlrVRef.Clear;
    uDM.PedidosVlrCheque.Clear;
    uDM.PedidosVlrOutros.Clear;
    uDM.PedidosNrNFCe.Clear;
    uDM.PedidosSrNFCe.Clear;
    uDM.PedidosArqXML.Clear;
    uDM.PedidosCPF_CNPJ.EditMask := '';
{
<     D e s c r i ç ã o     >                                < Total >
123456789.123456789.123456789.123456789.123456789.123456789. 999999,99
----------------------------------------------------------------------
123456789.123456789.123456789.123456789.123456789.123456789.123456789.
}
    MemPedido.Lines.Clear;
    MemPedido.Lines.Add(StringCompleta('<     D e s c r i ç ã o     >','D',' ',60) + ' < Total >');
    MemPedido.Lines.Add(linHifen);
    uDM.PedWrk.First;
    while not uDM.PedWrk.Eof
    do begin
      strItem.Clear;
      tMax := 60;
      if (uDM.PedWrkTpProd.AsInteger = 3) or                 // Bebidas ou Diversos
         (uDM.PedWrkTpProd.AsInteger = 4) then tMax := 49;
      xDescr := Trim(uDM.PedWrkDescricao.AsString);
      if Length(xDescr) > tMax then xDescr := Copy(xDescr,1,tMax);
      if (uDM.PedWrkTpProd.AsInteger = 3) or            // Bebidas
         (uDM.PedWrkTpProd.AsInteger = 4)               // Diversos
      then xDescr := xDescr + '(' + uDM.PedWrkQuant.AsString + ' X ' +
                     FloatToStrF(uDM.PedWrkVlrUnit.AsCurrency,ffNumber,6,2) + ')';
      xDescr := stringCompleta(xDescr,'D','.',60);
      xTotal := StringCompleta(FloatToStrF(uDM.PedWrkVlrTotal.AsCurrency,ffNumber,8,2),'E','.',10);
      strItem.Add(xDescr + xTotal);
      // Extras
      if uDM.PedWrkTxtExtras.AsString <> '' then
      begin
        strItem.Add(' Acrescentar');
        wTxtAux := uDM.PedWrkTxtExtras.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add('    ' + Copy(wTxtAux,1,56));
          wTxtAux := Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add('    ' + wTxtAux);
      end;
      // Excecoes
      if uDM.PedWrkTxtExtras.AsString <> '' then
      begin
        strItem.Add('  Excluir');
        wTxtAux := uDM.PedWrkTxtExclus.AsString;
        while Length(wTxtAux) >= 56 do
        begin
          strItem.Add('    ' + Copy(wTxtAux,1,56));
          wTxtAux := Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add('    ' + wTxtAux);
      end;
      // Observações
      if uDM.PedWrkObserv.AsString <> '' then
      begin
        strItem.Add('  Observações');
        wTxtAux := uDM.PedWrkObserv.AsString;
        while Length(wTxtAux) >= 56
        do begin
          strItem.Add('    ' + Copy(wTxtAux,1,56));
          wTxtAux := Copy(wTxtAux,57,Length(wTxtAux)-56);
        end;
        if Length(wTxtAux) > 0 then strItem.Add('    ' + wTxtAux);
      end;
      //
      strItem.Add(' ');
      for i := 0 to strItem.Count-1
        do MemPedido.Lines.Add(strItem[i]);
      uDM.PedWrk.Next;
    end;
    MemPedido.Lines.Add(linHifen);
    xDescr := IntToStr(FuPedidos.itensPedido) + ' ítens' +
              '     Total: R$ ' + FloatToStrF(FuPedidos.totalPedido,ffNumber,15,2);
    MemPedido.Lines.Add(stringCompleta(xDescr,'C',' ',70));
    MemPedido.Lines.Add(linHifen);
    //
    nRetorno := 1;
    ShowModal;
  end;
  Result := nRetorno;

end;

procedure TFuFinPedido.btCancelarClick(Sender: TObject);
begin
  uDM.Pedidos.Cancel;
  nRetorno := 2;
  FuFinPedido.Close;

end;

procedure TFuFinPedido.btGravarClick(Sender: TObject);
var somaVlr: Currency;
begin
  somaVlr := uDM.PedidosVlrReais.AsCurrency + uDM.PedidosVlrCDeb.AsCurrency +
             uDM.PedidosVlrCCred.AsCurrency + uDM.PedidosVlrPIX.AsCurrency +
             uDM.PedidosVlrVRef.AsCurrency + uDM.PedidosVlrCheque.AsCurrency +
             uDM.PedidosVlrOutros.AsCurrency;
  if uDM.PedidosValor.AsCurrency <> somaVlr then
  begin
    MessageDlg('Somatório dos valores difere do total do pedido',mtError,[mbOk],0);
    dbMeioPagto.SetFocus;
    Exit;
  end;
  //
  uDM.Pedidos.Post;
  uDM.PedWrk.First;
  while not uDM.PedWrk.Eof do
  begin
    uDM.PedItens.Append;
    uDM.PedItensNumero.AsInteger := nrPedido;
    uDM.PedItensNrLcto.AsInteger := uDM.PedWrkNrLcto.AsInteger;
    uDM.PedItensTpProd.AsInteger := uDM.PedWrkTpProd.AsInteger;
    uDM.PedItensCodProd.AsInteger := uDM.PedWrkCodProd.AsInteger;
    uDM.PedItensVlrUnitario.AsCurrency := uDM.PedWrkVlrUnit.AsCurrency;
    uDM.PedItensCod01.AsInteger := uDM.PedWrkCod01.AsInteger;
    uDM.PedItensVlr01.AsCurrency := uDM.PedWrkVlr01.AsCurrency;
    uDM.PedItensCod02.AsInteger := uDM.PedWrkCod02.AsInteger;
    uDM.PedItensVlr02.AsCurrency := uDM.PedWrkVlr02.AsCurrency;
    uDM.PedItensCod03.AsInteger := uDM.PedWrkCod03.AsInteger;
    uDM.PedItensVlr03.AsCurrency := uDM.PedWrkVlr03.AsCurrency;
    uDM.PedItensVlrTotal.AsCurrency := uDM.PedWrkVlrTotal.AsCurrency;
    uDM.PedItensExtras.AsString := uDM.PedWrkExtras.AsString;
    uDM.PedItensTxtExtras.AsString := uDM.PedWrkTxtExtras.AsString;
    uDM.PedItensTxtExclus.AsString := uDM.PedWrkTxtExclus.AsString;
    uDM.PedItensObservacao.AsString := uDM.PedWrkObserv.AsString;
    uDM.PedItens.Post;
    uDM.Pedwrk.Next;
  end;
  nRetorno := 0;
  FuFinPedido.Close;

end;

procedure TFuFinPedido.btRetornarClick(Sender: TObject);
begin
  uDM.Pedidos.Cancel;
  nRetorno := 1;
  FuFinPedido.Close;

end;

procedure TFuFinPedido.dbCPFEnter(Sender: TObject);
begin
    uDM.PedidosCPF_CNPJ.EditMask := '';

end;

procedure TFuFinPedido.dbCPFExit(Sender: TObject);
begin
  if uDM.PedidosCPF_CNPJ.AsString = '' then
  begin
    uDM.PedidosCPF_CNPJ.EditMask := '';
    Exit;
  end;
  if not ValidaCNPJ_CPF(uDM.PedidosCPF_CNPJ.AsString) then
  begin
    MessageDlg('CPF / CNPJ inválido, reinforme',mtError,[mbOk],0);
    dbCPF.SetFocus;
    Exit;
  end;
  uDM.PedidosCPF_CNPJ.AsString := Trim(uDM.PedidosCPF_CNPJ.AsString);
  if Length(Trim(uDM.PedidosCPF_CNPJ.AsString)) = 11
     then uDM.PedidosCPF_CNPJ.EditMask := DefineMascaraJurFis('F')
     else uDM.PedidosCPF_CNPJ.EditMask := DefineMascaraJurFis('J');

end;

procedure TFuFinPedido.dbMeioPagtoEnter(Sender: TObject);
begin
  gbEspecif.Enabled := False;

end;

procedure TFuFinPedido.dbMeioPagtoExit(Sender: TObject);
begin
  gbEspecif.Enabled := False;
  if dbMeioPagto.ItemIndex <> 7
  then begin
    uDM.PedidosVlrReais.Clear;
    uDM.PedidosVlrCDeb.Clear;
    uDM.PedidosVlrCCred.Clear;
    uDM.PedidosVlrPIX.Clear;
    uDM.PedidosVlrCheque.Clear;
    uDM.PedidosVlrVRef.Clear;
    uDM.PedidosVlrOutros.Clear;
  end;
  case dbMeioPagto.ItemIndex of
    0:uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
    1:uDM.PedidosVlrCDeb.AsCurrency   := FuPedidos.totalPedido;
    2:uDM.PedidosVlrCCred.AsCurrency  := FuPedidos.totalPedido;
    3:uDM.PedidosVlrPIX.AsCurrency    := FuPedidos.totalPedido;
    4:uDM.PedidosVlrVRef.AsCurrency   := FuPedidos.totalPedido;
    5:uDM.PedidosVlrCheque.AsCurrency := FuPedidos.totalPedido;
    6:uDM.PedidosVlrOutros.AsCurrency := FuPedidos.totalPedido;
    7:begin
        gbEspecif.Enabled := True;
        uDM.PedidosVlrReais.AsCurrency  := FuPedidos.totalPedido;
      end;
  end;

end;

end.
