unit uSaboresV2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CheckLst;
  Function ObtemSaborDrink(pmtDrink,pmtTxtSabores:String): String;

type
  TFuSaboresV2 = class(TForm)
    LabDrink: TLabel;
    LabInstrucoes: TLabel;
    LabSaborRetorno: TLabel;
    lstSabores: TListBox;
    procedure FormShow(Sender: TObject);
    procedure lstSaboresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuSaboresV2: TFuSaboresV2;
  wSaborRetorno: String;

implementation

{$R *.dfm}

Function ObtemSaborDrink(pmtDrink,pmtTxtSabores:String): String;
var wTxtSabores,wSabor: String;
    nP,nSabores: Integer;
begin
  Result := '';
  if pmtTxtSabores = '' then
    Exit;
  //
  with FuSaboresV2 do
  begin
    Caption := 'Sabores de drinks';
    LabDrink.Caption := stringReplace(pmtDrink,'#','',[rfIgnoreCase, rfReplaceAll]);
    lstSabores.Items.Clear;
    wTxtSabores := stringReplace(pmtTxtSabores,'#','',[rfIgnoreCase, rfReplaceAll]);
    nP := Pos(wTxtSabores,#13);
    if nP > 0 then
      wTxtSabores := Copy(wTxtSabores,1,nP-1);
    nP := Pos(';',wTxtSabores);
    while nP > 0 do
    begin
      wSabor := Copy(wTxtSabores,1,nP-1);
      lstSabores.Items.Add(Trim(wSabor));
      wTxtSabores := Copy(wTxtSabores,nP+1,Length(wTxtSabores)-nP);
      nP := Pos(';',wTxtSabores);
    end;
    if wTxtSabores <> '' then
      lstSabores.Items.Add(Trim(wTxtSabores));
    //
    nSabores := lstSabores.Items.Count;
    if nSabores > 8 then
      nSabores := 8;
    ClientHeight := nSabores * 49 + 82;
    wSaborRetorno := '';
    while wSaborRetorno = '' do
    begin
      ShowModal;
      if wSaborRetorno = '' then
        MessageDlg('Informação de sabor é OBRIGATÓRIA',mtError,[mbOk],0);
    end;
    Result := wSaborRetorno;

  end;

end;

procedure TFuSaboresV2.FormShow(Sender: TObject);
begin
  LabInstrucoes.Caption := 'Indique o sabor';
  wSaborRetorno := '';
  lstSabores.ItemIndex := -1;

end;

procedure TFuSaboresV2.lstSaboresClick(Sender: TObject);
begin
  if lstSabores.ItemIndex >= 0 then
  begin
    LabSaborRetorno.Caption := lstSabores.Items[lstSabores.ItemIndex];
    wSaborRetorno := lstSabores.Items[lstSabores.ItemIndex];
    FuSaboresV2.Close;
  end;

end;

end.
