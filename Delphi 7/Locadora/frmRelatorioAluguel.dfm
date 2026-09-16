object frmRelatorioAluguel: TfrmRelatorioAluguel
  Left = 0
  Top = 0
  Caption = 'Relatório de Aluguéis'
  ClientHeight = 400
  ClientWidth = 600
  Position = poScreenCenter

  object qryRelatorio: TADOQuery
    SQL.Strings = (
      'SELECT C.Nome AS Cliente, F.Titulo AS Filme, ' +
      'A.data_apanha, A.data_entrega ' +
      'FROM Aluguel A ' +
      'INNER JOIN Cliente C ON A.Cliente_IdCliente = C.IdCliente ' +
      'INNER JOIN DVD D ON A.DVD_IdDVD = D.IdDVD ' +
      'INNER JOIN Filme F ON D.IdFilme = F.idFilme ' +
      'ORDER BY A.data_apanha DESC')
  end

  object dsRelatorio: TDataSource
    DataSet = qryRelatorio
  end

  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 585
    Height = 350
    DataSource = dsRelatorio
    ReadOnly = True
  end
end