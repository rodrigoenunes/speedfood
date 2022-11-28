program SpeedFood;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FuPrincipal},
  uDados in 'uDados.pas' {uDM: TDataModule},
  uItens in 'uItens.pas' {FuItens},
  uGenericas in '..\..\UsoGeral\uGenericas.pas' {FGen},
  uCaixa in 'uCaixa.pas' {FuCaixa},
  uPedidos in 'uPedidos.pas' {FuPedidos},
  uTrataLanche in 'uTrataLanche.pas' {FuTrataLanche},
  uFinPedido in 'uFinPedido.pas' {FuFinPedido},
  uImpressoes in 'uImpressoes.pas' {FuImpressoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipal, FuPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFuPedidos, FuPedidos);
  Application.CreateForm(TFuTrataLanche, FuTrataLanche);
  Application.CreateForm(TFuFinPedido, FuFinPedido);
  Application.CreateForm(TFuImpressoes, FuImpressoes);
  Application.CreateForm(TFuImpressoes, FuImpressoes);
  //  Application.CreateForm(TFuCaixa, FuCaixa);
  //  Application.CreateForm(TuDM, uDM);

  Application.Run;

end.
