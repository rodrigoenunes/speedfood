program SFEtiquetas;

uses
  Vcl.Forms,
  SFEuPrincipal in 'SFEuPrincipal.pas' {FuPrincipalEtq},
  uDados in '..\vcl\uDados.pas' {uDM: TDataModule},
  uGenericas in '..\..\UsoGeral\uGenericas.pas' {FGen},
  SFEuPrintFortes in 'SFEuPrintFortes.pas' {FSFEuPrintFortes},
  FortesReportCtle in '..\..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  EnviaEMail in '..\..\uFortesReport\EnviaEMail.pas' {FEnviaEMail},
  uSysPrinters in '..\..\UsoGeral\uSysPrinters.pas' {FuSysPrinters};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipalEtq, FuPrincipalEtq);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.CreateForm(TFEnviaEMail, FEnviaEMail);
  Application.CreateForm(TFuSysPrinters, FuSysPrinters);
  //Application.CreateForm(TFSFEuPrintFortes, FSFEuPrintFortes);
  Application.Run;
end.
