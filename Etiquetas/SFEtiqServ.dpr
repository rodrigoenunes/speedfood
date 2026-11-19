program SFEtiqServ;

uses
  Vcl.Forms,
  SFuEtiqPrincipal in 'SFuEtiqPrincipal.pas' {FuEtiqPrincipal},
  uGenericas in '..\..\UsoGeral\uGenericas.pas' {FGen},
  uDados in '..\vcl\uDados.pas' {uDM: TDataModule},
  FortesReportCtle in '..\..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  SFEuPrintFortes in 'SFEuPrintFortes.pas' {FSFEuPrintFortes},
  uSysPrinters in '..\..\UsoGeral\uSysPrinters.pas' {FuSysPrinters};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuEtiqPrincipal, FuEtiqPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.Run;

end.
