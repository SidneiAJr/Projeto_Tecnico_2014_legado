unit frmRelatorioAluguel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmRelatorioAluguel = class(TForm)
    qryRelatorio: TADOQuery;
    dsRelatorio: TDataSource;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioAluguel: TfrmRelatorioAluguel;

implementation

{$R *.dfm}

uses frmLocadora;

end.