unit frmLocadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls,
  frmCadastroCliente, frmRelatorioAluguel;

type
  TfrmLocadora = class(TForm)
    ADOConnection1: TADOConnection;
    qryClientes: TADOQuery;
    dsClientes: TDataSource;
    DBGrid1: TDBGrid;
    btnCarregarClientes: TButton;
    btnAluguelCliente: TButton;
    btnCadastrarCliente: TButton;
    btnRelatorio: TButton;
    procedure btnCarregarClientesClick(Sender: TObject);
    procedure btnAluguelClienteClick(Sender: TObject);
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    procedure CarregarClientes;
    procedure MostrarAlugueisCliente(IdCliente: Integer);
  public
    { Public declarations }
  end;

var
  frmLocadora: TfrmLocadora;

implementation

{$R *.dfm}

procedure TfrmLocadora.CarregarClientes;
begin
  qryClientes.Close;
  qryClientes.Open;
end;

procedure TfrmLocadora.btnCarregarClientesClick(Sender: TObject);
begin
  CarregarClientes;
end;

procedure TfrmLocadora.MostrarAlugueisCliente(IdCliente: Integer);
var
  FormAluguel: TForm;
  DBGridAluguel: TDBGrid;
  dsAluguel: TDataSource;
  qryAluguel: TADOQuery;
begin
  FormAluguel := TForm.Create(nil);
  try
    FormAluguel.Caption := 'Aluguéis do Cliente';
    FormAluguel.Width := 600;
    FormAluguel.Height := 400;
    FormAluguel.Position := poScreenCenter;

    qryAluguel := TADOQuery.Create(FormAluguel);
    qryAluguel.Connection := ADOConnection1;
    qryAluguel.SQL.Text :=
      'SELECT A.data_apanha, A.data_entrega, F.Titulo, F.Categoria ' +
      'FROM Aluguel A ' +
      'INNER JOIN DVD D ON A.DVD_IdDVD = D.IdDVD ' +
      'INNER JOIN Filme F ON D.IdFilme = F.idFilme ' +
      'WHERE A.Cliente_IdCliente = :IdCliente';
    qryAluguel.ParamByName('IdCliente').Value := IdCliente;
    qryAluguel.Open;

    dsAluguel := TDataSource.Create(FormAluguel);
    dsAluguel.DataSet := qryAluguel;

    DBGridAluguel := TDBGrid.Create(FormAluguel);
    DBGridAluguel.Parent := FormAluguel;
    DBGridAluguel.Align := alClient;
    DBGridAluguel.DataSource := dsAluguel;

    FormAluguel.ShowModal;
  finally
    FormAluguel.Free;
  end;
end;

procedure TfrmLocadora.btnAluguelClienteClick(Sender: TObject);
var
  IdSelecionado: Integer;
begin
  if qryClientes.IsEmpty then
  begin
    ShowMessage('Selecione um cliente primeiro');
    Exit;
  end;

  IdSelecionado := qryClientes.FieldByName('IdCliente').AsInteger;
  MostrarAlugueisCliente(IdSelecionado);
end;

procedure TfrmLocadora.btnCadastrarClienteClick(Sender: TObject);
var
  frmCadastro: TfrmCadastroCliente;
begin
  frmCadastro := TfrmCadastroCliente.Create(nil);
  try
    frmCadastro.ShowModal;
    CarregarClientes; // recarrega após cadastro
  finally
    frmCadastro.Free;
  end;
end;

procedure TfrmLocadora.btnRelatorioClick(Sender: TObject);
var
  frmRel: TfrmRelatorioAluguel;
begin
  frmRel := TfrmRelatorioAluguel.Create(nil);
  try
    frmRel.ShowModal;
  finally
    frmRel.Free;
  end;
end;

end.