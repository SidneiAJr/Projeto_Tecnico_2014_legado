unit frmCadastroFilme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB;

type
  TfrmCadastroFilme = class(TForm)
    edtTitulo: TEdit;
    edtCategoria: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure SalvarFilme;
  end;

var
  frmCadastroFilme: TfrmCadastroFilme;

implementation

{$R *.dfm}

uses frmLocadora;

procedure TfrmCadastroFilme.SalvarFilme;
var
  qryInsert: TADOQuery;
begin
  if Trim(edtTitulo.Text) = '' then
  begin
    ShowMessage('Título é obrigatório');
    Exit;
  end;

  qryInsert := TADOQuery.Create(nil);
  try
    qryInsert.Connection := frmLocadora.ADOConnection1;
    qryInsert.SQL.Text :=
      'INSERT INTO Filme (Titulo, Categoria) VALUES (:Titulo, :Categoria)';
    qryInsert.ParamByName('Titulo').Value := edtTitulo.Text;
    qryInsert.ParamByName('Categoria').Value := edtCategoria.Text;
    qryInsert.ExecSQL;

    ShowMessage('Filme cadastrado com sucesso!');
    ModalResult := mrOk;
  finally
    qryInsert.Free;
  end;
end;

procedure TfrmCadastroFilme.btnSalvarClick(Sender: TObject);
begin
  SalvarFilme;
end;

procedure TfrmCadastroFilme.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.