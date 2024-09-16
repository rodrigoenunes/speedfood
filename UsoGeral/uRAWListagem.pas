unit uRAWListagem;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Printers, Winspool, ExtCtrls;
  Procedure ListaRelatorio(pArqName:String; pCopies:Integer; pExcluir,pNovaPag,pExibir:Boolean);

type
  TFuRAWListagem = class(TForm)
    LabArqRelat: TLabel;
    Panel1: TPanel;
    btListar: TBitBtn;
    btCancelar: TBitBtn;
    cbDelete: TCheckBox;
    cbCopias: TComboBox;
    Label1: TLabel;
    CbEject: TCheckBox;
    procedure btCancelarClick(Sender: TObject);
    procedure btListarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuRAWListagem: TFuRAWListagem;

const
  WCtles: array[0..3] of String = (#13,
                                   #13+#10,
                                   #13+#10+#13+#10,
                                   #13+#10+#13+#10+#13+#10);


implementation

{$R *.DFM}

// Imprime arquivo de texto do sistema...
// Tamanhos variáveis, com controles

Procedure ListaRelatorio(pArqRelatorio:String; pCopias:Integer; pExcluir,pNovaPag,pExibir:Boolean);
var i: Integer;
begin
  if not FileExists(pArqRelatorio)
  then begin
    MessageDlg('Arquivo inexistente' + #13 +
               '[ ' + pArqRelatorio + ' ] ' + #13 +
               'Impressão impossibilitada',
               mtError,[mbOk],0);
    Exit;
  end;
  if pCopias < 1
     then pCopias := 1;
  if pCopias > 99
     then pCopias := 99;
  FuRAWListagem  := TFuRAWListagem.Create(nil);
  with FuRAWListagem
  do begin
    cbCopias.Items.Clear;
    for i := 1 to 99
      do cbCopias.ItemIndex := IntToStr(i);
    cbCopias.ItemIndex  := pCopias-1;
    cbDelete.Checked    := pExcluir;
    cbEject.Checked     := pNovaPag;
    LabArqRelat.Caption := pArqRelat;
    if pExibir
    then begin
      Width  := LabArqRelat.Width + 48;
      if Width < 302
         then Width := 302;
      ShowModal;
    end
    else btListarClick(nil);
  end;
  FuRAWListagem.Free;

end;


procedure TFuRAWListagem.btCancelarClick(Sender: TObject);
begin
  FuRAWListagem.Close;

end;


procedure TFuRAWListagem.btListarClick(Sender: TObject);
var IdPrinter,PortPrinter: String;
    nCopias,i,j,k:  Integer;
    DocInfo1: TDocInfo1;
    Handle: THandle;
    xRelat: String;
    txtArq: TextFile;
    wConteudo: TStringList;
    Linha,xCtle: String;
    nCtle: Integer;
    N: dWord;
begin
  if not SelecionaImpressora(IdPrinter, PortPrinter)
  then begin
    btCancelarClick(nil);
    Exit;
  end;
  if not(OpenPrinter(PChar(idPrinter),Handle,nil))
  then begin
    MessageDlg('Erro ' + IntToStr(GetLastError) + #13 +
               'Não é possível imprimir',mtError,[mbOk],0);
    Exit;
  end;
  //
  xRelat    := ExtractFileName(FuRAWListagem.LabArqRelat.Caption);
  nCopias   := StrToIntDef(Trim(CbCopias.Text),1);
  wConteudo := TStringList.Create;
  wConteudo.LoadFromFile(FuRAWListagem.LabArqRelat.Caption);
  for i := 1 to nCop
  do begin
    with DocInfo1 do
    begin
      PDocName    := PChar(xRelat + '-' + IntToStr(i));
      POutPutFile := nil;
      PDataType   := 'RAW';
    end;
    StartDocPrinter(Handle,1,@DocInfo1);
    StartPagePrinter(Handle);
    AssignFile(txtArq,xArq);
    Reset(txtArq);
    //
    for j := 0 to wConteudo.Count-1
    do begin
      Linha  := wConteudo[j];
      if Length(Linha) = 0 then Lista := False
      else begin
        nCtle := -1;
        for k := 0 to 9
        do begin
          xCtle := '#' + IntToStr(k) + '#';
          if Pos(xCtle,Linha) > 0
          then begin
            nCtle := k;
            Break;
          end;
        end;
        if nCtle < 0
           then nCtle := 1                 // Sem controle, é o mesmo que espaço simples
           else Delete(Linha,1,3);         // Houve controle, retira o ctle da linha
        Linha := Linha + #13;              // Somente CR
        for k := 1 to nCtle
          do Linha := Linha + #10;         // LineFeed (de 1 a 9)
        WritePrinter(Handle,PChar(Linha),Length(Linha),N);
      end;
    end;
    if CbEject.Checked then Linha := chr(12)
                       else Linha := ' ';
    WritePrinter(Handle,PChar(Linha),Length(Linha),N);
    EndPagePrinter(Handle);
    EndDocPrinter(Handle);
    ClosePrinter(Handle);
    CloseFile(Arq);
  end;
  if CbDelete.Checked
     then DeleteFile(FuRAWListagem.LabArqRelat.Caption);
  FuRAWListagem.Close;

end;


procedure TFuRAWListagem.FormCreate(Sender: TObject);
begin
  Top  := (Screen.Height - Height) div 2;
  Left := (Screen.Width - Width) div 2;

end;

end.
