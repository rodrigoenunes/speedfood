object FuBalcaoLctos: TFuBalcaoLctos
  Left = 0
  Top = 0
  Caption = 'Lan'#231'amentos'
  ClientHeight = 484
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OnActivate = FormActivate
  OnResize = FormResize
  TextHeight = 19
  object PanGridPed: TPanel
    Left = 654
    Top = 0
    Width = 250
    Height = 484
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 656
    object PanPedCtle: TPanel
      Left = 1
      Top = 141
      Width = 248
      Height = 342
      Align = alBottom
      TabOrder = 2
      object btEditar: TBitBtn
        Left = 88
        Top = 4
        Width = 78
        Height = 56
        Caption = '&Alterar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object btExcluir: TBitBtn
        Left = 168
        Top = 4
        Width = 73
        Height = 56
        Caption = '&Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666FFFF6666666FF6619996666666996667888F66666688F666199966666
          99166667888F6666887F66661996666991666666788F666887F6666661996699
          166666666788FF887F666666619999916666666667888887F666666666199916
          666666666678887F6666666666999966666666666F8888F66666666669991996
          66666666F888788F66666666999161996666666F88876788F666666999166619
          966666F8887666788F6666999166666996666688876666678F66669916666661
          996666887666666788F66691666666661996668766666666788F666666666666
          6199666666666666678866666666666666666666666666666666}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
      end
      object NavPedido: TDBNavigator
        Left = 4
        Top = 4
        Width = 80
        Height = 56
        DataSource = uDM.SPedWrk
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object btFinalizar: TBitBtn
        Left = 5
        Top = 64
        Width = 237
        Height = 124
        Caption = '&Finalizar pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          B60D0000424DB60D000000000000360000002800000030000000180000000100
          180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF00660021A335006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF656565949494656565FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF00660024A53912A92028B040006600FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659696968F8F8F
          9E9E9E656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660027
          A73E1EB43218AE2913AB2227AF3E006600FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF6565659999999B9B9B9595959191919D9D9D656565FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0066001F99312EC04A26BA3E1FB53419AF2B13AB2325AE
          3C006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565658E8E8EA9A9A9A2A2A29C9C9C
          9696969191919B9B9B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001D952E3FCE6337
          C8572FC14C25A63B00660029B14114AC2524AD3A006600FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565
          658B8B8BB8B8B8B1B1B1AAAAAA9797976565659F9F9F9292929A9A9A656565FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0066001A902A4FDA7948D56F40CF642FB34A006600FF00FF0066001CB2
          2F15AC2622AC38006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF656565878787C6C6C6C0C0C0B9B9B9A3A3A3656565
          FF00FF656565999999929292999999656565FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660059E28955E08250DB7B36
          BC55006600B73D3DFF00FFFF00FF006600148D2117AE2721AB36006600FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565CFCF
          CFCCCCCCC7C7C7ABABAB6565657A7A7AFF00FFFF00FF65656582828294949498
          9898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00660031B04D5BE48A3ABF5B006600CB6363CF6F6FB73D3DFF00FFFF00
          FFFF00FF00660018AE2920AA34006600FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF656565A2A2A2D1D1D1AEAEAE6565659797979F9F9F
          7A7A7AFF00FFFF00FFFF00FF656565959595979797656565FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3D00660047CF6D006600CF
          6E6ECD6868CB6363CE6C6CB73D3DFF00FFFF00FFFF00FF00660019AF2B14AB23
          006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A6565
          65BDBDBD6565659E9E9E9A9A9A9797979D9D9D7A7A7AFF00FFFF00FFFF00FF65
          6565969696919191656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          B73D3DC95D5DD88989006600D37B7BCD6969B73D3DD07171CB6363CE6C6CB73D
          3DFF00FFFF00FFFF00FF0066000B7E1314AB24006600FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7A7A7A939393B0B0B0656565A7A7A79B9B9B7A7A7AA0A0A0
          9797979D9D9D7A7A7AFF00FFFF00FFFF00FF656565767676919191656565FF00
          FFFF00FFFF00FFFF00FFFF00FFB73D3DC85959DC9696DA9090D88A8AD17575B7
          3D3DFF00FFB73D3DCE6B6BCB6363CE6B6BB73D3DFF00FFFF00FFFF00FFFF00FF
          006600118D1D006600FF00FFFF00FFFF00FFFF00FF7A7A7A909090B9B9B9B5B5
          B5B1B1B1A3A3A37A7A7AFF00FF7A7A7A9C9C9C9797979C9C9C7A7A7AFF00FFFF
          00FFFF00FFFF00FF656565818181656565FF00FFFF00FFFF00FFFF00FFB73D3D
          DF9F9FDE9C9CDD9898D47D7DB73D3DFF00FFFF00FFFF00FFB73D3DC65454CC66
          66CD6969B73D3DFF00FFFF00FFFF00FFFF00FF00660008790F006600FF00FFFF
          00FFFF00FF7A7A7ABFBFBFBDBDBDBABABAA8A8A87A7A7AFF00FFFF00FFFF00FF
          7A7A7A8D8D8D9999999B9B9B7A7A7AFF00FFFF00FFFF00FFFF00FF6565657272
          72656565FF00FFFF00FFFF00FFB73D3DD17474E0A2A2D58080B73D3DFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFB73D3DCC6666CD6969B73D3DFF00FFFF00FF
          FF00FFFF00FFFF00FF006600006600FF00FFFF00FF7A7A7AA2A2A2C1C1C1AAAA
          AA7A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A9999999B9B9B7A
          7A7AFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
          B73D3DD98D8DB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFB73D3DCD6868CB6363B73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          6600FF00FFFF00FF7A7A7AB3B3B37A7A7AFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF7A7A7A9A9A9A9797977A7A7AFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF656565FF00FFFF00FFFF00FFB73D3DFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3DC24848CB6363B73D3D
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A85
          85859797977A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFB73D3DC65353B73D3DFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A8C8C8C7A7A7AFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3D
          C14545B73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7A7A7A8383837A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3DB73D3DFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A7A7A
          7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
      end
      object btCancelar: TBitBtn
        Left = 5
        Top = 280
        Width = 161
        Height = 56
        Caption = '&Cancelar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76040000424D7604000000000000760000002800000040000000200000000100
          0400000000000004000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          666666666666666666666666666666666666666666FFF6666666666666666666
          666666666699966666666666666666666666666666888F666666666666666666
          666666666999996666666666FFF6666666666666688888F66666666999666666
          66666669999999666666666888FF666666666668888888666666669999966666
          666666999999966666666688888F666666666688888886666666669999966666
          666699999999666666666688888F666666668888888866666666669999996666
          6669999999966666666666888888F66666688888888666666666666999999666
          66999999966666666666666888888F6666888888866666666666666699999966
          699999996666666666666666888888F668888888666666666666666669999996
          6999996666666666666666666888888FF8888866666666666666666666999999
          9999966666666666666666666688888888888666666666666666666666699999
          999966666666666666666666666888888888F666666666666666666666669999
          999966666666666666666666666688888888F666666666666666666666666999
          999966666666666666666666666668888888F666666666666666666666669999
          9999966666666666666666666666888888888F66666666666666666666669999
          99999966666666666666666666668888888888FF666666666666666666699999
          9999999966666666666666666668888888888888F66666666666666666699999
          69999999966666666666666666688888688888888F6666666666666666999996
          669999999966666666666666668888866688888888FF66666666666669999996
          66669999999966666666666668888886666688888888F6666666666669999966
          666666999999966666666666688888666666668888888FFF6666666669999966
          66666669999999966666666668888866666666688888888F6666666669999966
          66666666699999966666666668888866666666666888888F6666666666999666
          6666666666999996666666666688866666666666668888866666666666666666
          6666666666669966666666666666666666666666666688666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
        OnClick = btCancelarClick
      end
      object btDummy: TBitBtn
        Left = 196
        Top = 296
        Width = 37
        Height = 25
        Caption = '...'
        TabOrder = 5
        TabStop = False
      end
    end
    object GridPedido: TDBGrid
      Left = 1
      Top = 97
      Width = 248
      Height = 44
      TabStop = False
      Align = alClient
      DataSource = uDM.SPedWrk
      DrawingStyle = gdsClassic
      FixedColor = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Quant'
          Title.Alignment = taCenter
          Title.Caption = 'Qt'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZC_Aviso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Wingdings'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'J'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Wingdings'
          Title.Font.Style = []
          Width = 19
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrTotal'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Width = 57
          Visible = True
        end>
    end
    object PanTotalizacao: TPanel
      Left = 1
      Top = 1
      Width = 248
      Height = 96
      Align = alTop
      BevelOuter = bvNone
      Color = 16748945
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        248
        96)
      object Label2: TLabel
        Left = 4
        Top = 36
        Width = 28
        Height = 16
        Caption = 'Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 248
        Height = 25
        Align = alTop
        Alignment = taCenter
        Caption = 'Totaliza'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        ExplicitWidth = 103
      end
      object edItens: TEdit
        Left = 34
        Top = 30
        Width = 37
        Height = 37
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edItens'
      end
      object edTotal: TEdit
        Left = 81
        Top = 30
        Width = 164
        Height = 37
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'edTotal'
      end
    end
  end
  object PanOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 484
    Align = alLeft
    TabOrder = 0
    ExplicitTop = -1
    object LabOpcoes: TLabel
      Left = 1
      Top = 1
      Width = 199
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Op'#231#245'es'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 87
    end
    object btCQuente: TBitBtn
      Left = 8
      Top = 36
      Width = 185
      Height = 42
      Caption = 'btCQuente'
      TabOrder = 0
    end
    object btCQEspecial: TBitBtn
      Left = 8
      Top = 88
      Width = 185
      Height = 42
      Caption = 'Montar lanche'
      Glyph.Data = {
        060E0000424D060E000000000000360000002800000022000000220000000100
        180000000000D00D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3000000
        363636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF323232000000B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
        F9F9000000C5C5C5747474000000BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB9B9B9000000777777CBCBCB000000F0F0F0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB1B1B1040404FFFFFFFFFFFFE3E3E30000002F2F2FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF2E2E2E000000E4E4E4FFFFFFFFFFFF050505
        A7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000232323FFFFFFFFFFFFFFFF
        FF303030000000E2E2E2FFFFFFFFFFFFE2E2E2000000323232FFFFFFFFFFFFFF
        FFFF242424000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5E
        000000A3A3A3FFFFFFFFFFFFBFBFBF0000008B8B8B858585000000C0C0C0FFFF
        FFFFFFFFA2A2A20000005C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFECECEC000000080808FDFDFDFFFFFFFFFFFF0000000F0F0F
        FFFFFFFFFFFFFEFEFE080808000000ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87878700000083838300
        00008B8B8BFFFFFFFFFFFF818181000000878787FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF313131000000EDEDEDFFFFFFE9E9E9000000000000343434FFFFFFFFFFFF0B
        0B0B8A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD6D6D6000000424242FFFFFFFFFFFF545454000000B9B9B9FFFFFF4242
        42000000DBDBDBFFFFFF0000002525255555550D0D0D1A1A1A5B5B5BCFCFCFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF5D5D5D000000C8C8C8FFFFFFCBCBCB0000003E3E3E4D4D4D
        000000CBCBCBFFFFFFC8C8C8000000606060FFFFFF6F6F6F8A8A8AD0D0D0C5C5
        C57E7E7E000000121212F7F7F7FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF9595
        95555555494949828282F9F9F9000000161616FFFFFFFFFFFF333333000000C1
        C1C1FFFFFFFFFFFFC1C1C1000000333333FFFFFFFFFFFF141414000000FFFFFF
        9191915353535F5F5FA4A4A4FFFFFF5C5C5C6B6B6BFFFFFF0000FFFFFFFFFFFF
        F7F7F70000000D0D0D8484848888883D3D3D000000999999FFFFFFB7B7B70000
        00474747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF474747000000B8B8B8FF
        FFFF9797970000003C3C3C8888888585850D0D0D000000FFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFF000000959595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        191919000000DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDEDEDE0000001C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92929200
        0000FFFFFFFFFFFF0000FFFFFF595959424242FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF535353000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF414141595959FFFFFF0000FFFFFF000000E6E6E6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF101010E9E9E9000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E9E9E9111111FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3000000FFFFFF0000FFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000008181
        817373737B7B7B6F6F6F7777777777776F6F6F7B7B7B737373818181000000FF
        FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
        0000FFFFFF2121219F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5E353535
        AEAEAE1616167D7D7D5555550000008383832828282828288383830000005555
        557D7D7D151515AEAEAE3535355E5E5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
        9E9E232323FFFFFF0000FFFFFFE1E1E1000000C1C1C1FFFFFFFFFFFFFFFFFF3E
        3E3E000000FFFFFF696969757575FFFFFF929292474747FFFFFF787878787878
        FFFFFF474747929292FFFFFF757575696969FFFFFF0000003F3F3FFFFFFFFFFF
        FFFFFFFFBEBEBE000000E0E0E0FFFFFF0000FFFFFFFFFFFFD5D5D50000000000
        00000000000000494949FFFFFFFFFFFF101010B5B5B5FFFFFF6565656F6F6FFF
        FFFF707070707070FFFFFF6F6F6F656565FFFFFFB5B5B5101010FFFFFFFFFFFF
        494949000000000000000000000000D4D4D4FFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEEFEFEFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
        FF6E6E6E9E9E9EFFFFFF707070707070FFFFFF9E9E9E6D6D6DFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFEDEDEDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF707070707070FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFE0E0E0F0F0F0FFFFFFFF
        FFFF909090222222343434FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767676767
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3434342121218D8D8DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF1717
        17707070FFFFFF0000001C1C1C848484E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC4C4C4C4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E08484841D1D1D
        000000F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFDFDFDFFFFFFFFFFFF0000008B8B8BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF8D8D8D000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF4B4B4B7272729A9A9A1C1C1CFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1D888888FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF070707D9D9D94F4F4F898989FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A3D3D
        3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF010101E0E0
        E0474747919191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF919191333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF434343989898868686494949FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF4A4A4A707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF9898980E0E0EFFFFFF000000D9D9D9FFFFFFFFFFFF
        FFFFFFFFFFFFEDEDEDB1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1
        B1EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFDADADA000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF000000C9C9C9F1F1F100
        0000616161D9D9D9E7E7E7858585000000000000F6F6F6FFFFFFFFFFFFFFFFFF
        FFFFFFF6F6F6000000000000858585E7E7E7D9D9D9626262000000DDDDDDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFE4E4
        E4000000C6C6C6FFFFFF535353000000000000404040F3F3F3BBBBBB0000008E
        8E8EFCFCFCFCFCFC8F8F8F000000BBBBBBF3F3F3404040000000000000515151
        FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD1D1D1606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFE0E0E0353535000000000000363636E0E0E0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      TabOrder = 1
      OnClick = btCQEspecialClick
    end
    object btBebidas: TBitBtn
      Left = 8
      Top = 136
      Width = 185
      Height = 42
      Caption = 'btBebidas'
      TabOrder = 2
    end
    object btCrepes: TBitBtn
      Left = 8
      Top = 187
      Width = 185
      Height = 42
      Caption = 'btCrepes'
      TabOrder = 3
    end
    object btFrituras: TBitBtn
      Left = 8
      Top = 235
      Width = 185
      Height = 42
      Caption = 'btFrituras'
      TabOrder = 4
    end
    object btGelados: TBitBtn
      Left = 8
      Top = 287
      Width = 185
      Height = 42
      Caption = 'btGelados'
      TabOrder = 5
    end
    object btMShake: TBitBtn
      Left = 8
      Top = 338
      Width = 185
      Height = 42
      Caption = 'btMShake'
      TabOrder = 6
    end
    object btBuffet: TBitBtn
      Left = 8
      Top = 388
      Width = 185
      Height = 42
      Caption = 'btBuffet'
      TabOrder = 7
    end
    object btDiversos: TBitBtn
      Left = 8
      Top = 439
      Width = 185
      Height = 42
      Caption = 'btDiversos'
      TabOrder = 8
    end
  end
end