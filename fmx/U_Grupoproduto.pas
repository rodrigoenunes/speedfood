unit U_Grupoproduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Controls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.Layouts,
  Fmx.Bind.Navigator, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFGrupoproduto = class(TForm)
    Grid1: TGrid;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoproduto: TFGrupoproduto;

implementation

{$R *.fmx}

uses U_Dm;

end.
