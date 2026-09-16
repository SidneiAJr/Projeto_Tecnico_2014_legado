object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 200
  ClientWidth = 400
  Position = poScreenCenter

  object lblNome: TLabel
    Left = 16
    Top = 16
    Width = 30
    Height = 13
    Caption = 'Nome:'
  end

  object edtNome: TEdit
    Left = 80
    Top = 16
    Width = 280
    Height = 21
    TabOrder = 0
  end

  object lblTelefone: TLabel
    Left = 16
    Top = 48
    Width = 45
    Height = 13
    Caption = 'Telefone:'
  end

  object edtTelefone: TEdit
    Left = 80
    Top = 48
    Width = 150
    Height = 21
    TabOrder = 1
  end

  object lblEndereco: TLabel
    Left = 16
    Top = 80
    Width = 50
    Height = 13
    Caption = 'Endereço:'
  end

  object edtEndereco: TEdit
    Left = 80
    Top = 80
    Width = 280
    Height = 21
    TabOrder = 2
  end

  object btnSalvar: TButton
    Left = 80
    Top = 120
    Width = 100
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end

  object btnCancelar: TButton
    Left = 200
    Top = 120
    Width = 100
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
end