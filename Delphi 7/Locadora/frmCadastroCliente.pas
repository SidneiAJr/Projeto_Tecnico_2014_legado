unit frmCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB;

type
  TfrmCadastroCliente = class(TForm)
    edtNome: TEdit;
    edtTelefone: TEdit;
    edtEndereco: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure SalvarCliente;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

uses frmLocadora;

procedure TfrmCadastroCliente.SalvarCliente;
var
  qryInsert: TADOQuery;
begin
  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Nome é obrigatório');
    Exit;
  end;

  qryInsert := TADOQuery.Create(nil);
  try
    qryInsert.Connection := frmLocadora.ADOConnection1;
    qryInsert.SQL.Text :=
      'INSERT INTO Cliente (Nome, Telefone, Endereco) VALUES (:Nome, :Telefone, :Endereco)';
    qryInsert.ParamByName('Nome').Value := edtNome.Text;
    qryInsert.ParamByName('Telefone').Value := edtTelefone.Text;
    qryInsert.ParamByName('Endereco').Value := edtEndereco.Text;
    qryInsert.ExecSQL;

    ShowMessage('Cliente cadastrado com sucesso!');
    ModalResult := mrOk;
  finally
    qryInsert.Free;
  end;
end;

procedure TfrmCadastroCliente.btnSalvarClick(Sender: TObject);
begin
  SalvarCliente;
end;

procedure TfrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.