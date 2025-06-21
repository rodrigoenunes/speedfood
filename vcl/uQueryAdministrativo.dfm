object FuQueryAdministrativo: TFuQueryAdministrativo
  Left = 0
  Top = 0
  Caption = 'Administrativo / Vendas'
  ClientHeight = 619
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OnResize = FormResize
  TextHeight = 16
  object gbSelDados: TGroupBox
    Left = 0
    Top = 0
    Width = 757
    Height = 271
    Align = alTop
    Caption = 'Sele'#231#227'o de dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -2
    DesignSize = (
      757
      271)
    object Label1: TLabel
      Left = 8
      Top = 28
      Width = 94
      Height = 19
      Caption = 'Turno inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 64
      Width = 84
      Height = 19
      Caption = 'Turno final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabProcess: TLabel
      Left = 8
      Top = 222
      Width = 64
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'LabProcess'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitTop = 192
    end
    object cbTurnoIni: TComboBox
      Left = 104
      Top = 22
      Width = 500
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'cbTurnoIni'
    end
    object cbTurnoFin: TComboBox
      Left = 104
      Top = 58
      Width = 500
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'cbTurnoFin'
    end
    object btProcessar: TBitBtn
      Left = 487
      Top = 223
      Width = 124
      Height = 42
      Anchors = [akLeft, akBottom]
      Caption = 'Processar'
      TabOrder = 6
      OnClick = btProcessarClick
    end
    object btSair: TBitBtn
      Left = 617
      Top = 222
      Width = 124
      Height = 42
      Anchors = [akLeft, akBottom]
      Caption = 'Sair/Cancelar'
      TabOrder = 7
      OnClick = btSairClick
      ExplicitTop = 192
    end
    object PBar1: TProgressBar
      Left = 8
      Top = 238
      Width = 473
      Height = 25
      Anchors = [akLeft, akBottom]
      TabOrder = 8
      Visible = False
      ExplicitTop = 208
    end
    object rgCaixas: TRadioGroup
      Left = 8
      Top = 95
      Width = 361
      Height = 54
      Caption = 'Caixa'
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Todos '
        'Onibus'
        'Balc'#227'o'
        'Buffet')
      ParentFont = False
      TabOrder = 2
    end
    object rgMeiosPagto: TRadioGroup
      Left = 8
      Top = 172
      Width = 596
      Height = 45
      Anchors = [akLeft, akBottom]
      Caption = 'Meios de pagamento'
      Columns = 7
      Items.Strings = (
        'Todos'
        'Dinheiro'
        'C.D'#233'b'
        'C.Cr'#233'd'
        'PIX'
        'Outros'
        'Misto')
      TabOrder = 4
      ExplicitTop = 142
    end
    object rgSituacao: TRadioGroup
      Left = 375
      Top = 95
      Width = 229
      Height = 78
      Caption = 'Situa'#231#227'o pedidos'
      Columns = 2
      Items.Strings = (
        'Todos'
        'Pendentes'
        'Pagos'
        'Cancelados')
      TabOrder = 3
    end
    object rgDocumentos: TRadioGroup
      Left = 610
      Top = 95
      Width = 121
      Height = 91
      Caption = 'Docs emitidos'
      Items.Strings = (
        'Todos'
        'NFCe'
        'Outros')
      TabOrder = 5
    end
  end
  object PanResultado: TPanel
    Left = 0
    Top = 271
    Width = 757
    Height = 348
    Align = alClient
    TabOrder = 1
    Visible = False
    ExplicitTop = 242
    ExplicitHeight = 377
    object Panel1: TPanel
      Left = 1
      Top = 306
      Width = 755
      Height = 41
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 335
      DesignSize = (
        755
        41)
      object btNova: TBitBtn
        Left = 6
        Top = 6
        Width = 139
        Height = 25
        Caption = 'Nova consulta'
        TabOrder = 0
        OnClick = btNovaClick
      end
      object btImprimir: TBitBtn
        Left = 151
        Top = 6
        Width = 139
        Height = 25
        Caption = 'Imprimir'
        TabOrder = 1
        OnClick = btImprimirClick
      end
      object btSair2: TBitBtn
        Left = 607
        Top = 5
        Width = 138
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Sair/Cancelar'
        TabOrder = 2
        OnClick = btSairClick
      end
    end
    object PanValores: TPanel
      Left = 1
      Top = 1
      Width = 236
      Height = 305
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 334
      object Label3: TLabel
        Left = 38
        Top = 35
        Width = 52
        Height = 16
        Alignment = taRightJustify
        Caption = 'Dinheiro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 65
        Width = 82
        Height = 16
        Alignment = taRightJustify
        Caption = 'Cart'#227'o d'#233'bito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 4
        Top = 95
        Width = 86
        Height = 16
        Alignment = taRightJustify
        Caption = 'Cart'#227'o cr'#233'dito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 66
        Top = 125
        Width = 24
        Height = 16
        Alignment = taRightJustify
        Caption = 'PIX:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 47
        Top = 155
        Width = 43
        Height = 16
        Alignment = taRightJustify
        Caption = 'Outros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 33
        Top = 185
        Width = 57
        Height = 16
        Alignment = taRightJustify
        Caption = 'Misto (*):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 53
        Top = 215
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabObsMisto: TLabel
        Left = 20
        Top = 241
        Width = 210
        Height = 16
        Caption = '(*) Incluso nos meios de pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 47
        Top = 301
        Width = 43
        Height = 16
        Alignment = taRightJustify
        Caption = 'Outros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 55
        Top = 271
        Width = 35
        Height = 16
        Alignment = taRightJustify
        Caption = 'NFCe:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 56
        Top = 331
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edReais: TEdit
        Left = 90
        Top = 31
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'edReais'
      end
      object edQtdReais: TEdit
        Left = 187
        Top = 31
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'edQtdReais'
      end
      object edCDeb: TEdit
        Left = 90
        Top = 61
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = 'edCDeb'
      end
      object edQtdCDeb: TEdit
        Left = 187
        Top = 61
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'edQtdReais'
      end
      object edCCred: TEdit
        Left = 90
        Top = 91
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = 'edCCred'
      end
      object edQtdCCred: TEdit
        Left = 187
        Top = 91
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = 'edQtdReais'
      end
      object edPIX: TEdit
        Left = 90
        Top = 121
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = 'edPIX'
      end
      object edQtdPIX: TEdit
        Left = 187
        Top = 121
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Text = 'edQtdReais'
      end
      object edOutros: TEdit
        Left = 90
        Top = 151
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = 'edOutros'
      end
      object edQtdOutros: TEdit
        Left = 187
        Top = 151
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Text = 'edQtdReais'
      end
      object edMisto: TEdit
        Left = 90
        Top = 181
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = 'edOutros'
      end
      object edQtdMisto: TEdit
        Left = 187
        Top = 181
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Text = 'edQtdReais'
      end
      object edTotal: TEdit
        Left = 90
        Top = 211
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = 'edTotal'
      end
      object edQtdTotal: TEdit
        Left = 187
        Top = 211
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Text = 'edQtdReais'
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 234
        Height = 24
        Align = alTop
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 14
        object Label10: TLabel
          Left = 8
          Top = 4
          Width = 52
          Height = 19
          Caption = 'Valores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object edVlrNFCe: TEdit
        Left = 90
        Top = 267
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        Text = 'edVlrNFCe'
      end
      object edQtdOutrosDoc: TEdit
        Left = 187
        Top = 297
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        Text = 'edQtdOutrosDoc'
      end
      object edQtdNFCe: TEdit
        Left = 187
        Top = 267
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        Text = 'edQtdNFCe'
      end
      object edVlrOutrosDoc: TEdit
        Left = 90
        Top = 297
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        Text = 'edVlrOutrosDoc'
      end
      object edTotVlrDocs: TEdit
        Left = 90
        Top = 327
        Width = 93
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        Text = 'edTotVlrDocs'
      end
      object edTotQtdDocs: TEdit
        Left = 187
        Top = 327
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        Text = 'edTotQtdDocs'
      end
    end
    object Panel3: TPanel
      Left = 237
      Top = 1
      Width = 519
      Height = 305
      Align = alClient
      TabOrder = 2
      ExplicitHeight = 334
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 517
        Height = 24
        Align = alTop
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label11: TLabel
          Left = 8
          Top = 4
          Width = 63
          Height = 19
          Caption = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 263
        Width = 517
        Height = 41
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 292
        object NavResumo: TDBNavigator
          Left = 8
          Top = 6
          Width = 124
          Height = 30
          DataSource = uDM.SResumoVendas
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
      end
      object GridResumo: TDBGrid
        Left = 1
        Top = 25
        Width = 517
        Height = 238
        Align = alClient
        DataSource = uDM.SResumoVendas
        DrawingStyle = gdsClassic
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZC_Cod'
            Title.Alignment = taCenter
            Title.Caption = 'Cod'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 291
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quant'
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtd'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 79
            Visible = True
          end>
      end
    end
  end
  object FDQPedidos: TFDQuery
    DetailFields = 
      'Data;MeioPagto;NomeCliente;Numero;Origem;Placa;SitPagto;Turno;Va' +
      'lor;ZC_MeioPagto;ZC_Origem;ZC_SitPagto'
    Connection = uDM.FDC
    SQL.Strings = (
      '')
    Left = 352
    Top = 376
    object FDQPedidosNumero: TLongWordField
      FieldName = 'Numero'
    end
    object FDQPedidosValor: TBCDField
      FieldName = 'Valor'
      Size = 2
    end
    object FDQPedidosNrNFCe: TIntegerField
      FieldName = 'NrNFCe'
    end
    object FDQPedidosMeioPagto: TIntegerField
      FieldName = 'MeioPagto'
    end
    object FDQPedidosSitPagto: TSmallintField
      FieldName = 'SitPagto'
    end
    object FDQPedidosVlrReais: TBCDField
      FieldName = 'VlrReais'
      Size = 2
    end
    object FDQPedidosVlrCDeb: TBCDField
      FieldName = 'VlrCDeb'
      Size = 2
    end
    object FDQPedidosVlrCCred: TBCDField
      FieldName = 'VlrCCred'
      Size = 2
    end
    object FDQPedidosVlrPIX: TBCDField
      FieldName = 'VlrPIX'
      Size = 2
    end
    object FDQPedidosVlrOutros: TBCDField
      FieldName = 'VlrOutros'
      Size = 2
    end
  end
  object FDQItens: TFDQuery
    Connection = uDM.FDC
    Left = 397
    Top = 456
    object FDQItensTpProd: TIntegerField
      FieldName = 'TpProd'
    end
    object FDQItensCodProd: TIntegerField
      FieldName = 'CodProd'
    end
    object FDQItensQuant: TIntegerField
      FieldName = 'Quant'
    end
    object FDQItensVlrTotal: TBCDField
      FieldName = 'VlrTotal'
      Size = 2
    end
    object FDQItensNumero: TIntegerField
      FieldName = 'Numero'
    end
  end
  object DSPedidos: TDataSource
    DataSet = FDQPedidos
    Left = 429
    Top = 392
  end
end
