object frmCadastroFilme: TfrmCadastroFilme
  Left = 0
  Top = 0
  Caption = 'Cadastro de Filme'
  ClientHeight = 240
  ClientWidth = 400
  Position = poScreenCenter

  object lblTitulo: TLabel
    Left = 16
    Top = 16
    Width = 35
    Height = 13
    Caption = 'Título:'
  end

  object edtTitulo: TEdit
    Left = 80
    Top = 16
    Width = 280
    Height = 21
    TabOrder = 0
  end

  object lblCategoria: TLabel
    Left = 16
    Top = 48
    Width = 55
    Height = 13
    Caption = 'Categoria:'
  end

  object edtCategoria: TEdit
    Left = 80
    Top = 48
    Width = 200
    Height = 21
    TabOrder = 1
  end

  object btnSalvar: TButton
    Left = 80
    Top = 120
    Width = 100
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
  end

  object btnCancelar: TButton
    Left = 200
    Top = 120
    Width = 100
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end