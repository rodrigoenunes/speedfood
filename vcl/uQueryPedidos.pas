unit uQueryPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB, IniFiles, ShellAPI,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.DBCtrls;
  Procedure QueryPedidos;

type
  TFuQueryPedidos = class(TForm)
    DBGrid1: TDBGrid;
    FDQPedidos: TFDQuery;
    DSPedidos: TDataSource;
    FDQPedidosTurno: TIntegerField;
    FDQPedidosPlaca: TStringField;
    FDQPedidosData: TDateTimeField;
    FDQPedidosMeioPagto: TSmallintField;
    FDQPedidosSitPagto: TSmallintField;
    FDQPedidosNumero: TLongWordField;
    FDQPedidosValor: TBCDField;
    FDQPedidosZC_MeioPagto: TStringField;
    FDQPedidosZC_SitPagto: TStringField;
    FDQPedidosOrigem: TSmallintField;
    FDQPedidosZC_Origem: TStringField;
    Panel1: TPanel;
    LabDatas: TLabel;
    Panel2: TPanel;
    btNothing: TBitBtn;
    LabNRegs: TLabel;
    DBNavigator1: TDBNavigator;
    btImprimirPedido: TBitBtn;
    btImprimirEtiquetas: TBitBtn;
    btEmitirNFCe: TBitBtn;
    FDQPedidosNomeCliente: TStringField;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    btAnterior: TBitBtn;
    btProximo: TBitBtn;
    Label1: TLabel;
    edTurno: TMaskEdit;
    btAtual: TBitBtn;
    rgCaixas: TRadioGroup;
    btConsultar: TBitBtn;
    FDQPedidosNrEstacao: TIntegerField;
    procedure FDQPedidosCalcFields(DataSet: TDataSet);
    procedure edTurnoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btImprimirPedidoClick(Sender: TObject);
    procedure btImprimirEtiquetasClick(Sender: TObject);
    procedure btEmitirNFCeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btAtualClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuQueryPedidos: TFuQueryPedidos;
  wNrTurno: Integer;
  lFTime: Boolean;
  wExecutavel: String;
  wArqSai,wArqXML,exibeRetorno: String;
  tmpExtra,tmpTimeOut: Integer;

implementation

{$R *.dfm}

uses uDados, uImpressoes, SFEuPrintFortes, uGenericas;

Procedure QueryPedidos;
begin
  wNrTurno := uDM.turnoCorrente;
  wExecutavel := ObtemParametro('ACNFE_EXE');
  if not FileExists(wExecutavel)
  then begin
    wExecutavel := ExtractFilePath(Application.ExeName) + wExecutavel;
    if not FileExists(wExecutavel) then
    begin
      wExecutavel := ObtemParametro('ACNFE_EXE');
      MessageDlg('[ ' + wExecutavel + ' ] não encontrado' + #13 +
                 'Emissão de NFCe impossibilitada',mtInformation,[mbOk],0);
      FuQueryPedidos.btEmitirNFCe.Enabled := False;
    end;
  end;
  //
  tmpExtra := StrToIntDef(ObtemParametro('Cancelamento_TmpExtra'),2);
  tmpTimeOut := StrToIntDef(obtemParametro('Cancelamento_TimeOut'),60);
  exibeRetorno := ObtemParametro('Cancelamento_ExibeRetorno');
  //
  with FuQueryPedidos
  do begin
    Height := Screen.Height - 60;
    Width := (Screen.Width div 3) * 2;
    Top := 0;
    Left := (Screen.Width - Width) div 2;
    Caption := 'Consulta / Manutenção de pedidos';
    if not uDM.RegCaixa.FindKey([wNrTurno]) then
      uDM.RegCaixa.Last;
    FDQPedidos.Connection := uDM.FDC;
    FDQPedidos.Close;
    DbGrid1.Visible := False;
    lFTime := True;
    ShowModal;
  end;
  Exit;

end;


