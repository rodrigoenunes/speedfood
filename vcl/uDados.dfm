object uDM: TuDM
  OldCreateOrder = False
  Height = 419
  Width = 648
  object FDC: TFDConnection
    Params.Strings = (
      'Database=speedfood'
      'User_Name=speedfood'
      'Password=speed@123'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 140
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 268
    Top = 16
  end
  object Itens: TFDTable
    OnCalcFields = ItensCalcFields
    IndexFieldNames = 'Grupo;Codigo'
    Connection = FDC
    TableName = 'com_itens'
    Left = 40
    Top = 144
    object ItensGrupo: TStringField
      FieldName = 'Grupo'
      Origin = 'Grupo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object ItensCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ItensDescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 80
    end
    object ItensDescrCompleta: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DescrCompleta'
      Origin = 'DescrCompleta'
      BlobType = ftMemo
    end
    object ItensTamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Tamanho'
      Origin = 'Tamanho'
      Size = 12
    end
    object ItensPreco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Preco'
      Origin = 'Preco'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object ItensNCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NCM'
      Origin = 'NCM'
      EditMask = '99.99.99.99;0; '
      Size = 8
    end
    object ItensCFOP: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP'
      Origin = 'CFOP'
    end
    object ItensCSOSN: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
    end
    object ItensCST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CST'
      Origin = 'CST'
    end
    object ItensCST_IPI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object ItensCST_PIS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
    end
    object ItensCST_COFINS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
    end
    object ItensPcReduz: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PcReduz'
      Origin = 'PcReduz'
      DisplayFormat = '0.00000%'
      EditFormat = '0.00000'
      Precision = 8
      Size = 5
    end
    object ItensAliqICMS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'AliqICMS'
      Origin = 'AliqICMS'
      DisplayFormat = '0.00%'
      EditFormat = '0.00'
      Precision = 5
      Size = 2
    end
    object ItensImagem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Imagem'
      Origin = 'Imagem'
      Size = 120
    end
    object ItensZC_Grupo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Grupo'
      Size = 12
      Calculated = True
    end
    object ItensZC_Key: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Key'
      Size = 5
      Calculated = True
    end
  end
  object DSItens: TDataSource
    DataSet = Itens
    Left = 84
    Top = 160
  end
  object SisPessoa: TFDTable
    IndexFieldNames = 'id'
    Connection = FDC
    TableName = 'speedfood.sis_pessoa'
    Left = 40
    Top = 80
    object SisPessoaid: TLongWordField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object SisPessoanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 120
    end
    object SisPessoafantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 120
    end
    object SisPessoacnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 14
    end
    object SisPessoaIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IE'
      Origin = 'IE'
    end
    object SisPessoalogradouro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 120
    end
    object SisPessoanro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nro'
      Origin = 'nro'
      Size = 45
    end
    object SisPessoacomplemento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 45
    end
    object SisPessoabairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 45
    end
    object SisPessoacidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 45
    end
    object SisPessoauf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object SisPessoaigbecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'igbecidade'
      Origin = 'igbecidade'
      Size = 8
    end
    object SisPessoacep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 8
    end
    object SisPessoatelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 14
    end
    object SisPessoawhatsapp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'whatsapp'
      Origin = 'whatsapp'
      Size = 14
    end
    object SisPessoaCSC_Homolog: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CSC_Homolog'
      Origin = 'CSC_Homolog'
      Size = 45
    end
    object SisPessoaCSC_Producao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CSC_Producao'
      Origin = 'CSC_Producao'
      Size = 45
    end
    object SisPessoaNSCertificado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NSCertificado'
      Origin = 'NSCertificado'
      Size = 45
    end
    object SisPessoaNrNFCe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NrNFCe'
      Origin = 'NrNFCe'
    end
    object SisPessoaSerieNFCe: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SerieNFCe'
      Origin = 'SerieNFCe'
      Size = 3
    end
  end
  object RegCaixa: TFDTable
    IndexFieldNames = 'Sequencia'
    MasterSource = DSItens
    Connection = FDC
    TableName = 'speedfood.com_regcaixa'
    Left = 40
    Top = 208
    object RegCaixaSequencia: TIntegerField
      FieldName = 'Sequencia'
      Origin = 'Sequencia'
      Required = True
    end
    object RegCaixaDtHrInicio: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DtHrInicio'
      Origin = 'DtHrInicio'
    end
    object RegCaixaDtHrFim: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DtHrFim'
      Origin = 'DtHrFim'
    end
    object RegCaixaSaldoInicial: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SaldoInicial'
      Origin = 'SaldoInicial'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaE_Dinheiro: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'E_Dinheiro'
      Origin = 'E_Dinheiro'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaE_CartaoCredito: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'E_CartaoCredito'
      Origin = 'E_CartaoCredito'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaE_CartaoDebito: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'E_CartaoDebito'
      Origin = 'E_CartaoDebito'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaE_PIX: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'E_PIX'
      Origin = 'E_PIX'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaE_Outros: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'E_Outros'
      Origin = 'E_Outros'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaE_Suprimento: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'E_Suprimento'
      Origin = 'E_Suprimento'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaS_Saidas: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'S_Saidas'
      Origin = 'S_Saidas'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaS_Sangria: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'S_Sangria'
      Origin = 'S_Sangria'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaSaldoFinal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SaldoFinal'
      Origin = 'SaldoFinal'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object RegCaixaQtd_Dinheiro: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Dinheiro'
      Origin = 'Qtd_Dinheiro'
    end
    object RegCaixaQtd_CartaoCredito: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_CartaoCredito'
      Origin = 'Qtd_CartaoCredito'
    end
    object RegCaixaQtd_CartaoDebito: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_CartaoDebito'
      Origin = 'Qtd_CartaoDebito'
    end
    object RegCaixaQtd_PIX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_PIX'
      Origin = 'Qtd_PIX'
    end
    object RegCaixaQtd_Outros: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Outros'
      Origin = 'Qtd_Outros'
    end
    object RegCaixaQtd_Suprimento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Suprimento'
      Origin = 'Qtd_Suprimento'
    end
    object RegCaixaQtd_Saidas: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Saidas'
      Origin = 'Qtd_Saidas'
    end
    object RegCaixaQtd_Sangria: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Sangria'
      Origin = 'Qtd_Sangria'
    end
  end
  object DSRegCaixa: TDataSource
    DataSet = RegCaixa
    Left = 84
    Top = 222
  end
  object LctCaixa: TFDTable
    OnCalcFields = LctCaixaCalcFields
    IndexFieldNames = 'SeqCaixa;DtHrLcto'
    Connection = FDC
    TableName = 'speedfood.com_lctcaixa'
    Left = 40
    Top = 272
    object LctCaixaSeqCaixa: TIntegerField
      FieldName = 'SeqCaixa'
      Origin = 'SeqCaixa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LctCaixaDtHrLcto: TDateTimeField
      FieldName = 'DtHrLcto'
      Origin = 'DtHrLcto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LctCaixaOperacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Operacao'
      Origin = 'Operacao'
    end
    object LctCaixaValor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Valor'
      Origin = 'Valor'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object LctCaixaMeioPgt: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MeioPgt'
      Origin = 'MeioPgt'
    end
    object LctCaixaNrCartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NrCartao'
      Origin = 'NrCartao'
      Size = 45
    end
    object LctCaixaSaldo: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Saldo'
      Origin = 'Saldo'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object LctCaixaHistorico: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Historico'
      Origin = 'Historico'
      Size = 120
    end
    object LctCaixaZC_Operacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Operacao'
      Size = 10
      Calculated = True
    end
    object LctCaixaZC_MeioPgt: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_MeioPgt'
      Size = 10
      Calculated = True
    end
  end
  object DSLctos: TDataSource
    DataSet = LctCaixa
    Left = 84
    Top = 288
  end
  object PedWrk: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 388
    Top = 20
    object PedWrkNumero: TIntegerField
      FieldName = 'Numero'
    end
    object PedWrkNrLcto: TSmallintField
      FieldName = 'NrLcto'
    end
    object PedWrkTpProd: TSmallintField
      FieldName = 'TpProd'
    end
    object PedWrkCodProd: TIntegerField
      FieldName = 'CodProd'
    end
    object PedWrkDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object PedWrkObserv: TMemoField
      FieldName = 'Observ'
      BlobType = ftMemo
      Size = 10
    end
    object PedWrkQuant: TSmallintField
      FieldName = 'Quant'
    end
    object PedWrkVlrUnit: TCurrencyField
      FieldName = 'VlrUnit'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkExtras: TStringField
      FieldName = 'Extras'
      Size = 12
    end
    object PedWrkVlrExt1: TCurrencyField
      FieldName = 'VlrExt1'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt2: TCurrencyField
      FieldName = 'VlrExt2'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt3: TCurrencyField
      FieldName = 'VlrExt3'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt4: TCurrencyField
      FieldName = 'VlrExt4'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt5: TCurrencyField
      FieldName = 'VlrExt5'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt6: TCurrencyField
      FieldName = 'VlrExt6'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt7: TCurrencyField
      FieldName = 'VlrExt7'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt8: TCurrencyField
      FieldName = 'VlrExt8'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt9: TCurrencyField
      FieldName = 'VlrExt9'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt10: TCurrencyField
      FieldName = 'VlrExt10'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt11: TCurrencyField
      FieldName = 'VlrExt11'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrExt12: TCurrencyField
      FieldName = 'VlrExt12'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkVlrTotal: TCurrencyField
      FieldName = 'VlrTotal'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkExcluir: TStringField
      FieldName = 'Excluir'
      Size = 12
    end
    object PedWrkTxtExtras: TMemoField
      FieldName = 'TxtExtras'
      BlobType = ftMemo
      Size = 10
    end
    object PedWrkTxtExclus: TMemoField
      FieldName = 'TxtExclus'
      BlobType = ftMemo
      Size = 10
    end
    object PedWrkFPagto: TSmallintField
      FieldName = 'FPagto'
    end
    object PedWrkReais: TCurrencyField
      FieldName = 'Reais'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkPIX: TCurrencyField
      FieldName = 'PIX'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkCCred: TCurrencyField
      FieldName = 'CCred'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkCDeb: TCurrencyField
      FieldName = 'CDeb'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkOutros: TCurrencyField
      FieldName = 'Outros'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkZC_Extra: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Extra'
      Size = 1
      Calculated = True
    end
    object PedWrkZC_Exclus: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Exclus'
      Size = 1
      Calculated = True
    end
    object PedWrkZC_Aviso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Aviso'
      Size = 1
      Calculated = True
    end
  end
  object SPedWrk: TDataSource
    DataSet = PedWrk
    Left = 448
    Top = 20
  end
end
