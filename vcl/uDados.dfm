object uDM: TuDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 419
  Width = 648
  object FDC: TFDConnection
    Params.Strings = (
      'Database=speedfood'
      'User_Name=speedfood'
      'Password=speed@123'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 28
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 108
    Top = 12
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 236
    Top = 12
  end
  object Itens: TFDTable
    OnCalcFields = ItensCalcFields
    OnFilterRecord = ItensFilterRecord
    IndexFieldNames = 'Grupo;Codigo'
    Connection = FDC
    TableName = 'com_itens'
    Left = 32
    Top = 160
    object ItensGrupo: TIntegerField
      FieldName = 'Grupo'
      Origin = 'Grupo'
      Required = True
    end
    object ItensCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
    end
    object ItensDescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 80
    end
    object ItensDescrCompleta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DescrCompleta'
      Origin = 'DescrCompleta'
      Size = 1024
    end
    object ItensTamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Tamanho'
      Origin = 'Tamanho'
      Size = 12
    end
    object ItensUnidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Unidade'
      Origin = 'Unidade'
      Size = 5
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
      EditMask = '00.00.00.00;0; '
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
      DisplayFormat = '0.0000%'
      EditFormat = '0.0000'
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
    object ItensCodBarras: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CodBarras'
      Origin = 'CodBarras'
      Size = 25
    end
    object ItensAlteraPreco: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'AlteraPreco'
      Origin = 'AlteraPreco'
    end
    object ItenspMVAST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'pMVAST'
      Origin = 'pMVAST'
      DisplayFormat = '0.0000%'
      EditFormat = '0.0000'
      Precision = 8
      Size = 5
    end
    object ItensCorItem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CorItem'
      Origin = 'CorItem'
      Size = 10
    end
    object ItensZC_Grupo: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'ZC_Grupo'
      Size = 15
      Calculated = True
    end
    object ItensZC_AltPreco: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_AltPreco'
      Size = 1
      Calculated = True
    end
    object ItensZC_Key: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Key'
      Size = 5
      Calculated = True
    end
    object ItensZC_Cor: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Cor'
      Size = 3
      Calculated = True
    end
  end
  object DSItens: TDataSource
    DataSet = Itens
    Left = 76
    Top = 176
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
      EditMask = '00\.000\.000\/0000-00;0; '
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
    object SisPessoaibgecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ibgecidade'
      Origin = 'ibgecidade'
      Size = 8
    end
    object SisPessoacep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      EditMask = '00\.000\-999;0; '
      Size = 8
    end
    object SisPessoatelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      EditMask = '!\(99\)00000-0000;1; '
      Size = 14
    end
    object SisPessoawhatsapp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'whatsapp'
      Origin = 'whatsapp'
      EditMask = '!\(99\)0000-0000;1; '
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
    object SisPessoaValCertificado: TDateTimeField
      FieldName = 'ValCertificado'
    end
    object SisPessoaTecladoVirtual: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TecladoVirtual'
      Origin = 'TecladoVirtual'
    end
    object SisPessoaPathImagens: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PathImagens'
      Origin = 'PathImagens'
      Size = 200
    end
  end
  object PedWrk: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = PedWrkCalcFields
    Left = 540
    Top = 16
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
      Size = 24
    end
    object PedWrkCod01: TSmallintField
      FieldName = 'Cod01'
    end
    object PedWrkVlr01: TCurrencyField
      FieldName = 'Vlr01'
    end
    object PedWrkCod02: TSmallintField
      FieldName = 'Cod02'
    end
    object PedWrkVlr02: TCurrencyField
      FieldName = 'Vlr02'
    end
    object PedWrkCod03: TSmallintField
      FieldName = 'Cod03'
    end
    object PedWrkVlr03: TCurrencyField
      FieldName = 'Vlr03'
    end
    object PedWrkVlrTotal: TCurrencyField
      FieldName = 'VlrTotal'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object PedWrkTxtSem: TMemoField
      FieldName = 'TxtSem'
      BlobType = ftMemo
      Size = 10
    end
    object PedWrkTxtMais: TMemoField
      FieldName = 'TxtMais'
      BlobType = ftMemo
      Size = 10
    end
    object PedWrkTxtMenos: TMemoField
      FieldName = 'TxtMenos'
      BlobType = ftMemo
      Size = 10
    end
    object PedWrkAltPreco: TBooleanField
      FieldName = 'AltPreco'
    end
    object PedWrkCortado: TBooleanField
      FieldName = 'Cortado'
    end
    object PedWrkPrensado: TBooleanField
      FieldName = 'Prensado'
    end
    object PedWrkZC_Aviso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Aviso'
      Size = 1
      Calculated = True
    end
    object PedWrkZC_Extras: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ZC_Extras'
      Calculated = True
    end
  end
  object SPedWrk: TDataSource
    DataSet = PedWrk
    Left = 540
    Top = 64
  end
  object Pedidos: TFDTable
    OnCalcFields = PedidosCalcFields
    OnFilterRecord = PedidosFilterRecord
    IndexFieldNames = 'Numero'
    Connection = FDC
    TableName = 'speedfood.com_pedido'
    Left = 212
    Top = 144
    object PedidosNumero: TLongWordField
      FieldName = 'Numero'
      Origin = 'Numero'
      Required = True
    end
    object PedidosData: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'Data'
      Origin = '`Data`'
    end
    object PedidosCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 14
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 14
    end
    object PedidosLanctos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Lanctos'
      Origin = 'Lanctos'
    end
    object PedidosValor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Valor'
      Origin = 'Valor'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object PedidosNrNFCe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NrNFCe'
      Origin = 'NrNFCe'
    end
    object PedidosSrNFCe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SrNFCe'
      Origin = 'SrNFCe'
    end
    object PedidosMeioPagto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MeioPagto'
      Origin = 'MeioPagto'
    end
    object PedidosVlrReais: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrReais'
      Origin = 'VlrReais'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedidosVlrCDeb: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrCDeb'
      Origin = 'VlrCDeb'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedidosVlrCCred: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrCCred'
      Origin = 'VlrCCred'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedidosVlrPIX: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrPIX'
      Origin = 'VlrPIX'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedidosVlrOutros: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrOutros'
      Origin = 'VlrOutros'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedidosArqXML: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ArqXML'
      Origin = 'ArqXML'
      BlobType = ftMemo
    end
    object PedidosEtqImpressas: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'EtqImpressas'
      Origin = 'EtqImpressas'
    end
    object PedidosNomeCliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NomeCliente'
      Origin = 'NomeCliente'
      Size = 45
    end
    object PedidosVlrRecebido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrRecebido'
      Origin = 'VlrRecebido'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedidosVlrTroco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrTroco'
      Origin = 'VlrTroco'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedidosTurno: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Turno'
      Origin = 'Turno'
    end
    object PedidosPlaca: TStringField
      FieldName = 'Placa'
      Size = 10
    end
    object PedidosLctLanches: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LctLanches'
      Origin = 'LctLanches'
    end
    object PedidosLctBebidas: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LctBebidas'
      Origin = 'LctBebidas'
    end
    object PedidosZC_Impresso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Impresso'
      Size = 8
      Calculated = True
    end
    object PedidosZC_DataHora: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_DataHora'
      Size = 14
      Calculated = True
    end
    object PedidosZC_MeioPagto: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_MeioPagto'
      Size = 6
      Calculated = True
    end
    object PedidosZC_MPExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_MPExtenso'
      Size = 15
      Calculated = True
    end
    object PedidosZC_Senha: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Senha'
      Size = 15
      Calculated = True
    end
    object PedidosZC_NroLst: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_NroLst'
      Size = 3
      Calculated = True
    end
  end
  object DSPedidos: TDataSource
    DataSet = Pedidos
    Left = 260
    Top = 160
  end
  object DSPedItens: TDataSource
    DataSet = PedItens
    Left = 264
    Top = 224
  end
  object PedItens: TFDTable
    OnCalcFields = PedItensCalcFields
    IndexFieldNames = 'Numero;NrLcto'
    MasterSource = DSPedidos
    MasterFields = 'Numero'
    Connection = FDC
    TableName = 'speedfood.com_pedidoitem'
    Left = 212
    Top = 216
    object PedItensNumero: TIntegerField
      FieldName = 'Numero'
      Origin = 'Numero'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PedItensNrLcto: TIntegerField
      FieldName = 'NrLcto'
      Origin = 'NrLcto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PedItensTpProd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TpProd'
      Origin = 'TpProd'
    end
    object PedItensCodProd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CodProd'
      Origin = 'CodProd'
    end
    object PedItensQuant: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Quant'
      Origin = 'Quant'
    end
    object PedItensVlrUnitario: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrUnitario'
      Origin = 'VlrUnitario'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedItensCod01: TIntegerField
      FieldName = 'Cod01'
    end
    object PedItensVlr01: TBCDField
      FieldName = 'Vlr01'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object PedItensCod02: TIntegerField
      FieldName = 'Cod02'
    end
    object PedItensVlr02: TBCDField
      FieldName = 'Vlr02'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object PedItensCod03: TIntegerField
      FieldName = 'Cod03'
    end
    object PedItensVlr03: TBCDField
      FieldName = 'Vlr03'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object PedItensVlrTotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrTotal'
      Origin = 'VlrTotal'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object PedItensExtras: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Extras'
      Origin = 'Extras'
      FixedChar = True
      Size = 24
    end
    object PedItensObservacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Observacao'
      Origin = 'Observacao'
      Size = 1024
    end
    object PedItensEtqImpressa: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'EtqImpressa'
      Origin = 'EtqImpressa'
    end
    object PedItensAlteraPreco: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'AlteraPreco'
      Origin = 'AlteraPreco'
    end
    object PedItensVlrUnFiscal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrUnFiscal'
      Origin = 'VlrUnFiscal'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object PedItensTurno: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Turno'
      Origin = 'Turno'
    end
    object PedItensCortado: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'Cortado'
      Origin = 'Cortado'
    end
    object PedItensPrensado: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'Prensado'
      Origin = 'Prensado'
    end
    object PedItensTxtMais: TStringField
      FieldName = 'TxtMais'
      Size = 1024
    end
    object PedItensTxtSem: TStringField
      FieldName = 'TxtSem'
      Size = 1024
    end
    object PedItensTxtMenos: TStringField
      FieldName = 'TxtMenos'
      Size = 1024
    end
    object PedItensZC_Tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Tipo'
      Size = 3
      Calculated = True
    end
    object PedItensZC_Descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Descricao'
      Size = 120
      Calculated = True
    end
    object PedItensZC_PedLcto: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'ZC_PedLcto'
      Calculated = True
    end
    object PedItensZC_Impresso: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'ZC_Impresso'
      Size = 1
      Calculated = True
    end
    object PedItensZC_Tp: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Tp'
      Size = 1
      Calculated = True
    end
    object PedItensZC_PlacaLcto: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_PlacaLcto'
      Calculated = True
    end
    object PedItensZC_CodDescr: TStringField
      DisplayWidth = 120
      FieldKind = fkCalculated
      FieldName = 'ZC_CodDescr'
      Size = 120
      Calculated = True
    end
    object PedItensZC_SenhaLst: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'ZC_SenhaLst'
      Calculated = True
    end
    object PedItensZC_PrensCort: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_PrensCort'
      Size = 50
      Calculated = True
    end
  end
  object RegCaixa: TFDTable
    OnCalcFields = RegCaixaCalcFields
    IndexFieldNames = 'Turno'
    Connection = FDC
    TableName = 'speedfood.com_regcaixa'
    Left = 28
    Top = 252
    object RegCaixaTurno: TIntegerField
      FieldName = 'Turno'
      Origin = 'Turno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RegCaixaDtHrInicio: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DtHrInicio'
      Origin = 'DtHrInicio'
      EditMask = '!90/00/0000 90:00:00;1; '
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
    object RegCaixaQtd_CartaoDebito: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_CartaoDebito'
      Origin = 'Qtd_CartaoDebito'
    end
    object RegCaixaQtd_CartaoCredito: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_CartaoCredito'
      Origin = 'Qtd_CartaoCredito'
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
    object RegCaixaQtd_Misto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Misto'
      Origin = 'Qtd_Misto'
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
    object RegCaixaVlrPedidos: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrPedidos'
      Origin = 'VlrPedidos'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object RegCaixaQtdPedidos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QtdPedidos'
      Origin = 'QtdPedidos'
    end
    object RegCaixaZC_IniFim: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_IniFim'
      Size = 40
      Calculated = True
    end
    object RegCaixaZC_VlrEntradas: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ZC_VlrEntradas'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object RegCaixaZC_VlrSaidas: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ZC_VlrSaidas'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object RegCaixaZC_QtdEntradas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ZC_QtdEntradas'
      Calculated = True
    end
    object RegCaixaZC_QtdSaidas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ZC_QtdSaidas'
      Calculated = True
    end
  end
  object LctCaixa: TFDTable
    OnCalcFields = LctCaixaCalcFields
    IndexFieldNames = 'Turno;Sequencia'
    MasterSource = DSRegCaixa
    MasterFields = 'Turno'
    Connection = FDC
    TableName = 'speedfood.com_lctcaixa'
    Left = 28
    Top = 304
    object LctCaixaTurno: TIntegerField
      FieldName = 'Turno'
      Origin = 'Turno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LctCaixaSequencia: TIntegerField
      FieldName = 'Sequencia'
      Origin = 'Sequencia'
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
    object LctCaixaPgtReais: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PgtReais'
      Origin = 'PgtReais'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object LctCaixaPgtCDeb: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PgtCDeb'
      Origin = 'PgtCDeb'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object LctCaixaPgtCCred: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PgtCCred'
      Origin = 'PgtCCred'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object LctCaixaPgtPIX: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PgtPIX'
      Origin = 'PgtPIX'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object LctCaixaPgtOutros: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PgtOutros'
      Origin = 'PgtOutros'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object LctCaixaNroPedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NroPedido'
      Origin = 'NroPedido'
    end
    object LctCaixaDtHrLcto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DtHrLcto'
      Origin = 'DtHrLcto'
      Size = 45
    end
    object LctCaixaTipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Tipo'
      Origin = 'Tipo'
      FixedChar = True
      Size = 1
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
    object LctCaixaZC_DtHr: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_DtHr'
      Size = 14
      Calculated = True
    end
    object LctCaixaZC_Reais: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Reais'
      Size = 12
      Calculated = True
    end
    object LctCaixaZC_CDeb: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_CDeb'
      Size = 12
      Calculated = True
    end
    object LctCaixaZC_CCred: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_CCred'
      Size = 12
      Calculated = True
    end
    object LctCaixaZC_PIX: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_PIX'
      Size = 12
      Calculated = True
    end
    object LctCaixaZC_Outros: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Outros'
      Size = 12
      Calculated = True
    end
    object LctCaixaZC_SomaMP: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ZC_SomaMP'
      Calculated = True
    end
    object LctCaixaZC_OpAbrv: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_OpAbrv'
      Size = 3
      Calculated = True
    end
    object LctCaixaZC_MpAbrv: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_MpAbrv'
      Size = 3
      Calculated = True
    end
  end
  object DSRegCaixa: TDataSource
    DataSet = RegCaixa
    Left = 80
    Top = 256
  end
  object DSLctCaixa: TDataSource
    DataSet = LctCaixa
    Left = 84
    Top = 312
  end
  object DSSisPessoa: TDataSource
    DataSet = SisPessoa
    Left = 100
    Top = 80
  end
  object Parametros: TFDTable
    IndexFieldNames = 'Nome'
    Connection = FDC
    TableName = 'speedfood.sis_parametros'
    Left = 208
    Top = 80
    object ParametrosNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 32
    end
    object ParametrosDescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 120
    end
    object ParametrosValor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Valor'
      Origin = 'Valor'
      Size = 999
    end
    object Parametrossis_parametroscol: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sis_parametroscol'
      Origin = 'sis_parametroscol'
      Size = 45
    end
  end
  object ResVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = ResVendasCalcFields
    Left = 548
    Top = 140
    object ResVendasTpProd: TSmallintField
      FieldName = 'TpProd'
    end
    object ResVendasCodProd: TIntegerField
      FieldName = 'CodProd'
    end
    object ResVendasQuant: TIntegerField
      FieldName = 'Quant'
    end
    object ResVendasValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = ',0.00'
    end
    object ResVendasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object ResVendasZC_Cod: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Cod'
      Size = 5
      Calculated = True
    end
  end
  object SResVendas: TDataSource
    DataSet = ResVendas
    Left = 552
    Top = 192
  end
  object Usuarios: TFDTable
    IndexFieldNames = 'Nome'
    Connection = FDC
    TableName = 'speedfood.sis_usuarios'
    Left = 216
    Top = 312
    object UsuariosNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object UsuariosSenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Senha'
      Origin = 'Senha'
      Size = 6
    end
  end
end
