object FuFinPedido: TFuFinPedido
  Left = 0
  Top = 0
  Caption = 'Finaliza'#231#227'o do pedido'
  ClientHeight = 511
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 19
  object PanRodape: TPanel
    Left = 0
    Top = 488
    Width = 834
    Height = 23
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object PanInform: TPanel
    Left = 445
    Top = 41
    Width = 389
    Height = 447
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 450
    object PanCliente: TPanel
      Left = 1
      Top = 1
      Width = 387
      Height = 68
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 4
        Top = 39
        Width = 86
        Height = 19
        Alignment = taRightJustify
        Caption = 'CPF / CNPJ:'
      end
      object Label9: TLabel
        Left = 42
        Top = 9
        Width = 48
        Height = 19
        Alignment = taRightJustify
        Caption = 'Nome:'
      end
      object dbCPF: TDBEdit
        Left = 91
        Top = 34
        Width = 169
        Height = 27
        DataField = 'CPF_CNPJ'
        DataSource = uDM.DSPedidos
        TabOrder = 1
        OnEnter = dbCPFEnter
        OnExit = dbCPFExit
      end
      object dbNome: TDBEdit
        Left = 91
        Top = 4
        Width = 290
        Height = 27
        CharCase = ecUpperCase
        DataField = 'NomeCliente'
        DataSource = uDM.DSPedidos
        TabOrder = 0
        OnEnter = dbCPFEnter
        OnExit = dbCPFExit
      end
    end
    object PanCtle: TPanel
      Left = 1
      Top = 324
      Width = 387
      Height = 122
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 322
      object btCancelar: TBitBtn
        Left = 5
        Top = 61
        Width = 168
        Height = 56
        Caption = '&Cancelar pedido'
        TabOrder = 0
        OnClick = btCancelarClick
      end
      object btRetornar: TBitBtn
        Left = 173
        Top = 61
        Width = 208
        Height = 56
        Caption = '&Retornar '#224' tela anterior'
        TabOrder = 1
        OnClick = btRetornarClick
      end
      object btGravar: TBitBtn
        Left = 5
        Top = 4
        Width = 376
        Height = 56
        Caption = 'Gravar/Imprimir'
        TabOrder = 2
        OnClick = btGravarClick
      end
    end
    object PanPagto: TPanel
      Left = 1
      Top = 69
      Width = 387
      Height = 255
      Align = alClient
      TabOrder = 2
      ExplicitTop = 68
      object PanDetPgto: TPanel
        Left = 152
        Top = 1
        Width = 234
        Height = 253
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 147
        ExplicitTop = 0
        ExplicitWidth = 245
        object LabReais: TLabel
          Left = 59
          Top = 32
          Width = 25
          Height = 19
          Alignment = taRightJustify
          Caption = 'R$:'
        end
        object LabCDeb: TLabel
          Left = 17
          Top = 62
          Width = 67
          Height = 19
          Alignment = taRightJustify
          Caption = 'C.D'#233'bito:'
        end
        object LabCRed: TLabel
          Left = 12
          Top = 92
          Width = 72
          Height = 19
          Alignment = taRightJustify
          Caption = 'C.Cr'#233'dito:'
        end
        object LabPix: TLabel
          Left = 54
          Top = 122
          Width = 30
          Height = 19
          Alignment = taRightJustify
          Caption = 'PIX:'
        end
        object LabOutros: TLabel
          Left = 30
          Top = 152
          Width = 54
          Height = 19
          Alignment = taRightJustify
          Caption = 'Outros:'
        end
        object Label10: TLabel
          Left = 8
          Top = 2
          Width = 91
          Height = 19
          Caption = 'Recebimento'
        end
        object edReais: TDBEdit
          Left = 84
          Top = 28
          Width = 133
          Height = 27
          DataField = 'VlrReais'
          DataSource = uDM.DSPedidos
          TabOrder = 0
        end
        object edCDeb: TDBEdit
          Left = 84
          Top = 58
          Width = 133
          Height = 27
          DataField = 'VlrCDeb'
          DataSource = uDM.DSPedidos
          TabOrder = 1
        end
        object edCCred: TDBEdit
          Left = 84
          Top = 88
          Width = 133
          Height = 27
          DataField = 'VlrCCred'
          DataSource = uDM.DSPedidos
          TabOrder = 2
        end
        object edPIX: TDBEdit
          Left = 84
          Top = 118
          Width = 133
          Height = 27
          DataField = 'VlrPIX'
          DataSource = uDM.DSPedidos
          TabOrder = 3
        end
        object edOutros: TDBEdit
          Left = 84
          Top = 148
          Width = 133
          Height = 27
          DataField = 'VlrOutros'
          DataSource = uDM.DSPedidos
          TabOrder = 4
        end
      end
      object dbMeioPagto: TDBRadioGroup
        Left = 1
        Top = 1
        Width = 151
        Height = 253
        Align = alLeft
        BiDiMode = bdLeftToRight
        Caption = 'Pagamento'
        DataField = 'MeioPagto'
        DataSource = uDM.DSPedidos
        Items.Strings = (
          'Dinheiro R$'
          'Cart'#227'o D'#233'bito'
          'Cart'#227'o Cr'#233'dito'
          'PIX'
          'Outros'
          '<<  Misto  >>')
        ParentBackground = False
        ParentBiDiMode = False
        TabOrder = 1
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
        OnExit = dbMeioPagtoExit
      end
    end
  end
  object PanTexto: TPanel
    Left = 0
    Top = 41
    Width = 445
    Height = 447
    Align = alLeft
    Caption = 'PanTexto'
    TabOrder = 3
    object MemPedido: TMemo
      Left = 1
      Top = 1
      Width = 443
      Height = 445
      TabStop = False
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Lucida Console'
      Font.Style = []
      Lines.Strings = (
        'MemPedido')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object PanTopo: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 41
    Align = alTop
    Enabled = False
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 11
      Width = 54
      Height = 19
      Caption = 'Pedido:'
    end
    object Label2: TLabel
      Left = 217
      Top = 11
      Width = 41
      Height = 19
      Caption = 'Itens:'
    end
    object Label3: TLabel
      Left = 381
      Top = 11
      Width = 43
      Height = 19
      Caption = 'Valor:'
    end
    object LabTaman: TLabel
      Left = 308
      Top = 2
      Width = 64
      Height = 13
      Caption = 'LabTaman'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Visible = False
      WordWrap = True
    end
    object dbNro: TDBEdit
      Left = 67
      Top = 8
      Width = 93
      Height = 27
      AutoSize = False
      DataField = 'Numero'
      DataSource = uDM.DSPedidos
      ReadOnly = True
      TabOrder = 0
    end
    object dbLcts: TDBEdit
      Left = 260
      Top = 8
      Width = 42
      Height = 27
      AutoSize = False
      DataField = 'Lanctos'
      DataSource = uDM.DSPedidos
      ReadOnly = True
      TabOrder = 1
    end
    object dbValor: TDBEdit
      Left = 426
      Top = 8
      Width = 121
      Height = 27
      AutoSize = False
      DataField = 'Valor'
      DataSource = uDM.DSPedidos
      ReadOnly = True
      TabOrder = 2
    end
  end
end
