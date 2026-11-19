object FuEtiqPrincipal: TFuEtiqPrincipal
  Left = 0
  Top = 0
  Caption = 'Impress'#227'o de etiquetas'
  ClientHeight = 601
  ClientWidth = 1128
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 30
  object PanTopo: TPanel
    Left = 0
    Top = 0
    Width = 1128
    Height = 45
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 2
      Width = 97
      Height = 21
      Caption = 'Conex'#227'o ativa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabConexao: TLabel
      Left = 8
      Top = 22
      Width = 94
      Height = 21
      Caption = 'LabConexao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PanTurnos: TPanel
    Left = 0
    Top = 45
    Width = 1128
    Height = 77
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1128
      77)
    object Label2: TLabel
      Left = 8
      Top = 0
      Width = 162
      Height = 30
      Caption = 'Selecione o turno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object cbTurnos: TComboBox
      Left = 8
      Top = 26
      Width = 597
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'cbTurnos'
      OnEnter = cbTurnosEnter
    end
    object btUsarTurno: TBitBtn
      Left = 616
      Top = 6
      Width = 245
      Height = 65
      Anchors = [akTop, akRight]
      Caption = '&Utilizar turno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76040000424D7604000000000000760000002800000040000000200000000100
        0400000000000004000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFDDDDDDDDDDDDDDDDDDDDDDDDDDD22
        22DDDDDDDDDDDDDDDDDDDDDDDDDDDD8888FDDDDDDDDDDDDDDDDDDDDDDDDDDD22
        222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDDD22
        222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDDD22
        222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDD222
        2222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDDDDDDDDDDD222
        2222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDDDDDDDDDDD222
        22222DDDDDDDDDDDDDDDDDDDDDDDD88888888FDDDDDDDDDDDDDDDDDDDDDD2222
        22222DDDDDDDDDDDDDDDDDDDDDDD888888888FDDDDDDDDDDDDDDDDDDDDDD2222
        D2222DDDDDDDDDDDDDDDDDDDDDDD8888F8888FDDDDDDDDDDDDDDDDDDDDDD2222
        DD2222DDDDDDDDDDDDDDDDDDDDDD8888FD8888FDDDDDDDDDDDDDDDDDDDD22222
        DD2222DDDDDDDDDDDDDDDDDDDDD88888DD8888FDDDDDDDDDDDDDDDDDDDD2222D
        DD22222DDDDDDDDDDDDDDDDDDDD8888DDD88888FDDDDDDDDDDDDDDDDDD22222D
        DDD22222DDDDDDDDDDDDDDDDDD88888DDDD88888FDDDDDDDDDDDDDDDDD2222DD
        DDD22222DDDDDDDDDDDDDDDDDD8888DDDDD88888FDDDDDDDDDDDDDDDD22222DD
        DDDD22222DDDDDDDDDDDDDDDD88888DDDDDD88888FDDDDDDDDDDDDDD22222DDD
        DDDDD22222DDDDDDDDDDDDDD88888DDDDDDDD88888FDDDDDDDDDDDD222222DDD
        DDDDD222222DDDDDDDDDDDD888888DDDDDDDD888888FDDDDDDDDD2222222DDDD
        DDDDDD222222DDDDDDDDD8888888DDDDDDDDDD888888FDDDDDDDDD22222DDDDD
        DDDDDDD222222DDDDDDDDD88888DDDDDDDDDDDD888888FDDDDDDDDD222DDDDDD
        DDDDDDDD222222DDDDDDDDD888DDDDDDDDDDDDDD888888FFDDDDDDDDDDDDDDDD
        DDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDD
        DDDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FFDDDDDDDDDDDDD
        DDDDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDD
        DDDDDDDDDDDDD22222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDD
        DDDDDDDDDDDDDD2222DDDDDDDDDDDDDDDDDDDDDDDDDDDD8888FDDDDDDDDDDDDD
        DDDDDDDDDDDDDDD222DDDDDDDDDDDDDDDDDDDDDDDDDDDDD888DDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btUsarTurnoClick
    end
    object btSair: TBitBtn
      Left = 872
      Top = 6
      Width = 245
      Height = 65
      Anchors = [akTop, akRight]
      Caption = '&Sair / Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFF000000000
        0000000000000000FFFFFFF010BBBBBBBBBBBBBBBBBBBBB0FFFFFFF011000BBB
        BBBBBBBBBBBBBBB0FFFFFFF01111100BBBBBBBBBBBBBBBB0FFFFFFF011111110
        0BBBBBBBBBBBBBB0FFFFFFF011111111100BBBBBBBBBBBB0FFFFFFF011111111
        11100BBBBBBBBBB0FFFFFFF01111111111110BBBBBBBBBB0FFFFFFF011111111
        11110BBBBBBBBBB0FFFFFFF01111111111110BBBBBBBBBB0FFFFFFF011111111
        11110BBBBBBBBBB0FFFFFFF01111111111110BBBBBBBBBB0FFFFFFF011111111
        11110BBBBBBBBBB09FFFFFF01111111111110BBBB99BBBB999FFFFF011111111
        11110BBBB99BBB99999FFFF01111111111110BBBB99BB999999FFFF011111111
        11110BBBB99B999999FFFFF01111111111110BBBB99999999FFFFFF011111111
        111000BBB9999999FFFFFFF011111111110880BBB9999990FFFFFFF011111111
        110880BBB99999B0FFFFFFF011111111111000BBB999999999FFFFF011111111
        11110BBBB999999999FFFFF01111111111110BBBBBBBBBB0FFFFFFF011EE1111
        11110BBBBBBBBBB0FFFFFFF011EEE11111110BBBBBBBBBB0FFFFFFF011EEEEE1
        11110BBBBBBBBBB0FFFFFFF011EEEEEEE1110BBBBBBBBBB0FFFFFFF011EEEEEE
        EE110BBBBBBBBBB0FFFFFFF011111EEEEE110BBBBBBBBBB0FFFFFFF0111111EE
        EE110BBBBBBBBBB0FFFFFFF0000000000000000000000000FFFF}
      ParentFont = False
      TabOrder = 2
      OnClick = btSairClick
    end
  end
  object PanWork: TPanel
    Left = 0
    Top = 122
    Width = 1128
    Height = 479
    Align = alClient
    BevelWidth = 5
    TabOrder = 2
    Visible = False
    object GridPedidos: TDBGrid
      Left = 5
      Top = 5
      Width = 824
      Height = 337
      Align = alLeft
      DataSource = DSPedidos
      DrawingStyle = gdsClassic
      FixedColor = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Numero'
          Title.Alignment = taCenter
          Title.Caption = 'Pedido'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -21
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 105
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Placa'
          Title.Alignment = taCenter
          Title.Caption = 'Senha'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -21
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 105
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_Impresso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Wingdings 2'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Etiq'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -21
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 73
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_SitPagto'
          Title.Alignment = taCenter
          Title.Caption = 'Pgto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -21
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Title.Caption = 'Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -21
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 240
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Lanctos'
          Title.Alignment = taCenter
          Title.Caption = 'Lcts'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -21
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 73
          Visible = True
        end>
    end
    object PanLctos: TPanel
      Left = 829
      Top = 5
      Width = 294
      Height = 337
      Align = alClient
      BevelWidth = 3
      TabOrder = 1
      object LabLancamentos: TLabel
        Left = 16
        Top = 20
        Width = 156
        Height = 30
        Caption = 'LabLancamentos'
      end
      object Panel1: TPanel
        Left = 3
        Top = 206
        Width = 288
        Height = 128
        Align = alBottom
        TabOrder = 0
        object btEtiqueta: TBitBtn
          Left = 12
          Top = 52
          Width = 110
          Height = 67
          Caption = 'Etiqueta'
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666666666666666666666666666666666666666666666
            66666666666666666666666600000000000000000000000066666660FFFFFFFF
            FFFFFFFFFFFFFFFF06666607FFFFFFFFFFFFFFFFFFFFFFFF86666608FFFFFFFF
            FFFFFFFFFFFFFFFFF1666608FFFF00FFFF08000800F70008F1666608FF008FF0
            0008FF0808FFFF08F1666608FF88FFF8888FFF8F8FFFFF8FF1666608FFFFFFFF
            FFFFFFFFFFFFFFFFF1666608FF0000FFFF0000FF0007F7FFF1666608FF08F008
            0008FFF0088007FFF1666608FF8FF88F888FFFF88FF888FFF1666660FFFFFFFF
            FFFFFFFFFFFFFFFF066666661111111111111111111111116666666666666666
            6666666666666666666666666666666666078006666666666666666666666666
            60F88F8066666666666666666666666668F008F0666666666666666666666666
            1FF708FF0666666666666666666666608FF708FF766666666666666666666660
            FFF708FF866666666666666666666660FFF708FF866666666666666666666660
            FFF708FF866666666666666666666660FFF708FF806666666666666666666660
            F00008FF0666666666666666666666661F7008FF066666666666666666666666
            68F708F066666666666666666666666660FFFF80666666666666666666666666
            6608880666666666666666666666666666666666666666666666}
          TabOrder = 0
          OnClick = btEtiquetaClick
        end
        object btTodas: TBitBtn
          Left = 136
          Top = 51
          Width = 129
          Height = 67
          Caption = 'Todas etiquetas'
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666666666666666666666666666666666666611111111
            111111111111111166666660FFFFFFFFFFFFFFFFFFFFFFFF06666608FFFFFFFF
            FFFFFFFFFFFFFFFFF1666608FFFFFFFFFFFFFFFFFFFFFFFFF1666608FF8700F8
            8F08007F00F70078F1666608FF008FF00808FF0808FFFF08F1666608FFFFFFFF
            FFFFFFFFFFFFFFFFF1666608FFFFFFFFFFFFFFFFFFFFFFFFF1666608FF00F08F
            8700F7F800F870FFF1666608FF08F008008FFFF008F007FFF1666607FFFFFFFF
            FFFFFFFFFFFFFFFF86666660FFFFFFFFFFFFFFFFFFFFFFFF0666666600000000
            0000000000000000666666666666666666666666666666666666666611111111
            111111111111111166666660FFFFFFFFFFFFFFFFFFFFFFFF06666608FFFFFFFF
            FFFFFFFFFFFFFFFFF1666608FFFFFFFFFFFFFFFFFFFFFFFFF1666608FF8700F8
            8808000800F70008F1666608FF008FF00008FF0808FFFF08F1666608FFFFFFFF
            FFFFFFFFFFFFFFFFF1666608FFFFFFFFFFFFFFFFFFFFFFFFF1666608FF00008F
            880000F8000070FFF1666608FF08F0080008FFF0088007FFF1666607FFFFFFFF
            FFFFFFFFFFFFFFFF86666660FFFFFFFFFFFFFFFFFFFFFFFF0666666600000000
            0000000000000000666666666666666666666666666666666666666666666666
            6666666666666666666666666666666666666666666666666666}
          TabOrder = 1
          OnClick = btTodasClick
        end
        object NavLctos: TDBNavigator
          Left = 8
          Top = 4
          Width = 148
          Height = 41
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 2
        end
      end
      object GridLctos: TDBGrid
        Left = 16
        Top = 52
        Width = 273
        Height = 109
        DataSource = DSLctos
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -21
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZC_Impressa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Wingdings 2'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Imp'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZC_TpProd'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZC_Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end>
      end
    end
    object PanCtle: TPanel
      Left = 5
      Top = 342
      Width = 1118
      Height = 132
      Align = alBottom
      ParentColor = True
      TabOrder = 2
      object LabNRegs: TLabel
        Left = 4
        Top = 52
        Width = 71
        Height = 21
        Caption = 'LabNRegs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object sbTamanhoForm: TSpeedButton
        Left = 279
        Top = 34
        Width = 45
        Height = 45
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          04000000000000020000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFF07FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0007FFFFFFFFFFFFFFFFFFFFFFFFFF
          F000007FFFFFFFFFFFFFFFFFFFFFFFFF00000007FFFFFFFFFFFFFFFFFFFFFFF0
          000000007FFFFFFFFFFFFFFFFFFFFF000000000007FFFFFFFFFFFFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFF0000
          000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFF0FF00FF
          FFFFFFFFFF00FF7FFFFFFFFF00FF00FFFFFFFFFFFF00FF07FFFFFFF000FF00FF
          FFFFFFFFFF00FF007FFFFF0000FF00FFFFFFFFFFFF00FF0007FFF000000000FF
          FFFFFFFFFF000000007F0000000000FFFFFFFFFFFF00000000077000000000FF
          FFFFFFFFFF0000000007F700000000FFFFFFFFFFFF000000007FFF7000FF00FF
          FFFFFFFFFF00FF0007FFFFF700FF00FFFFFFFFFFFF00FF007FFFFFFF00FF00FF
          FFFFFFFFFF00FF07FFFFFFFFF0FF00FFFFFFFFFFFF00FF7FFFFFFFFFFFFF0000
          000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF00
          0000000007FFFFFFFFFFFFFFFFFFFFF0000000007FFFFFFFFFFFFFFFFFFFFFFF
          00000007FFFFFFFFFFFFFFFFFFFFFFFFF000007FFFFFFFFFFFFFFFFFFFFFFFFF
          FF0007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF07FFFFFFFFFFFFFFF}
        OnClick = sbTamanhoFormClick
      end
      object rgEtiqs: TRadioGroup
        Left = 362
        Top = 1
        Width = 185
        Height = 130
        Align = alRight
        Caption = 'Etiquetas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'N'#227'o impressas'
          'Impressas'
          'Todos')
        ParentFont = False
        TabOrder = 0
        OnClick = btSelecionarClick
      end
      object rgPagto: TRadioGroup
        Left = 732
        Top = 1
        Width = 185
        Height = 130
        Align = alRight
        Caption = 'Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'N'#227'o pagos'
          'Pagos'
          'Todos')
        ParentFont = False
        TabOrder = 2
        OnClick = btSelecionarClick
      end
      object rgSenha: TRadioGroup
        Left = 547
        Top = 1
        Width = 185
        Height = 130
        Align = alRight
        Caption = 'Senhas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'Sem senha'
          'Com senha'
          'Todos')
        ParentFont = False
        TabOrder = 1
        OnClick = btSelecionarClick
      end
      object NavPedidos: TDBNavigator
        Left = 4
        Top = 6
        Width = 172
        Height = 41
        DataSource = DSPedidos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
      end
      object btSelPadrao: TBitBtn
        Left = 4
        Top = 72
        Width = 237
        Height = 45
        Caption = 'Sele'#231#227'o padr'#227'o'
        Glyph.Data = {
          36080000424D3608000000000000360400002800000020000000200000000100
          0800000000000004000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFF6A49C52490A4A5BA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF749009AE3F4090909ECA3094952F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF070051EC09090909F5F5F509090909A30052FFF65252F7FFFFFFFFFFFFFFFF
          5300F50909E349480000000000009AF409099A00499AEC00FFFFFFFFFFFFFF00
          520909A30011ACF5080808BDBDB55B00510909F400EC0900FFFFFFFFFFFF009A
          0909000A070808080808080808BDBDBD6300A30909090900FFFFFFFFFF525209
          0900AC080808080808080808080808BDBD0000A309090900FFFFFFFFED000909
          00AC0808080808080808080808080808A392090909090900FFFFFFFF00090900
          AC080808080808080808080808080808A352090909090900FFFFFFA452099A52
          080808080808080808080808080808080800000000000007FFFFFF0009090008
          080808080808080808080808080808080808080808FFFFFFFFFF0800099B5A08
          08080808080808080808080808080808080808BDBDBEFFFFFFFFA49B0949B508
          0808080808080808080808080808080808080808BDBDFFFFFFFF52EC09000808
          AC08AC0808A4A40808ACA40808ACA4070808B508BDBD510000520009ED000808
          00B5000863005A085151515A070052F708AD5108BDBE49EC09000009EC510808
          000008086352AD08080852520800AC0808AD510808BE52EC09000009EC520808
          00F700086351A308AC0064F6F5009B0808AD520808BE52EC09000009EC0A0808
          00A400085B51A408630A52A30700A407F55200AD08BD00ED0900520000510808
          AC64B508B563630808A4A40808635BB5F5646CAC08BD1009EC52FFFFFFF60808
          0808080808080808080808080808080808080808BEB449099BA4FFFFFFF60808
          0808080808080808080808080808080808080808085AA3090008FFFFFFFFF608
          0808080808080808080808080808080808080808BD00090900FFFFFF07000000
          0000000808080808080808080808080808080808519A0952A4FFFFFF00090909
          090952A30808080808080808080808080808086B00090900FFFFFFFF00090909
          090992A30808080808080808080808080808AC00090900EDFFFFFFFF00090909
          A300000808080808080808080808080808AC0009095252FFFFFFFFFF00090909
          09A300A40808080808080808080808070A0009099A00FFFFFFFFFFFF0009EC00
          F4090949005BF7080808080807AD1100A309095200FFFFFFFFFFFFFF00EC9A49
          009A0909F49A0011000000004949E30909F50052FFFFFFFFFFFFFFFFF75252F6
          FF5200A309090909F5F5F5F5090909EC510007FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF6530009ECEC090909F4E39A0049F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF75B4A0A49529CA4F6FFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 4
        OnClick = btSelPadraoClick
      end
      object dbNumero: TDBEdit
        Left = 279
        Top = 97
        Width = 77
        Height = 25
        DataField = 'Numero'
        DataSource = DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = dbNumeroChange
      end
      object PanBtSelec: TPanel
        Left = 917
        Top = 1
        Width = 200
        Height = 130
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 6
        StyleElements = [seFont, seBorder]
        object btSelecionar: TBitBtn
          Left = 10
          Top = 15
          Width = 180
          Height = 100
          Caption = 'Selecionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            04000000000000020000CA0E0000C30E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888877777777
            7777777777777788888888887777777777777777777777888888888877777777
            777777777777778888888877444444444444444477777788888888C477777777
            777777774C777788888888C7BFFFFBBBBBFFBFFB7C777788888888C7BFFFFFF8
            44BBFFFF7C777788888888C7FFFFBFF8CCBBFFBF7C777788888888C7FFFBFFC6
            AA4CBBFB7C777788888888C7FFFFFF46AA44BBFB7C777788888888C7FBFFC4AA
            22AAC4BBCC777788888888C7BF8866A2222A667F7C777788888888C78766AA2A
            A222A2664C777788888888487C2A222AA2222AA6CC777788888888C7322A2AA7
            7AA222A26C777788888888C732222AA88AA2222A6C777788888888488AA2AAFB
            BFAA2222AA4C7788888888478AAAAAFBBFAAAA222A4C7788888888C7BFAAFFBF
            FBFFAA222A4C7777888888C7FF7AFFFFFFFF77AA2A665777888888C7FFFFFFFF
            FFFB7762A2AA6647778888C7FFFFFFFFFFFFCCC6A222A2C4778888C7FFFFFFFF
            FFFFC4B87AA2A226777788C7FFFFFFFFFFFFC4FF8AA22AA6577788C7FFFFFFFF
            FFFFCCF878AA222A6C7788C7FFFFFFFFFFBBCCF778AAAA2A6C778847FFFFFFFF
            FFBBC4478888AA2A6C77884C777777777777C4778888AAAA2677887777777777
            777777888888887AA78888888888888888888888888888877888888888888888
            8888888888888888888888888888888888888888888888888888}
          ParentFont = False
          TabOrder = 0
          OnClick = btSelecionarClick
        end
      end
    end
  end
  object FDQPedidos: TFDQuery
    OnCalcFields = FDQPedidosCalcFields
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    Left = 748
    Top = 12
    object FDQPedidosNumero: TLongWordField
      FieldName = 'Numero'
    end
    object FDQPedidosLanctos: TIntegerField
      FieldName = 'Lanctos'
    end
    object FDQPedidosValor: TBCDField
      FieldName = 'Valor'
      Size = 2
    end
    object FDQPedidosEtqImpressas: TIntegerField
      FieldName = 'EtqImpressas'
    end
    object FDQPedidosNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 80
    end
    object FDQPedidosTurno: TIntegerField
      FieldName = 'Turno'
    end
    object FDQPedidosPlaca: TStringField
      FieldName = 'Placa'
      Size = 15
    end
    object FDQPedidosSitPagto: TIntegerField
      FieldName = 'SitPagto'
    end
    object FDQPedidosZC_SitPagto: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_SitPagto'
      Size = 2
      Calculated = True
    end
    object FDQPedidosZC_Impresso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Impresso'
      Size = 1
      Calculated = True
    end
  end
  object DSPedidos: TDataSource
    DataSet = FDQPedidos
    Left = 796
    Top = 12
  end
  object FDQLctos: TFDQuery
    OnCalcFields = FDQLctosCalcFields
    Left = 688
    Top = 198
    object FDQLctosTpProd: TIntegerField
      FieldName = 'TpProd'
    end
    object FDQLctosCodProd: TIntegerField
      FieldName = 'CodProd'
    end
    object FDQLctosEtqImpressa: TIntegerField
      FieldName = 'EtqImpressa'
    end
    object FDQLctosNrLcto: TIntegerField
      FieldName = 'NrLcto'
    end
    object FDQLctosZC_Descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Descricao'
      Size = 120
      Calculated = True
    end
    object FDQLctosZC_Impressa: TStringField
      FieldKind = fkCalculated
      FieldName = 'ZC_Impressa'
      Size = 1
      Calculated = True
    end
    object FDQLctosZC_TpProd: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'ZC_TpProd'
      Size = 5
      Calculated = True
    end
  end
  object DSLctos: TDataSource
    DataSet = FDQLctos
    Left = 740
    Top = 198
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 504
    Top = 382
  end
end
