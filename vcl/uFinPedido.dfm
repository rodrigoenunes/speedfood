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
    object Label4: TLabel
      Left = 11
      Top = 7
      Width = 86
      Height = 19
      Caption = 'CPF / CNPJ:'
    end
    object dbMeioPagto: TDBRadioGroup
      Left = 5
      Top = 37
      Width = 164
      Height = 244
      BiDiMode = bdLeftToRight
      Caption = 'Meio de pagamento'
      Color = clGradientActiveCaption
      DataField = 'MeioPagto'
      DataSource = uDM.DSPedidos
      Items.Strings = (
        'Dinheiro R$'
        'Cart'#227'o D'#233'bito'
        'Cart'#227'o Cr'#233'dito'
        'PIX'
        'Cheque'
        'Vale-refei'#231#227'o'
        'Outros'
        '<<  Misto  >>')
      ParentBackground = False
      ParentBiDiMode = False
      ParentColor = False
      TabOrder = 0
      Values.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '9')
      OnEnter = dbMeioPagtoEnter
      OnExit = dbMeioPagtoExit
    end
    object dbCPF: TDBEdit
      Left = 99
      Top = 4
      Width = 169
      Height = 27
      DataField = 'CPF_CNPJ'
      DataSource = uDM.DSPedidos
      TabOrder = 1
      OnEnter = dbCPFEnter
      OnExit = dbCPFExit
    end
    object btGravar: TBitBtn
      Left = 6
      Top = 287
      Width = 375
      Height = 56
      Caption = 'Gravar/Imprimir'
      TabOrder = 2
      OnClick = btGravarClick
    end
    object btCancelar: TBitBtn
      Left = 6
      Top = 349
      Width = 182
      Height = 56
      Caption = '&Cancelar pedido'
      TabOrder = 3
      OnClick = btCancelarClick
    end
    object btRetornar: TBitBtn
      Left = 199
      Top = 349
      Width = 182
      Height = 56
      Caption = '&Retornar '#224' tela anterior'
      TabOrder = 4
      OnClick = btRetornarClick
    end
    object gbEspecif: TGroupBox
      Left = 175
      Top = 37
      Width = 206
      Height = 244
      Caption = 'Detalhamento do pagto'
      Color = clGradientActiveCaption
      ParentBackground = False
      ParentColor = False
      TabOrder = 5
      object Label5: TLabel
        Left = 43
        Top = 31
        Width = 25
        Height = 19
        Alignment = taRightJustify
        Caption = 'R$:'
      end
      object Label6: TLabel
        Left = 19
        Top = 60
        Width = 49
        Height = 19
        Alignment = taRightJustify
        Caption = 'C.D'#233'b:'
      end
      object Label7: TLabel
        Left = 14
        Top = 89
        Width = 54
        Height = 19
        Alignment = taRightJustify
        Caption = 'C.Cr'#233'd:'
      end
      object Label8: TLabel
        Left = 38
        Top = 118
        Width = 30
        Height = 19
        Alignment = taRightJustify
        Caption = 'PIX:'
      end
      object Label9: TLabel
        Left = 9
        Top = 147
        Width = 59
        Height = 19
        Alignment = taRightJustify
        Caption = 'Cheque:'
      end
      object Label10: TLabel
        Left = 4
        Top = 176
        Width = 64
        Height = 19
        Alignment = taRightJustify
        Caption = 'Vale Ref:'
      end
      object Label11: TLabel
        Left = 14
        Top = 205
        Width = 54
        Height = 19
        Alignment = taRightJustify
        Caption = 'Outros:'
      end
      object edReais: TDBEdit
        Left = 68
        Top = 26
        Width = 129
        Height = 27
        DataField = 'VlrReais'
        DataSource = uDM.DSPedidos
        TabOrder = 0
      end
      object edCDeb: TDBEdit
        Left = 68
        Top = 55
        Width = 129
        Height = 27
        DataField = 'VlrCDeb'
        DataSource = uDM.DSPedidos
        TabOrder = 1
      end
      object edCCred: TDBEdit
        Left = 68
        Top = 84
        Width = 129
        Height = 27
        DataField = 'VlrCCred'
        DataSource = uDM.DSPedidos
        TabOrder = 2
      end
      object edPIX: TDBEdit
        Left = 68
        Top = 113
        Width = 129
        Height = 27
        DataField = 'VlrPIX'
        DataSource = uDM.DSPedidos
        TabOrder = 3
      end
      object edCheque: TDBEdit
        Left = 68
        Top = 142
        Width = 129
        Height = 27
        DataField = 'VlrCheque'
        DataSource = uDM.DSPedidos
        TabOrder = 4
      end
      object edVRef: TDBEdit
        Left = 68
        Top = 171
        Width = 129
        Height = 27
        DataField = 'VlrVRef'
        DataSource = uDM.DSPedidos
        TabOrder = 5
      end
      object edOutros: TDBEdit
        Left = 68
        Top = 200
        Width = 129
        Height = 27
        DataField = 'VlrOutros'
        DataSource = uDM.DSPedidos
        TabOrder = 6
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