Procedure RetornoACNFe(pArqSai:String; pTempo:Integer; var pRetorno:String; pTmpExtra:Integer = 0);
var wTempo,i: Integer;
    wRetorno: TStringList;
begin
  if pTmpExtra > 0
     then Sleep(pTmpExtra * 1000);
  pRetorno := '';
  wTempo := 0;               // Tempo decorrido
  pTempo := pTempo * 1000;   // Tempo a decorrer em milisegundos
  while wTempo < pTempo do
  begin
    sleep(500);
    if FileExists(pArqSai) then
    begin
      wRetorno := TStringList.Create;
      wRetorno.LoadFromFile(pArqSai);
      for i := 0 to wRetorno.Count-1 do
        pRetorno := pRetorno + wRetorno[i];
      wRetorno.Free;
      wTempo := pTempo + 500;
    end
    else begin
      wTempo := wTempo + 500;
    End;
  end;

end;




Function CancelaCartao(pExec:String): Boolean;             // Cancelamento de transação de cartão
var wVlrPago,wData,wTpCard: String;
    wCmdo,wParm,wRetorno: String;
    codRetorno: Integer;
    wVlr: Currency;
    lEstorna: Boolean;
    xAfiliacao: String;

begin
{ Forma da versão antiga            cAut                    NrDoc
  ACNFe /tef /cancelar CIELO 316,30 273337 13/10/23 CREDITO 23208 arq-nfe.xml -as C:\saida\padrao.txt }

