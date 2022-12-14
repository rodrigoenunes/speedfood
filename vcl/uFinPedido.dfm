object FuFinPedido: TFuFinPedido
  Left = 0
  Top = 0
  Caption = 'Finaliza'#231#227'o do pedido'
  ClientHeight = 547
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object PanRodape: TPanel
    Left = 0
    Top = 524
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
    Height = 483
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object PanCliente: TPanel
      Left = 1
      Top = 283
      Width = 387
      Height = 77
      Align = alClient
      TabOrder = 2
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
        TabStop = False
        DataField = 'CPF_CNPJ'
        DataSource = uDM.DSPedidos
        TabOrder = 1
        OnEnter = dbCPFEnter
        OnExit = dbCPFExit
        OnKeyDown = dbCPFKeyDown
      end
      object dbNome: TDBEdit
        Left = 91
        Top = 4
        Width = 290
        Height = 27
        TabStop = False
        CharCase = ecUpperCase
        DataField = 'NomeCliente'
        DataSource = uDM.DSPedidos
        TabOrder = 0
        OnEnter = dbNomeEnter
        OnExit = dbNomeExit
        OnKeyDown = dbNomeKeyDown
      end
    end
    object PanCtle: TPanel
      Left = 1
      Top = 360
      Width = 387
      Height = 122
      Align = alBottom
      TabOrder = 3
      object btCancelar: TBitBtn
        Left = 5
        Top = 61
        Width = 168
        Height = 56
        Caption = '&Cancelar pedido'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666999666666666666666666666666666699999666666666999666666
          6666666999999966666666999996666666666699999996666666669999966666
          6666999999996666666666999999666666699999999666666666666999999666
          6699999996666666666666669999996669999999666666666666666669999996
          6999996666666666666666666699999999999666666666666666666666699999
          9999666666666666666666666666999999996666666666666666666666666999
          9999666666666666666666666666999999999666666666666666666666669999
          9999996666666666666666666669999999999999666666666666666666699999
          6999999996666666666666666699999666999999996666666666666669999996
          6666999999996666666666666999996666666699999996666666666669999966
          6666666999999996666666666999996666666666699999966666666666999666
          6666666666999996666666666666666666666666666699666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666}
        TabOrder = 1
        OnClick = btCancelarClick
      end
      object btRetornar: TBitBtn
        Left = 173
        Top = 61
        Width = 208
        Height = 56
        Caption = '&Tela anterior'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FF07FF07FF07FFFFFFFFFFFFFFF
          FFF08FF78FF78FF78FFFFFFFFFFFFFFFFF078FF78FF78FF78FFFFFFFFFFFFFFF
          F0708FF78FF78FF78FFFFFFFFFFFFFFF07078FF78FF78FF78FFFFFFFFFFFFFF0
          70708FF78FF78FF78FFFFFFFFFFFFF0707078FF78FF78FF78FFFFFFFFFFFF070
          77708FF78FF78FF78FFFFFFFFFFF070777078FF78FF78FF78FFFFFFFFFF07077
          77708FF78FF78FF78FFFFFFFFF07077777078FF78FF78FF78FFFFFFFF0707777
          77708FF78FF78FF78FFFFFFF0707777777078FF78FF78FF78FFFFFF070777777
          77708FF78FF78FF78FFFFF070777777777078FF78FF78FF78FFFFFF070777777
          77708FF78FF78FF78FFFFFFF0707777777078FF78FF78FF78FFFFFFFF0707777
          77708FF78FF78FF78FFFFFFFFF07077777078FF78FF78FF78FFFFFFFFFF07077
          77708FF78FF78FF78FFFFFFFFFFF070777078FF78FF78FF78FFFFFFFFFFFF070
          77708FF78FF78FF78FFFFFFFFFFFFF0707078FF78FF78FF78FFFFFFFFFFFFFF0
          70708FF78FF78FF78FFFFFFFFFFFFFFF07078FF78FF78FF78FFFFFFFFFFFFFFF
          F0708FF78FF78FF78FFFFFFFFFFFFFFFFF078FF78FF78FF78FFFFFFFFFFFFFFF
          FFF08FF78FF78FF78FFFFFFFFFFFFFFFFFFF0FF07FF07FF07FFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 2
        OnClick = btRetornarClick
      end
      object btGravar: TBitBtn
        Left = 5
        Top = 6
        Width = 376
        Height = 56
        Caption = '&Gravar  && Imprimir'
        Glyph.Data = {
          76050000424D7605000000000000760000002800000040000000280000000100
          0400000000000005000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF77777777777777777777777777FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF001111111111111111111111108FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF088888888888888888888888808FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF088888888888888888888888808FFFFFFFFFFFFFFFFFFFFF
          FFF0FFFFFFFFFFFF088801111111111111111178808FFFFFFFFFFFFFFFFFFFFF
          FFF0FFFFFFFFFFFF088833333333333333333378808FFFFFFFFFFFFFFFFFFFFF
          FF000FFFFFFFFFFF088888888888888888888888808FFFFFFFFFFFFFFFFFFFFF
          FF000FFFFFFF10000888000000000000000000388000008FFFFFFFFFFFFFFFFF
          F00000FFFFF707770888888888888888888888888077710FFFFFFFFFFFFFFFFF
          0000000FFFF0777708881111111111111111117880777708FFFFFFFFFFFFFFFF
          0000000FFFF0777708883333333333333333337880777708FFFFFFFFFFFFFFF0
          00000000FFF0777708888888888888888888888880777708FFFFFFFFFFFFFFF0
          00000000FFF0777708888888888888888888888880777708FFFFFFFFFFFFFFFF
          F00000FFFFF0777700000000000000000000000000777708FFFFFFFFFFFFFFFF
          F00000FFFFF0777777777777777777777777777777777708FFFFFFFFFFFFFFFF
          F00000FFFFF0777777777777777777777777777777777708FFFFFFFFFFFFFFFF
          F00000FFFFF0777777777777777777777777777777777708FFFFFFFFFFFFFFFF
          F00000FFFFF0777777777777777777777777777771777708FFFFFFFFFFFFFFFF
          F00000FFFFF0777777777777777777777777777700077708FFFFFFFFFFFFFFFF
          F00000FFFFF0777777777777777777777777777708017708FFFFFFFF00000000
          000000000000000000000777777777777777777710077708FFFFFF00FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF007777777777777777777777708FFFFF0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF0777777777777777777777708FFFFF0F00FFF0F00
          00FFFFF0000FFFFFF00FFFF077777777777777777777770FFFFFF0FF00000F0F
          F0000FFF0000000FF000FFF011111111111111111111107FFFFFF0FFF000FFFF
          0FFF0FFFFFFFFFFFFF0FFFF07777777777777777707778FFFFFFF0F000FFF000
          0FFFFFF00000FF00000000F08888888888888888808FFFFFFFFFF0FF0000FFFF
          F0000FFFFFFFFFFFFFFFFFF08888888888888888808FFFFFFFFFF0FFFF00FF00
          0FFFFFFFF00FF000000FFFF08888888888888888808FFFFFFFFFF0F0000FFFFF
          000FF00000FFFFFF00000FF08888888888888888808FFFFFFFFFF0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF07777777777777777708FFFFFFFFFF0FF000000F0
          00FF000F0FFF0000FFFFFFF00000000000000000008FFFFFFFFFF0FFFF00000F
          FFFFF0000F00FF000000FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 0
        OnClick = btGravarClick
      end
    end
    object PanPagto: TPanel
      Left = 1
      Top = 40
      Width = 387
      Height = 243
      Align = alTop
      TabOrder = 1
      object PanDetPgto: TPanel
        Left = 152
        Top = 1
        Width = 234
        Height = 241
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LabReais: TLabel
          Left = 74
          Top = 30
          Width = 25
          Height = 19
          Alignment = taRightJustify
          Caption = 'R$:'
        end
        object LabCDeb: TLabel
          Left = 32
          Top = 120
          Width = 67
          Height = 19
          Alignment = taRightJustify
          Caption = 'C.D'#233'bito:'
        end
        object LabCCred: TLabel
          Left = 27
          Top = 150
          Width = 72
          Height = 19
          Alignment = taRightJustify
          Caption = 'C.Cr'#233'dito:'
        end
        object LabPix: TLabel
          Left = 69
          Top = 180
          Width = 30
          Height = 19
          Alignment = taRightJustify
          Caption = 'PIX:'
        end
        object LabOutros: TLabel
          Left = 45
          Top = 210
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
        object LabReceb: TLabel
          Left = 8
          Top = 60
          Width = 91
          Height = 19
          Alignment = taRightJustify
          Caption = 'Vlr recebido:'
        end
        object LabTroco: TLabel
          Left = 52
          Top = 90
          Width = 47
          Height = 19
          Alignment = taRightJustify
          Caption = 'Troco:'
        end
        object edReais: TDBEdit
          Left = 100
          Top = 26
          Width = 129
          Height = 27
          DataField = 'VlrReais'
          DataSource = uDM.DSPedidos
          Enabled = False
          TabOrder = 0
          OnEnter = edReaisEnter
          OnExit = edReaisExit
          OnKeyDown = edReaisKeyDown
          OnKeyPress = MudaPontoVirgula
        end
        object edCDeb: TDBEdit
          Left = 100
          Top = 116
          Width = 129
          Height = 27
          DataField = 'VlrCDeb'
          DataSource = uDM.DSPedidos
          Enabled = False
          TabOrder = 3
          OnEnter = edCDebEnter
          OnExit = edCDebExit
          OnKeyDown = edCDebKeyDown
          OnKeyPress = MudaPontoVirgula
        end
        object edCCred: TDBEdit
          Left = 100
          Top = 146
          Width = 129
          Height = 27
          DataField = 'VlrCCred'
          DataSource = uDM.DSPedidos
          Enabled = False
          TabOrder = 4
          OnEnter = edCCredEnter
          OnExit = edCCredExit
          OnKeyDown = edCCredKeyDown
          OnKeyPress = MudaPontoVirgula
        end
        object edPIX: TDBEdit
          Left = 100
          Top = 176
          Width = 129
          Height = 27
          DataField = 'VlrPIX'
          DataSource = uDM.DSPedidos
          Enabled = False
          TabOrder = 5
          OnEnter = edPIXEnter
          OnExit = edPIXExit
          OnKeyDown = edPIXKeyDown
          OnKeyPress = MudaPontoVirgula
        end
        object edOutros: TDBEdit
          Left = 100
          Top = 206
          Width = 129
          Height = 27
          DataField = 'VlrOutros'
          DataSource = uDM.DSPedidos
          Enabled = False
          TabOrder = 6
          OnEnter = edOutrosEnter
          OnExit = edOutrosExit
          OnKeyDown = edOutrosKeyDown
          OnKeyPress = MudaPontoVirgula
        end
        object edReceb: TDBEdit
          Left = 100
          Top = 56
          Width = 129
          Height = 27
          DataField = 'VlrRecebido'
          DataSource = uDM.DSPedidos
          TabOrder = 1
          OnEnter = edRecebEnter
          OnExit = edRecebExit
          OnKeyDown = edRecebKeyDown
          OnKeyPress = MudaPontoVirgula
        end
        object edTroco: TDBEdit
          Left = 100
          Top = 86
          Width = 129
          Height = 27
          DataField = 'VlrTroco'
          DataSource = uDM.DSPedidos
          Enabled = False
          ReadOnly = True
          TabOrder = 2
          OnKeyPress = MudaPontoVirgula
        end
      end
      object dbMeioPagto: TDBRadioGroup
        Left = 1
        Top = 1
        Width = 151
        Height = 241
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
        TabOrder = 0
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
        OnClick = dbMeioPagtoClick
      end
    end
    object PanPlaca: TPanel
      Left = 1
      Top = 1
      Width = 387
      Height = 39
      Align = alTop
      Color = clTeal
      ParentBackground = False
      TabOrder = 0
      object Label5: TLabel
        Left = 17
        Top = 10
        Width = 84
        Height = 19
        Caption = 'Placa Nro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbPlaca: TDBEdit
        Left = 104
        Top = 6
        Width = 81
        Height = 27
        AutoSize = False
        DataField = 'Placa'
        DataSource = uDM.DSPedidos
        TabOrder = 0
        OnEnter = dbPlacaEnter
        OnExit = dbPlacaExit
        OnKeyDown = dbPlacaKeyDown
      end
      object PanFalta: TPanel
        Left = 248
        Top = 1
        Width = 138
        Height = 37
        Align = alRight
        BevelOuter = bvNone
        Color = clYellow
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 138
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Diferen'#231'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          ExplicitWidth = 54
        end
        object LabFalta: TLabel
          Left = 0
          Top = 18
          Width = 138
          Height = 19
          Align = alBottom
          Alignment = taCenter
          Caption = 'LabFalta'
          ExplicitWidth = 58
        end
      end
    end
  end
  object PanTopo: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 41
    Align = alTop
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 11
      Width = 54
      Height = 19
      Caption = 'Pedido:'
    end
    object Label2: TLabel
      Left = 257
      Top = 11
      Width = 41
      Height = 19
      Caption = 'Itens:'
    end
    object Label3: TLabel
      Left = 421
      Top = 11
      Width = 43
      Height = 19
      Caption = 'Valor:'
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
      Left = 300
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
      Left = 466
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
  object SBoxPedido: TScrollBox
    Left = 0
    Top = 41
    Width = 445
    Height = 483
    Align = alClient
    TabOrder = 7
    object imgPedido: TImage
      Left = 28
      Top = 14
      Width = 105
      Height = 105
    end
    object LabTaman: TLabel
      Left = 284
      Top = 158
      Width = 74
      Height = 19
      Caption = 'LabTaman'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
  end
  object dbMenos: TDBMemo
    Left = 239
    Top = 136
    Width = 152
    Height = 37
    DataField = 'TxtMenos'
    DataSource = uDM.SPedWrk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object dbMais: TDBMemo
    Left = 239
    Top = 95
    Width = 200
    Height = 37
    DataField = 'TxtMais'
    DataSource = uDM.SPedWrk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object dbSem: TDBMemo
    Left = 239
    Top = 52
    Width = 152
    Height = 37
    DataField = 'TxtSem'
    DataSource = uDM.SPedWrk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object Teclado: TTouchKeyboard
    Left = 170
    Top = 262
    Width = 180
    Height = 165
    DrawingStyle = dsGradient
    GradientEnd = clAqua
    GradientStart = clTeal
    Layout = 'NumPad'
  end
end
