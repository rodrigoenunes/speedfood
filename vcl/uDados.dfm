object uDM: TuDM
  OnCreate = DataModuleCreate
  Height = 427
  Width = 771
  object FDC: TFDConnection
    Params.Strings = (
      'Database=speedfood'
      'User_Name=speedfood'
      'Password=speed@123'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    ConnectedStoredUsage = []
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
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'speedfood.com_itens'
    Left = 24
    Top = 144
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
    object ItensEtiqueta: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'Etiqueta'
      Origin = 'Etiqueta'
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
    object ItensZC_Etiqueta: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Etiqueta'
      Size = 1
      Calculated = True
    end
  end
  object DSItens: TDataSource
    DataSet = Itens
    Left = 68
    Top = 160
  end
  object SisPessoa: TFDTable
    IndexFieldNames = 'id'
    Connection = FDC
    TableName = 'speedfood.sis_pessoa'
    Left = 44
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
    object SisPessoaTefPos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TefPos'
      Origin = 'TefPos'
    end
  end
  object PedWrk: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = PedWrkCalcFields
    Left = 472
    Top = 20
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
      Size = 100
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
    object PedWrkEtqImpressa: TSmallintField
      FieldName = 'EtqImpressa'
    end
    object PedWrkPeso: TIntegerField
      FieldName = 'Peso'
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
    Left = 472
    Top = 68
  end
  object Pedidos: TFDTable
    OnCalcFields = PedidosCalcFields
    OnFilterRecord = PedidosFilterRecord
    IndexFieldNames = 'Numero'
    Connection = FDC
    ResourceOptions.AssignedValues = [rvEscapeExpand]
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
    object PedidosTpIntegra: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TpIntegra'
      Origin = 'TpIntegra'
    end
    object PedidosSitPagto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SitPagto'
      Origin = 'SitPagto'
    end
    object PedidosIdArqXML: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IdArqXML'
      Origin = 'IdArqXML'
      Size = 255
    end
    object PedidosChaveNFe: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ChaveNFe'
      Origin = 'ChaveNFe'
      Size = 44
    end
    object PedidosOrigem: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'Origem'
      Origin = 'Origem'
    end
    object PedidosIdEstacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IdEstacao'
      Origin = 'IdEstacao'
      Size = 45
    end
    object PedidosNrEstacao: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'NrEstacao'
      Origin = 'NrEstacao'
    end
    object PedidosLctCrepes: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LctCrepes'
      Origin = 'LctCrepes'
    end
    object PedidosLctBuffet: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LctBuffet'
      Origin = 'LctBuffet'
    end
    object PedidosLctOutros: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LctOutros'
      Origin = 'LctOutros'
    end
    object PedidosLctDiversos: TIntegerField
      FieldName = 'LctDiversos'
    end
    object PedidosLctFrituras: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LctFrituras'
      Origin = 'LctFrituras'
    end
    object PedidosLctHamburgueres: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LctHamburgueres'
      Origin = 'LctHamburgueres'
    end
    object PedidosParaLevar: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'ParaLevar'
      Origin = 'ParaLevar'
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
    object PedidosZC_SitPagto: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_SitPagto'
      Size = 1
      Calculated = True
    end
    object PedidosZC_SitTxt: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_SitTxt'
      Size = 10
      Calculated = True
    end
    object PedidosZC_Origem: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Origem'
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
    ResourceOptions.AssignedValues = [rvEscapeExpand]
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
      Size = 100
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
    object PedItensSeqLcto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SeqLcto'
      Origin = 'SeqLcto'
    end
    object PedItensPeso: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Peso'
      Origin = 'Peso'
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
    object PedItensZC_SeqLcto: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_SeqLcto'
      Size = 2
      Calculated = True
    end
    object PedItensZC_TpEtiq: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_TpEtiq'
      Size = 30
      Calculated = True
    end
  end
  object RegCaixa: TFDTable
    OnCalcFields = RegCaixaCalcFields
    OnFilterRecord = RegCaixaFilterRecord
    IndexFieldNames = 'Turno'
    Connection = FDC
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'speedfood.com_regcaixa'
    Left = 28
    Top = 292
    object RegCaixaTurno: TIntegerField
      FieldName = 'Turno'
      Origin = 'Turno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RegCaixaNrCaixa: TIntegerField
      FieldName = 'NrCaixa'
      Origin = 'NrCaixa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RegCaixaCaixaSeq: TIntegerField
      FieldName = 'CaixaSeq'
      Origin = 'CaixaSeq'
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
    object RegCaixaSituacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Situacao'
      Origin = 'Situacao'
      FixedChar = True
      Size = 1
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
    object RegCaixaVlrRecebDiv: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrRecebDiv'
      Origin = 'VlrRecebDiv'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object RegCaixaQtdRecebDiv: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QtdRecebDiv'
      Origin = 'QtdRecebDiv'
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
    object RegCaixaZC_Situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Situacao'
      Size = 10
      Calculated = True
    end
    object RegCaixaZC_CaixaNrSeq: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_CaixaNrSeq'
      Size = 15
      Calculated = True
    end
  end
  object LctCaixa: TFDTable
    OnCalcFields = LctCaixaCalcFields
    OnFilterRecord = LctCaixaFilterRecord
    IndexFieldNames = 'NrCaixa'
    MasterSource = DSRegCaixa
    MasterFields = 'NrCaixa;CaixaSeq'
    Connection = FDC
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'speedfood.com_lctcaixa'
    Left = 28
    Top = 344
    object LctCaixaNrCaixa: TIntegerField
      FieldName = 'NrCaixa'
      Origin = 'NrCaixa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LctCaixaCaixaSeq: TIntegerField
      FieldName = 'CaixaSeq'
      Origin = 'CaixaSeq'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LctCaixaLctoSeq: TIntegerField
      FieldName = 'LctoSeq'
      Origin = 'LctoSeq'
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
    object LctCaixaDtHrLcto: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DtHrLcto'
      Origin = 'DtHrLcto'
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
    Top = 296
  end
  object DSLctCaixa: TDataSource
    DataSet = LctCaixa
    Left = 84
    Top = 352
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
  end
  object ResumoVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = ResumoVendasCalcFields
    Left = 480
    Top = 144
    object ResumoVendasTpProd: TSmallintField
      FieldName = 'TpProd'
    end
    object ResumoVendasCodProd: TIntegerField
      FieldName = 'CodProd'
    end
    object ResumoVendasQuant: TIntegerField
      FieldName = 'Quant'
    end
    object ResumoVendasValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = ',0.00'
    end
    object ResumoVendasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object ResumoVendasZC_Cod: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Cod'
      Size = 5
      Calculated = True
    end
  end
  object SResumoVendas: TDataSource
    DataSet = ResumoVendas
    Left = 484
    Top = 196
  end
  object Usuarios: TFDTable
    IndexFieldNames = 'Nome'
    Connection = FDC
    TableName = 'speedfood.sis_usuarios'
    Left = 352
    Top = 72
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
  object PedDetpag: TFDTable
    OnCalcFields = PedDetpagCalcFields
    OnFilterRecord = PedDetpagFilterRecord
    IndexFieldNames = 'Numero;Seq'
    MasterSource = DSPedidos
    MasterFields = 'Numero'
    Connection = FDC
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'speedfood.com_pedidodetpag'
    Left = 216
    Top = 292
    object PedDetpagNumero: TIntegerField
      FieldName = 'Numero'
      Origin = 'Numero'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PedDetpagSeq: TIntegerField
      FieldName = 'Seq'
      Origin = 'Seq'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PedDetpagindPag: TIntegerField
      FieldName = 'indPag'
      Origin = 'indPag'
      Required = True
    end
    object PedDetpagtPag: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tPag'
      Origin = 'tPag'
      Size = 2
    end
    object PedDetpagValor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Valor'
      Origin = 'Valor'
      Precision = 15
      Size = 2
    end
    object PedDetpagtpIntegra: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tpIntegra'
      Origin = 'tpIntegra'
    end
    object PedDetpagCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object PedDetpagBandeira: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Bandeira'
      Origin = 'Bandeira'
      Size = 45
    end
    object PedDetpagcAut: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cAut'
      Origin = 'cAut'
      Size = 45
    end
    object PedDetpagnrCartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nrCartao'
      Origin = 'nrCartao'
      Size = 45
    end
    object PedDetpagAfiliacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Afiliacao'
      Origin = 'Afiliacao'
      Size = 45
    end
    object PedDetpagNrParcelas: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NrParcelas'
      Origin = 'NrParcelas'
    end
    object PedDetpagvTroco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vTroco'
      Origin = 'vTroco'
      Precision = 15
      Size = 2
    end
    object PedDetpagnrDocto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nrDocto'
      Origin = 'nrDocto'
      Size = 45
    end
    object PedDetpagcodVenda: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codVenda'
      Origin = 'codVenda'
      Size = 45
    end
    object PedDetpagSit: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Sit'
      Origin = 'Sit'
    end
    object PedDetpagNSU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NSU'
      Origin = 'NSU'
      Size = 200
    end
    object PedDetpagCodAutorizacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CodAutorizacao'
      Origin = 'CodAutorizacao'
      Size = 200
    end
    object PedDetpagNroReferencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NroReferencia'
      Origin = 'NroReferencia'
      Size = 200
    end
    object PedDetpagDigCartao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DigCartao'
      Origin = 'DigCartao'
    end
    object PedDetpagCodBandeira: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CodBandeira'
      Origin = 'CodBandeira'
    end
    object PedDetpagAutDataHora: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AutDataHora'
      Origin = 'AutDataHora'
    end
    object PedDetpagAutClieArqImpr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AutClieArqImpr'
      Origin = 'AutClieArqImpr'
      Size = 240
    end
    object PedDetpagAutEstabArqImpr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AutEstabArqImpr'
      Origin = 'AutEstabArqImpr'
      Size = 240
    end
    object PedDetpagCancDataHora: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CancDataHora'
      Origin = 'CancDataHora'
    end
    object PedDetpagCancClieArqImpr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CancClieArqImpr'
      Origin = 'CancClieArqImpr'
      Size = 240
    end
    object PedDetpagCancEstabArqImpr: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CancEstabArqImpr'
      Origin = 'CancEstabArqImpr'
      Size = 240
    end
    object PedDetpagZC_nrCartao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_nrCartao'
      Calculated = True
    end
    object PedDetpagtpPagTela: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tpPagTela'
      Origin = 'tpPagTela'
    end
  end
  object DSPedDetpag: TDataSource
    DataSet = PedDetpag
    Left = 264
    Top = 308
  end
  object DetpagWrk: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = DetpagWrkCalcFields
    Left = 552
    Top = 56
    object DetpagWrkSeq: TSmallintField
      FieldName = 'Seq'
    end
    object DetpagWrkValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object DetpagWrktPag: TStringField
      FieldName = 'tPag'
      Size = 2
    end
    object DetpagWrkZC_tPag: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_tPag'
      Size = 15
      Calculated = True
    end
  end
  object SDetpagWrk: TDataSource
    DataSet = DetpagWrk
    Left = 552
    Top = 108
  end
  object Turnos: TFDTable
    OnCalcFields = TurnosCalcFields
    IndexFieldNames = 'NrTurno'
    Connection = FDC
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'speedfood.com_turnos'
    Left = 24
    Top = 232
    object TurnosNrTurno: TIntegerField
      FieldName = 'NrTurno'
      Origin = 'NrTurno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TurnosStatus: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Status'
      Origin = '`Status`'
    end
    object TurnosDtHrInicio: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DtHrInicio'
      Origin = 'DtHrInicio'
    end
    object TurnosDtHrFim: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DtHrFim'
      Origin = 'DtHrFim'
    end
    object TurnosVlr_Reais: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Vlr_Reais'
      Origin = 'Vlr_Reais'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object TurnosVlr_CDeb: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Vlr_CDeb'
      Origin = 'Vlr_CDeb'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object TurnosVlr_CCred: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Vlr_CCred'
      Origin = 'Vlr_CCred'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object TurnosVlr_PIX: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Vlr_PIX'
      Origin = 'Vlr_PIX'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object TurnosVlr_Outros: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Vlr_Outros'
      Origin = 'Vlr_Outros'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object TurnosQtd_Reais: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Reais'
      Origin = 'Qtd_Reais'
    end
    object TurnosQtd_CDeb: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_CDeb'
      Origin = 'Qtd_CDeb'
    end
    object TurnosQtd_CCred: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_CCred'
      Origin = 'Qtd_CCred'
    end
    object TurnosQtd_PIX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_PIX'
      Origin = 'Qtd_PIX'
    end
    object TurnosQtd_Outros: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd_Outros'
      Origin = 'Qtd_Outros'
    end
    object TurnosZC_Status: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Status'
      Size = 15
      Calculated = True
    end
    object TurnosZC_Datas: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Datas'
      Size = 32
      Calculated = True
    end
  end
  object DSTurnos: TDataSource
    DataSet = Turnos
    Left = 72
    Top = 240
  end
  object SCDBufet: TDataSource
    DataSet = CDBuffet
    Left = 656
    Top = 72
  end
  object CDBuffet: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = CDBuffetCalcFields
    Left = 640
    Top = 24
    object CDBuffetPeso: TIntegerField
      FieldName = 'Peso'
    end
    object CDBuffetVlrUnit: TCurrencyField
      FieldName = 'VlrUnit'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object CDBuffetDescr: TStringField
      FieldName = 'Descr'
      Size = 120
    end
    object CDBuffetZC_Valor: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ZC_Valor'
      Calculated = True
    end
  end
  object CDDiversos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 168
    object CDDiversosCodBarras: TStringField
      FieldName = 'CodBarras'
      Size = 25
    end
    object CDDiversosCodGrupo: TIntegerField
      FieldName = 'CodGrupo'
    end
    object CDDiversosCodItem: TIntegerField
      FieldName = 'CodItem'
    end
    object CDDiversosDescr: TStringField
      FieldName = 'Descr'
      Size = 80
    end
    object CDDiversosUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object CDDiversosQuant: TIntegerField
      FieldName = 'Quant'
    end
    object CDDiversosVlrUnit: TCurrencyField
      FieldName = 'VlrUnit'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object CDDiversosVlrTotal: TCurrencyField
      FieldName = 'VlrTotal'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
  end
  object SCDDiversos: TDataSource
    DataSet = CDDiversos
    Left = 664
    Top = 216
  end
  object SCDItens: TDataSource
    DataSet = CDItens
    Left = 696
    Top = 328
  end
  object CDItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 312
    object CDItensCodGrpItem: TStringField
      FieldName = 'CodGrpItem'
      Size = 5
    end
    object CDItensCodBarras: TStringField
      FieldName = 'CodBarras'
      Size = 25
    end
    object CDItensGrupo: TIntegerField
      FieldName = 'Grupo'
    end
    object CDItensCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object CDItensDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object CDItensUnidade: TStringField
      FieldName = 'Unidade'
      Size = 5
    end
    object CDItensPreco: TCurrencyField
      FieldName = 'Preco'
    end
  end
end
