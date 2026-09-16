object frmLocadora: TfrmLocadora
  Left = 0
  Top = 0
  Caption = 'Locadora 2015 - Sistema de Aluguel'
  ClientHeight = 480
  ClientWidth = 640
  Position = poScreenCenter

  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB;Data Source=.\SQLEXPRESS;Initial Catalog=Locadora;Integrated Security=SSPI;'
    LoginPrompt = False
    Provider = 'SQLOLEDB'
  end

  object qryClientes: TADOQuery
    Connection = ADOConnection1
    SQL.Strings = (
      'SELECT IdCliente, Nome, Telefone, Endereco FROM Cliente ORDER BY Nome')
  end

  object dsClientes: TDataSource
    DataSet = qryClientes
  end

  object DBGrid1: TDBGrid
    Left = 16
    Top = 40
    Width = 601
    Height = 160
    DataSource = dsClientes
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    ReadOnly = True
  end

  object btnCarregarClientes: TButton
    Left = 16
    Top = 216
    Width = 120
    Height = 25
    Caption = 'Carregar Clientes'
    TabOrder = 0
    OnClick = btnCarregarClientesClick
  end

  object btnAluguelCliente: TButton
    Left = 150
    Top = 216
    Width = 120
    Height = 25
    Caption = 'Aluguéis do Cliente'
    TabOrder = 1
    OnClick = btnAluguelClienteClick
  end

  object btnCadastrarCliente: TButton
    Left = 284
    Top = 216
    Width = 120
    Height = 25
    Caption = 'Cadastrar Cliente'
    TabOrder = 2
    OnClick = btnCadastrarClienteClick
  end

  object btnRelatorio: TButton
    Left = 418
    Top = 216
    Width = 120
    Height = 25
    Caption = 'Relatório de Aluguéis'
    TabOrder = 3
    OnClick = btnRelatorioClick
  end
end