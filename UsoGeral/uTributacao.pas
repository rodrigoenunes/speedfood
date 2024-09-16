unit uTributacao;

interface

uses
  SysUtils, Classes, DB, DBTables;
  Function TributacaoIBPT(pTpInfo:String;
                          pCodigoNCM:String;
                          pDataBaseName: String;
                          var pFedNacional: Real;
                          var pFedImportado: Real;
                          var pEstadual: Real;
                          var pMunicipal: Real;
                          var pVigIni: TDateTime;
                          var pVigFin: TDateTime): Boolean;

type
  TDMTributacao = class(TDataModule)
    TbNCM: TTable;
    TbNCMTpInfo: TStringField;
    TbNCMNCM: TStringField;
    TbNCMExTIPI: TStringField;
    TbNCMTipo: TStringField;
    TbNCMDescricao: TStringField;
    TbNCMFedNacional: TBCDField;
    TbNCMFedImportado: TBCDField;
    TbNCMEstadual: TBCDField;
    TbNCMMunicipal: TBCDField;
    TbNCMInicioVig: TDateField;
    TbNCMFinalVig: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTributacao: TDMTributacao;

implementation

{$R *.dfm}

Function TributacaoIBPT(pTpInfo:String;                      // 0-Produtos(NCM); 1-Servi�os(NBS); 2-Servicos(4 digitios)
                        pCodigoNCM:String;                   // C�digo NCM, NBS ou 4Dig utilizado
                        pDataBaseName: String;               // DatabaseName...
                        var pFedNacional: Real;              // Tributa��o Federal produtos/servi�os nacionais (%)
                        var pFedImportado: Real;             // Tributa��o Federal produtos/servi�os importados (%)
                        var pEstadual: Real;                 // Tributa��o Estadual (%)
                        var pMunicipal: Real;                // Tributa��o Municipal (%)
                        var pVigIni: TDateTime;              // Data inicio vigencia
                        var pVigFin: TDateTime): Boolean;    // Data final vigencia
begin
  Result        := False;
  pFedNacional  := 0;
  pFedImportado := 0;
  pEstadual     := 0;
  pMunicipal    := 0;
  pVigIni       := Date;
  pVigFin       := Date;
  DMTributacao  := TDMTributacao.Create(nil);
  with DMTributacao
  do begin
    TbNCM.DatabaseName := pDataBaseName;
    TbNCM.IndexName    := 'KeyInfoNCM';
    Try
      TbNCM.Active := True;
      Result       := True;
    Except
    End;
    //
    if Result
    then if TbNCM.FindKey([pTpInfo,pCodigoNCM])
         then begin
           pFedNacional  := TbNCMFedNacional.AsFloat;
           pFedImportado := TbNCMFedImportado.AsFloat;
           pEstadual     := TbNCMEstadual.AsFloat;
           pMunicipal    := TbNCMMunicipal.AsFloat;
           pVigIni       := TbNCMInicioVig.AsDateTime;
           pVigFin       := TbNCMFinalVig.AsDateTime;
         end
         else Result := False;
    //
    TbNCM.Active := False;
  end;
  DMTributacao.Free;

end;





  //




end.