{
  Versão atual
  afiliacao:= udm.FDC.ExecSQLScalar('select ahjdahdjhs'.Replace(':opcao', '1') )

ACNFe /tef /estornar terminal afiliacao valor codAutorizacao Data tPag nrodoc NSU

terminal	      Terminal onde se executa o sistema
afiliação	      Nome da Afiliação (parm)
Valor	          Valor da transação, utilizar somente separador de decimal (vírgula)
CodAutorizacao	Código de Autorização da Transação
Data          	Data da Autorização no formato DD/MM/AA, somente são aceitos os estorno no mesmo dia da transação de autorização.
tpag	          Tipo de pagamento  03=Cartão de Crédito, 04=Cartão de Débito, 17=Pagamento Instantâneo (PIX)
nrodoc         	Nro do documento para se referenciar
NSU	            Numero Sequencial Único (solicitado por algumas afiliações)
}
  Result := False;
  wArqSai := ExtractFilePath(Application.ExeName) + 'wTEF.Txt';
{ versao antiga
  wArqXML := uDM.PedidosIdArqXML.AsString;
  if (uDM.sysVersao <> 'NOVA')                 // Versão antiga
     and (not FileExists(wArqXML)) then        // Não existe o XML da NFCe
  begin
    MessageDlg('Arquivo XML não encontrado' + #13 + wArqXML + #13 +
               'Processo interrompido',mtError,[mbOk],0);
    Exit;
  end;
  //
}
  wCmdo    := pExec;           // Executável
  uDM.PedDetpag.First;
  while not uDM.PedDetpag.Eof do
  begin
    DebugMensagem(uDM.lDebug,uDM.PedDetpagNumero.AsString + '/' + uDM.PedDetpagtPag.AsString +
                             '/ Sit=' + uDM.PedDetpagSit.AsString +
                             'TpInteg='+ uDM.PedDetpagTpIntegra.AsString);
    if ((uDM.PedDetpagtPag.AsString = '03') or                 // cartão crédito
        (uDM.PedDetpagtPag.AsString = '04') or                 // cartão débito
        (uDM.PedDetpagtPag.AsString = '17')) and               // PIX
        (uDM.PedDetpagSit.AsInteger = 0) and                   // Situação : Não cancelado
        (uDM.PedDetpagtpIntegra.AsInteger = 1) then            // Integrado : SIM
    begin
      //if uDM.sysVersao = 'NOVA' then
      //begin             // Nova versão
      case uDM.PedidosMeioPagto.AsInteger of
        1:xAfiliacao := ObtemParametro('AFIL_DEBITO','BIN');
        2:xAfiliacao := ObtemParametro('AFIL_CREDITO','PAGSEGURO');
        3:xAfiliacao := ObtemParametro('AFIL_PIX','PIX');
        6:xAfiliacao := ObtemParametro('AFIL_BANRICOMPRAS','PAGSEGURO');
        else xAfiliacao := 'PAGSEGURO';
      end;
      wData    := Copy(uDM.PedidosData.AsString,1,10);
      wData    := Copy(wData,1,6) + Copy(wData,9,2);
      wParm := '/tef /estornar ' +
               uDM.sysCPUId + ' ' +                                             // terminal
               xAfiliacao + ' ' +                                               // afiliacao
               FloatToStrF(uDM.PedDetpagValor.AsCurrency,ffFixed,15,2) + ' ' +  // valor
               Trim(uDM.PedDetpagCodAutorizacao.AsString) + ' ' +               // CodAutorizacao
               wData + ' ' +                                                    // data da autorização
               uDM.PedDetpagtPag.AsString + ' ' +                               // tipo de pagamento
               Trim(uDM.PedDetpagNroReferencia.AsString) + ' ' +                // Nro docto referenciado
               Trim(uDM.PedDetpagNSU.AsString);                                 // NSU
      //end
      {
      else begin        // Versao antiga
        lEstorna := False;
        if uDM.PedDetpagtPag.AsString = '03' then
          wTpCard := 'CREDITO'
        else
          wTpCard := 'DEBITO';
        wData    := Copy(uDM.PedidosData.AsString,1,10);
        wData    := Copy(wData,1,6) + Copy(wData,9,2);
        wVlrPago := FloatToStrF(uDM.PedDetpagValor.AsCurrency,ffFixed,15,2);
        wParm    := '/tef /cancelar ' +                        // Parametros iniciais
                    'PAGSEGURO ' +    //uDM.PedDetpagAfiliacao.AsString + ' ' +             // Afiliação
                    wVlrPago + ' ' +                                    // Valor do cartão
                    uDM.PedDetpagcAut.AsString + ' ' +                  // Autorização da operação
                    wData + ' ' +                                       // Data do ocorrido   (dd/mm/aa)
                    wTpCard + ' ' +                                     // CREDITO ou DEBITO
                    uDM.PedDetpagnrDocto.AsString + ' ' +               // Nro do documento (da transação do cartão)
                    wArqXML;                                            // Arquivo XML da NFCe
      end;
      }
      wParm := wParm + ' -as ' + wArqSai;                               // Arquivo saída específico de cancelamento de cartão
      if MessageDlg('Cancelamento de transação com cartão crédito/débito ou PIX' + #13#13 +
                    'Valor: ' + FloatToStrF(uDM.PedDetpagValor.AsCurrency,ffNumber,15,2) + #13#13 +
                    'Cartão: ' + uDM.PedDetpagZC_nrCartao.AsString + #1313 +
                    'Pedido: ' + uDM.PedidosNumero.AsString +
                    '   Seq: ' + uDM.PedDetpagSeq.AsString + #13#13 +
                    'Confirme',
                    mtConfirmation,[mbYes,mbNo],0,mbNo) = mrYes then
      begin
        DeleteFile(wArqSai);
        ShellExecute(0,'open',pChar(wCmdo),pChar(wParm),'',1);
        RetornoACNFe(wArqSai, tmpTimeOut, wRetorno, tmpExtra);
        if exibeRetorno = 'S' then
           ShowMessage('Retorno TEF' + #13 + wRetorno);
        uDM.PedDetpag.Edit;
        uDM.PedDetpagSit.AsInteger := 1;
        uDM.PedDetpag.Post;
      end;
    end;
    uDM.PedDetpag.Next;
  end;
  Result := True;

end;


Function CancelaNFCe(pExec:String): Boolean;
var wChave,wJustif,wCmdo,wParm,wRetorno: String;
begin
{
/CANCELARNF <chave_nfe> <just> [<-email email@xyz.com>] [<-as arq_saida>] [<-arqxml arq_xml>] [<-seq num_seq>] [<nroimp> N]
<chave_nfe>            Chave de 44 dígitos do NFe
<just>                 Justificativa do cancelamento do NFe
<-email email@xyz.com> Parâmetro opcional.
<-as arq_saida>        Arquivo de saída alternativo ao do ini
<-arqxml arq_xml>      Arquivo de entrada XML para a geração do DANFe.
<-seq num_seq>         Sequência do evento. Se não informado, será considerado 1\
<-nroimp N>            Nro de vezes que o documento será enviado para impressora
<-rav arqRAV>          Arquivo RAV do DANFe modelo para gerar o PDF
}
  Result := False;
  wArqXML := uDM.PedidosIdArqXML.AsString;
  if not FileExists(wArqXML) then
  begin
    MessageDlg('Arquivo XML não encontrado' + #13 + wArqXML + #13 +
               'Processo interrompido',mtError,[mbOk],0);
    Exit;
  end;

  wArqSai := ExtractFilePath(Application.ExeName) + 'wCanc.Txt';
  wChave  := uDM.PedidosChaveNFe.AsString;
  wJustif := ObtemParametro('JustifCancelamento');
  if wJustif = '' then
    wJustif := 'Cliente cancelou a compra';
  wCmdo    := pExec;                                     // Executável
  wParm    := '/CANCELARNF '+ wChave + ' "' + wJustif + '" -as ' + wArqSai + ' ' + wArqXML;
  if MessageDlg('Cancelamento de NFCe' + #13#13 +
                'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                '  Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                '  NFCe: ' + uDM.PedidosNrNFCe.AsString,
                 mtConfirmation,[mbYes,mbNo],0,mbNo) = mrYes
  then begin
    DeleteFile(wArqSai);
    ShellExecute(0,'open',pChar(wCmdo),pChar(wParm),'',1);
    RetornoACNFe(wArqSai, tmpTimeOut, wRetorno, tmpExtra);
    if exibeRetorno = 'S' then
       ShowMessage('Retorno NFCe' + #13 + wRetorno);
  end;
  Result := True;

end;


Procedure CancelaPedido;
begin
  uDM.Pedidos.Edit;
  uDM.PedidosSitPagto.AsInteger := 9;
  uDM.Pedidos.Post;
  // !!! Efetuar cancelamento no caixa....

end;


procedure TFuQueryPedidos.btConsultarClick(Sender: TObject);
var nRegs: Integer;
    xCampos,xTurno,xCaixa: String;
begin
  LabNRegs.Font.Size := 12;
  LabNRegs.Font.Style := [];
  LabNRegs.Font.Color := clWindowText;
  LabNRegs.Caption := '';
  xCampos := 'Turno, Numero, Placa, Valor, Data, MeioPagto, SitPagto, Origem, ' +
             'NomeCliente, NrEstacao ';
  if wNrTurno = 99999 then
    xTurno := 'Turno>0 '
  else
    xTurno := 'Turno=' + IntToStr(wNrTurno) + ' ';
  if rgCaixas.ItemIndex = 0 then
    xCaixa := 'NrEstacao>0 '
  else
    xCaixa := 'NrEstacao=' + IntToStr(rgCaixas.ItemIndex) + ' ';
  //
  FDQPedidos.SQL.Text := 'Select ' + xCampos +
                         'from com_pedido ' +
                         'where ' + xTurno + ' and ' + xCaixa;
  //
  FDQPedidos.Open;
  FDQPedidos.Last;
  FDQPedidos.First;         // .Last;
  nRegs := FDQPedidos.RecordCount;
  if nRegs > 0
  then LabNRegs.Caption := IntToStr(nRegs) + ' pedidos'
  else begin
    LabNRegs.Caption := 'Não há pedidos no turno indicado';
    LabNRegs.Font.Style := [fsBold];
    LabNRegs.Font.Color := clRed;
    LabNRegs.Font.Size := 14;
  end;
  //
  DbGrid1.Visible := True;
  FormResize(nil);
  //FDQPedidos.Refresh;
  btNothing.SetFocus;


end;

procedure TFuQueryPedidos.btAnteriorClick(Sender: TObject);
begin
  if wNrTurno > 1 then
    wNrTurno := wNrTurno - 1;
  edTurno.Text := IntToStr(wNrTurno);
  edTurnoExit(nil);

end;

procedure TFuQueryPedidos.btProximoClick(Sender: TObject);
begin
  wNrTurno := wNrTurno + 1;
  edTurno.Text := IntToStr(wNrTurno);
  edTurnoExit(nil);

end;

procedure TFuQueryPedidos.btAtualClick(Sender: TObject);
begin
  wNrTurno := uDM.turnoCorrente;
  edTurno.Text := IntToStr(wNrTurno);
  edTurnoExit(nil);

end;

procedure TFuQueryPedidos.btCancelarClick(Sender: TObject);
var nPgts: Integer;
    wMsg: String;
    lCancCartao,lCancNFCe: Boolean;
begin
  if FDQPedidos.RecordCount = 0 then Exit;
  if not uDM.Pedidos.FindKey([FDQPedidosNumero.AsInteger]) then
  begin
    MessageDlg('Pedido não localizado, cancelamento impossibilitado',mtError,[mbOk],0);
    Exit;
  end;
  //
  if uDM.PedidosSitPagto.AsInteger = 9 then
  begin
    MessageDlg('Pedido anteriormente cancelado',mtInformation,[mbOk],0);
    Exit;
  end;
  if uDM.PedidosSitPagto.AsInteger = 0 then
  begin
    if MessageDlg('Pedido pendente' + #13#13 + 'Excluir o pedido ?',
                  mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
    then begin
      uDM.Peddetpag.Refresh;
      uDM.PedDetpag.First;
      while uDM.PedDetpag.RecordCount > 0 do
        uDM.Peddetpag.Delete;
      uDM.PedItens.Refresh;
      uDM.PedItens.First;
      while uDM.PedItens.RecordCount > 0 do
        uDM.PedItens.Delete;
      uDM.Pedidos.Delete;
    end
    else begin
      uDM.Pedidos.Edit;
      uDM.PedidosSitPagto.AsInteger := 9;
      uDM.Pedidos.Post;
    end;
    FDQPedidos.Refresh;
    LabNRegs.Caption := IntToStr(FDQPedidos.RecordCount) + ' pedidos';
    Exit;
  end;
  //
  // Cancelamento do pedido
  //uDM.PedDetpag.Filtered := True;       // Somente tPag = '03' e '04' Filtro desativado
  nPgts := 0;
  uDM.PedDetpag.First;
  while not uDM.PedDetpag.Eof do
  begin
    if (uDM.PedDetpagtPag.AsString = '03') or
       (uDM.PedDetpagtPag.AsString = '04') then nPgts := nPgts + 1;
    uDM.Peddetpag.Next;
  end;
  wMsg  := '- Transação de cartão (';
  if nPgts > 0 then
    wMsg := wMsg + IntToStr(nPgts) + ' ocorrencias)' + #13
  else
    wMsg := wMsg + 'não houve)' + #13;
  if uDM.PedidosNrNFCe.AsInteger > 0 then
    wMsg := wMsg + '- NFCe: ' + uDM.PedidosNrNFCe.AsString + #13;
  wMsg := wMsg + '- Pedido' + #13#13;
  if MessageDlg('Confirme o cancelamento do pedido' + #13 +
                'Nro: ' + uDM.PedidosNumero.AsString +
                '  Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                wMsg,
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
  begin
    if nPgts > 0 then
       lCancCartao := CancelaCartao(wExecutavel)    // Cancela pagtos 03 e/ou 04
    else
       lCancCartao := True;     // Não há pagtos 03 e/ou 04
    // Transações de pagto canceladas ou inexistentes (03 -04)
    if lCancCartao then
    begin
      lCancNFCe := True;
      if uDM.PedidosNrNFCe.AsInteger > 0 then
        lCancNFCe := CancelaNFCe(wExecutavel);
      if lCancNFCe then
        CancelaPedido;
    end;
  end;
  FDQPedidos.Refresh;


end;

procedure TFuQueryPedidos.btEmitirNFCeClick(Sender: TObject);
var wArqXML,wArqSai,wParam: String;
    wIniName,wAbrir,wImprimir,wPDF,wTrans: String;
    wIniFile: TIniFile;
    wStatus: Boolean;
begin
  if FDQPedidos.RecordCount = 0 then Exit;
  if not uDM.Pedidos.FindKey([FDQPedidosNumero.AsInteger]) then
  begin
    MessageDlg('Pedido não localizado, emissão cancelada',mtError,[mbOk],0);
    Exit;
  end;
  //
  // Re-impressão do cupom
  if (uDM.PedidosNrNFCe.AsInteger > 0) and (uDM.PedidosIdArqXML.AsString <> '')
  then begin
    wArqXML := uDM.PedidosIdArqXML.AsString;
    wArqSai := ExtractFilePath(Application.ExeName) + 'wNFe.Txt';
    DeleteFile(wArqSai);
    wIniName  := ChangeFileExt(wExecutavel,'.Ini');
    wIniFile  := TIniFile.Create(wIniName);
    wAbrir    := wIniFile.ReadString('NFC','AbrirDANFE','');
    wImprimir := wIniFile.ReadString('NFC','ImprimirAuto','');
    wPDF      := wIniFile.ReadString('NFC','PathSalvarPDF','');
    wTrans    := wIniFile.ReadString('NFC','PathSalvar','');
    //
    wIniFile.WriteString('NFC','AbrirDANFE','N');
    wIniFile.WriteString('NFC','ImprimirAuto','S');
    wIniFile.WriteString('NFC','PathSalvarPDF',wTrans);
    //
    wParam := '/GERARDANFE ' + wArqXML + ' -as ' + wArqSai;   // + ' -nroimp 1';
    ShellExecute(0,'open',pChar(wExecutavel),pChar(wParam),'',1);
    sleep(2000);
    //
    wIniFile.WriteString('NFC','AbrirDANFE',wAbrir);
    wIniFile.WriteString('NFC','ImprimirAuto',wImprimir);
    wIniFile.WriteString('NFC','PathSalvarPDF',wPDF);
    wIniFile.WriteString('NFC','PathSalvar',wTrans);
    wIniFile.Free;
    Exit;
  end;
  // Geração da NFCe
  if MessageDlg('Geração / Emissão de NFCe' + #13 +
                'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                'Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                'Meio pagamento: ' + uDM.PedidosZC_MPExtenso.AsString,
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
  then EmiteNFCe(uDM.PedidosNumero.AsInteger, True, wStatus);

end;


procedure TFuQueryPedidos.btImprimirEtiquetasClick(Sender: TObject);
begin
  if MessageDlg('Emissão de etiquetas' + #13 +
                'Pedido: ' + FDQPedidosNumero.AsString + #13 +
                'Confirme a emissão das etiquetas do pedido',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
    EmiteEtiquetas(FDQPedidosNumero.AsInteger, 0, False);   // Imprime TODAS as etiquetas do pedido

end;

procedure TFuQueryPedidos.btImprimirPedidoClick(Sender: TObject);
begin
  if FDQPedidos.RecordCount = 0 then Exit;
  if ObtemParametro('PedidoTipoImpressao') = 'Txt' then
    ImprimePedidoLst(FDQPedidosNumero.AsInteger)
  else
    ImprimePedido(FDQPedidosNumero.AsInteger);    // Impressao normal

end;

procedure TFuQueryPedidos.btSairClick(Sender: TObject);
begin
  FDQPedidos.Close;
  FuQueryPedidos.Close;

end;

procedure TFuQueryPedidos.edTurnoExit(Sender: TObject);
begin
  wNrTurno := StrToIntDef(Trim(edTurno.Text),0);
  LabDatas.Caption := '';
  LabNRegs.Caption := '';
  if wNrTurno = 99999 then
    LabDatas.Caption := 'Todos os turnos'
  else begin
    if wNrTurno > uDM.turnoCorrente then
    begin
      wNrTurno := 0;
      MessageDlg('Turno [' + edTurno.Text + '] posterior ao turno corrente, reinforme',mtWarning,[mbOk],0);
      edTurno.Text := IntToStr(uDM.turnoCorrente);
      btNothing.SetFocus;
      Exit;
    end;
    if wNrTurno = 0 then
    begin
      FuQueryPedidos.Close;
      Exit;
    end;
    if not uDM.Turnos.FindKey([wNrTurno]) then
    begin
      MessageDlg('Turno não encontrado, reinforme',mtWarning,[mbOk],0);
      btNothing.SetFocus;
      Exit;
    end;
    LabDatas.Caption := uDM.TurnosZC_Datas.AsString;
  end;
  if dbGrid1.Visible then
    btConsultarClick(nil)
  else
    btConsultar.SetFocus;

end;

procedure TFuQueryPedidos.FDQPedidosCalcFields(DataSet: TDataSet);
begin
  case FDQPedidosMeioPagto.AsInteger of
    0:FDQPedidosZC_MeioPagto.AsString := 'Dinheiro';
    1:FDQPedidosZC_MeioPagto.AsString := 'C.Débito';
    2:FDQPedidosZC_MeioPagto.AsString := 'C.Crédito';
    3:FDQPedidosZC_MeioPagto.AsString := 'PIX';
    4:FDQPedidosZC_MeioPagto.AsString := 'Outros';
    5:FDQPedidosZC_MeioPagto.AsString := 'Misto';
    else FDQPedidosZC_MeioPagto.AsString := '***';
  end;
  case FDQPedidosSitPagto.AsInteger of
    0:FDQPedidosZC_SitPagto.AsString := 'Pendente';
    1:FDQPedidosZC_SitPagto.AsString := 'Pago';
    9:FDQPedidosZC_SitPagto.AsString := 'Cancelado';
    else FDQPedidosZC_SitPagto.AsString := FDQPedidosSitPagto.AsString;      // 2,3,4,5,6,7,8
  end;
  case FDQPedidosOrigem.AsInteger of
    0:FDQPedidosZC_Origem.AsString := '';
    1:FDQPedidosZC_Origem.AsString := 'WhatsApp';
    else FDQPedidosZC_Origem.AsString := '* ' + FDQPedidosOrigem.AsString + ' *';
  end;

end;

procedure TFuQueryPedidos.FormActivate(Sender: TObject);
begin
  if not lFTime then Exit;
  lFTime := False;
  rgCaixas.ItemIndex := uDM.sysNrCaixa;
  edTurno.Text := IntToStr(wNrTurno);
  edTurnoExit(nil);

end;

procedure TFuQueryPedidos.FormResize(Sender: TObject);
begin
  if FuQueryPedidos.Width < 1024 then FuQueryPedidos.Width := 1024;
  if FuQueryPedidos.Height < 600 then FuQueryPedidos.Height := 600;
  DBGrid1 := DefineGrid(DBGrid1,[0.05, 0.03, 0.06, 0.04, 0.08, 0.15, 0.09, 0.09, 0.09, 0.33], 9, 0);

end;

end.
