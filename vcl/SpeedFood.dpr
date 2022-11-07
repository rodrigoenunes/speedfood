program SpeedFood;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FuPrincipal},
  uDados in 'uDados.pas' {uDM: TDataModule},
  uItens in 'uItens.pas' {FuItens},
  uGenericas in '..\..\UsoGeral\uGenericas.pas' {FGen},
  uCaixa in 'uCaixa.pas' {FuCaixa},
  uPedidos in 'uPedidos.pas' {FuPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipal, FuPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFuPedidos, FuPedidos);
  //  Application.CreateForm(TFuCaixa, FuCaixa);
  //  Application.CreateForm(TuDM, uDM);

  Application.Run;

end.
