object FuFinPedido: TFuFinPedido
  Left = 0
  Top = 0
  Caption = 'Finaliza'#231#227'o do pedido'
  ClientHeight = 594
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 19
  object PanRodape: TPanel
    Left = 0
    Top = 581
    Width = 984
    Height = 13
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
    Width = 539
    Height = 540
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object PanCliente: TPanel
      Left = 1
      Top = 321
      Width = 537
      Height = 77
      Align = alTop
      TabOrder = 2
      object Label4: TLabel
        Left = 4
        Top = 47
        Width = 86
        Height = 19
        Alignment = taRightJustify
        Caption = 'CPF / CNPJ:'
      end
      object Label9: TLabel
        Left = 42
        Top = 17
        Width = 48
        Height = 19
        Alignment = taRightJustify
        Caption = 'Nome:'
      end
      object dbCPF: TDBEdit
        Left = 91
        Top = 42
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
        Top = 12
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
      Top = 398
      Width = 537
      Height = 141
      Align = alClient
      TabOrder = 3
      object btCancelar: TBitBtn
        Left = 5
        Top = 87
        Width = 162
        Height = 49
        Caption = '&Cancelar pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
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
        ParentFont = False
        TabOrder = 2
        OnClick = btCancelarClick
      end
      object btRetornar: TBitBtn
        Left = 173
        Top = 80
        Width = 208
        Height = 56
        Caption = '&Tela anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
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
        ParentFont = False
        TabOrder = 3
        OnClick = btRetornarClick
      end
      object btGravar: TBitBtn
        Left = 5
        Top = 38
        Width = 376
        Height = 36
        Caption = '&Gravar  && Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
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
        ParentFont = False
        TabOrder = 1
        OnClick = btGravarClick
      end
      object cbImprimeNFCe: TCheckBox
        Left = 10
        Top = 2
        Width = 239
        Height = 36
        Caption = 'Imprimir NFCe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btRemoto: TBitBtn
        Left = 387
        Top = 38
        Width = 142
        Height = 75
        Caption = 'Remoto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76040000424D7604000000000000760000002800000020000000200000000100
          0800000000000004000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F0F0F0F0F0800080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F0F0F080003030300080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F080003030B0303030300080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          080003030B0B0B03030303030300080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0800
          03030B0B0B0B0B030303030303030300080F0F0F0F0F0F0F0F0F0F0F08000303
          0B0B0B0B0B0B0F0303030303030303030300080F0F0F0F0F0F0F080003030B0B
          0B0B0B0B0F0F0F03030303030303030303030300080F0F0F0F0F00030B0B0B0B
          0B0B0F0F0F0F0B0B030303030303030303030000000000000F0F00030B0B0B0B
          0F0F0F0F0B0B0B0B0B030303030303030300000B0B030303000F00030B0B0F0F
          0F0F0B0B0B0B0B0B0B0B03030303030303000B0B0B030303030000030F0F0F0F
          0B0B0B0B03000B0B0B0B0B030303030300030B0303000000030008030F0F0B0B
          0B0B03000F0F030B0B0B0B0B030303030003030B0B03030300000F08030B0B0B
          03000F0F030B03000B0B0B0B0B03030300000B0B0B03030303000F0F08030B0B
          0F0F030B03000F0F030B0B0B0B0B030300030B0B0B03030303000F0F0F08030B
          0B0B03000F0F030B03000B0B0B0B0B0300030B0B0B03030303000F0F0F0F0803
          0B0B0F0F030B03000F0F030B0B0B0B0B00030B0B0B0F0F0F03000F0F0F0F0F08
          030B0B0B03000F0F030B0B0B0B0B030300030B0B0F0B0B0B0F080F0F0F0F0F0F
          08030B0B0F0F030B0B0B0B0B000B030300030B0B0F0B0B0B080F0F0F0F0F0F00
          0000030B0B0B0B0B0B0B0000000B030300030B0F0B0B0B080F0F0F0F0F0F000B
          0B0300030B0B0B0303000303000F0B00030B0F0B0B0B080F0F0F0F0F0F0F000B
          0000030000000B030300030B0B0000030F0F0B0B0B080F0F0F0F0F0F0F0F0000
          0B0B030303000B0303000B0B0B0B0F0F0B0B0B00080F0F0F0F0F0F0F0F0F000B
          0B0B0B0303000F0B000B0B0B0F0F0B0B0B00080F0F0F0F0F0F0F0F0F0F0F0F00
          0B0B0B0B030300000B0F0F0F0B0B0B00080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          000B0B0B0F0F0F0F0F0B0B0B0000080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F00000F0B0B0B0B0B0000080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F0F0800000000080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F}
        ParentFont = False
        TabOrder = 4
        OnClick = btRemotoClick
      end
    end
    object PanPagto: TPanel
      Left = 1
      Top = 40
      Width = 537
      Height = 281
      Align = alTop
      TabOrder = 1
      object dbMeioPagto: TDBRadioGroup
        Left = 1
        Top = 1
        Width = 208
        Height = 239
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
          '<Misto/Multiplo>'
          'Banricompras')
        ParentBackground = False
        ParentBiDiMode = False
        TabOrder = 1
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
        OnClick = dbMeioPagtoClick
        OnExit = dbMeioPagtoExit
      end
      object PanLevar: TPanel
        Left = 1
        Top = 240
        Width = 535
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object LabParaLevar: TLabel
          Left = 64
          Top = 0
          Width = 143
          Height = 39
          Caption = 'Para levar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = LabParaLevarClick
        end
        object ImgNoTick: TImage
          Left = 4
          Top = 2
          Width = 36
          Height = 36
          Picture.Data = {
            07544269746D61705E010000424D5E010000000000003E000000280000002400
            0000240000000100010000000000200100000000000000000000020000000000
            000000000000FFFFFF00000000000000000000000000000000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC0000000000000000000
            00000000000000000000}
          Stretch = True
          OnClick = LabParaLevarClick
        end
        object ImgTick: TImage
          Left = 22
          Top = 2
          Width = 36
          Height = 36
          Picture.Data = {
            07544269746D61705E010000424D5E010000000000003E000000280000002400
            0000240000000100010000000000200100000000000000000000020000000000
            000000000000FFFFFF00000000000000000000000000000000003FFFFFFFC000
            00003FFFFFFFC00000003F87FFFFC00000003F83FFFFC00000003F81FFFFC000
            00003F01FFFFC00000003F01FFFFC00000003E00FFFFC00000003E00FFFFC000
            00003C107FFFC00000003C183FFFC0000000381C3FFFC0000000303C1FFFC000
            0000307E1FFFC000000038FF0FFFC00000003FFF07FFC00000003FFF83FFC000
            00003FFFC3FFC00000003FFFE1FFC00000003FFFF0FFC00000003FFFF87FC000
            00003FFFFC3FC00000003FFFFE1FC00000003FFFFF0FC00000003FFFFF87C000
            00003FFFFFC3C00000003FFFFFE1C00000003FFFFFF0C00000003FFFFFFCC000
            00003FFFFFFFC00000003FFFFFFFC00000003FFFFFFFC0000000000000000000
            00000000000000000000}
          OnClick = LabParaLevarClick
        end
      end
      object gbDetPgto: TGroupBox
        Left = 209
        Top = 1
        Width = 327
        Height = 239
        Align = alClient
        Caption = 'Recebimento'
        TabOrder = 2
        object LabReais: TLabel
          Left = 99
          Top = 26
          Width = 25
          Height = 19
          Alignment = taRightJustify
          Caption = 'R$:'
        end
        object LabReceb: TLabel
          Left = 16
          Top = 56
          Width = 108
          Height = 19
          Alignment = taRightJustify
          Caption = 'Valor recebido:'
        end
        object LabTroco: TLabel
          Left = 77
          Top = 86
          Width = 47
          Height = 19
          Alignment = taRightJustify
          Caption = 'Troco:'
        end
        object LabCDeb: TLabel
          Left = 57
          Top = 116
          Width = 67
          Height = 19
          Alignment = taRightJustify
          Caption = 'C.D'#233'bito:'
        end
        object LabCCred: TLabel
          Left = 52
          Top = 146
          Width = 72
          Height = 19
          Alignment = taRightJustify
          Caption = 'C.Cr'#233'dito:'
        end
        object LabPix: TLabel
          Left = 94
          Top = 176
          Width = 30
          Height = 19
          Alignment = taRightJustify
          Caption = 'PIX:'
        end
        object LabOutros: TLabel
          Left = 70
          Top = 205
          Width = 54
          Height = 19
          Alignment = taRightJustify
          Caption = 'Outros:'
        end
        object edReais: TDBEdit
          Left = 128
          Top = 22
          Width = 121
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
        object edReceb: TDBEdit
          Left = 128
          Top = 53
          Width = 121
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
          Left = 128
          Top = 82
          Width = 121
          Height = 27
          DataField = 'VlrTroco'
          DataSource = uDM.DSPedidos
          Enabled = False
          ReadOnly = True
          TabOrder = 2
          OnKeyPress = MudaPontoVirgula
        end
        object edCDeb: TDBEdit
          Left = 128
          Top = 112
          Width = 121
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
          Left = 128
          Top = 142
          Width = 121
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
          Left = 128
          Top = 172
          Width = 121
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
          Left = 128
          Top = 201
          Width = 121
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
      end
    end
    object PanPlaca: TPanel
      Left = 1
      Top = 1
      Width = 537
      Height = 39
      Align = alTop
      Color = clTeal
      ParentBackground = False
      TabOrder = 0
      object Label5: TLabel
        Left = 97
        Top = 14
        Width = 50
        Height = 19
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbPlaca: TDBEdit
        Left = 10
        Top = 7
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
        Left = 398
        Top = 1
        Width = 138
        Height = 37
        Align = alRight
        BevelOuter = bvNone
        Color = clYellow
        ParentBackground = False
        TabOrder = 1
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 54
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
        end
        object LabFalta: TLabel
          Left = 0
          Top = 18
          Width = 58
          Height = 19
          Align = alBottom
          Alignment = taCenter
          Caption = 'LabFalta'
        end
      end
    end
  end
  object PanTopo: TPanel
    Left = 0
    Top = 0
    Width = 984
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
      Left = 165
      Top = 11
      Width = 41
      Height = 19
      Caption = 'Itens:'
    end
    object Label3: TLabel
      Left = 273
      Top = 11
      Width = 43
      Height = 19
      Caption = 'Valor:'
      Visible = False
    end
    object dbNro: TDBEdit
      Left = 67
      Top = 8
      Width = 82
      Height = 27
      AutoSize = False
      DataField = 'Numero'
      DataSource = uDM.DSPedidos
      ReadOnly = True
      TabOrder = 0
    end
    object dbLcts: TDBEdit
      Left = 208
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
      Left = 318
      Top = 8
      Width = 111
      Height = 27
      AutoSize = False
      DataField = 'Valor'
      DataSource = uDM.DSPedidos
      ReadOnly = True
      TabOrder = 2
      Visible = False
    end
  end
  object SBoxPedido: TScrollBox
    Left = 0
    Top = 41
    Width = 445
    Height = 540
    Align = alLeft
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
    object PanAguarde: TPanel
      Left = 28
      Top = 352
      Width = 397
      Height = 117
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      Visible = False
      object Label7: TLabel
        Left = 20
        Top = 16
        Width = 302
        Height = 33
        Caption = 'Processando, aguarde ....'
      end
      object LabInstrucao: TLabel
        Left = 20
        Top = 55
        Width = 303
        Height = 29
        Caption = 'Siga as instru'#231#245'es do Pinpad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
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
    Left = 62
    Top = 202
    Width = 180
    Height = 165
    DrawingStyle = dsGradient
    GradientEnd = clAqua
    GradientStart = clTeal
    Layout = 'NumPad'
  end
  object TimerMsgPinpad: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerMsgPinpadTimer
    Left = 324
    Top = 297
  end
end
