object FuConsPedidos: TFuConsPedidos
  Left = 0
  Top = 0
  Caption = 'Consultar pedidos'
  ClientHeight = 487
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 394
    Align = alClient
    TabOrder = 0
    object GridPed: TDBGrid
      Left = 1
      Top = 1
      Width = 723
      Height = 392
      Align = alClient
      DataSource = uDM.DSPedidos
      DrawingStyle = gdsClassic
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Numero'
          Title.Alignment = taCenter
          Width = 56
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_DataHora'
          Title.Alignment = taCenter
          Title.Caption = 'Data/Hora'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Turno'
          Title.Alignment = taCenter
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Title.Alignment = taRightJustify
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Title.Caption = 'Cliente'
          Width = 188
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Lctos'
          Title.Alignment = taCenter
          Width = 36
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_MeioPagto'
          Title.Alignment = taCenter
          Title.Caption = 'Pagto'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NrNFCe'
          Title.Alignment = taCenter
          Title.Caption = 'Nr NFCe'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SrNFCe'
          Title.Alignment = taCenter
          Title.Caption = 'Ser'
          Width = 28
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_SitTxt'
          Title.Alignment = taCenter
          Title.Caption = 'Situa'#231#227'o'
          Width = 64
          Visible = True
        end>
    end
  end
  object PanCtle: TPanel
    Left = 0
    Top = 394
    Width = 725
    Height = 93
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      725
      93)
    object NavPed: TDBNavigator
      Left = 8
      Top = 6
      Width = 140
      Height = 41
      DataSource = uDM.DSPedidos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object btImprimirPedido: TBitBtn
      Left = 240
      Top = 5
      Width = 155
      Height = 41
      Hint = 'Imprimir pedido'
      Anchors = [akTop, akRight]
      Caption = 'Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        66070000424D660700000000000036000000280000001A000000170000000100
        18000000000030070000C30E0000C30E00000000000000000000BEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE9A9A9A7A7A7A2525251D1D1D7F7F
        7F9C9C9CBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE9595956C
        6C6C5858586F6F6FA3A3A37F7F7F4646464242426C6C6C9A9A9ABEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
        BEBEBEBEBEBEAFAFAF494949616161787878B6B6B6B5B5B56969692F2F2F7070
        707676765050504C4C4C494949B6B6B6BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBE0000BEBEBEB9B9B9B2B2B24D4D4D3A3A3AA1A1A1AEAEAEBB
        BBBB9292929494949494946B6B6B2A2A2A2C2C2C7777777070706B6B6B2C2C2C
        535353B2B2B2BABABABEBEBEBEBEBEBEBEBEBEBEBEBEBEBE0000B5B5B56C6C6C
        3232329B9B9BBDBDBDAFAFAF9F9F9F8F8F8FB5B5B58F8F8FA3A3A37F7F7F7F7F
        7F6D6D6D1F1F1F4343435F5F5F7D7D7D6262622222226C6C6C929292BEBEBEBE
        BEBEBEBEBEBEBEBE0000A5A5A56E6E6EBFBFBFA8A8A8A0A0A09D9D9DAEAEAEBF
        BFBFBBBBBB8F8F8FA3A3A37F7F7F7F7F7F7F7F7F7F7F7F5858583B3B3B424242
        5555557F7F7F5151514040407C7C7CBEBEBEBEBEBEBEBEBE0000B2B2B2878787
        959595A4A4A4ABABABBFBFBFBFBFBFBFBFBFBBBBBB8F8F8FA3A3A37F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F5555554646462B2B2B646464777777323232BE
        BEBEBEBEBEBEBEBE00008888889B9B9B979797AFAFAFBFBFBFBFBFBFBFBFBFBF
        BFBFBBBBBB909090A6A6A67F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7A7A7A6F6F6F3535351A1A1A2D2D2DB4B4B4BEBEBEBEBEBE0000979797E7E7E7
        9B9B9BAFAFAFBFBFBFBFBFBFBFBFBFBFBFBFC9C9C9969696BABABA9191918282
        827F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7979791D1D1D3E
        3E3EAAAAAABEBEBE0000979797E7E7E79B9B9BAFAFAFBFBFBFBFBFBFCFCFCFDF
        DFDFDBDBDB9F9F9F9F9F9F9F9F9F9F9F9F9999997F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F5F5F5F1E1E1E555555ACACAC0000979797E7E7E7
        9B9B9BAFAFAFC4C4C4EDEDEDDFDFDFD1D1D1C1C1C1BFBFBFB7B7B7ADADAD9696
        96969696ADADAD9393937F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5F5F5F4B
        4B4B7A7A7A3F3F3F0000979797EAEAEA9E9E9ECECECEEBEBEBBDC7BDAACAAA50
        5AD93131EDB7B7B7A4A4A48D8D8DB0B0B0B0B0B0848484969696B1B1B1898989
        8484847F7F7F7F7F7F7F7F7F5F5F5F4F4F4F9898987E7E7E00008F8F8FE0E0E0
        BBBBBB939393A9A9A988BF883BEB3B88BF88A9A9A9939393A6A6A6BFBFBFBFBF
        BF8383836F6F6F757575666666A5A5A5A3A3A39393938585857F7F7F60606042
        4242ADADADBEBEBE0000A0A0A0A1A1A19F9F9FBBBBBBA2A2A29F9F9F9D9D9D88
        8888838383BFBFBFBFBFBF7F7F7F595959878787B4B4B4EEEEEE373737969696
        9F9F9F9D9D9D9F9F9F9E9E9E606060555555BEBEBEBEBEBE0000BEBEBEB8B8B8
        AEAEAE999999969696C0C0C0AFAFAF8E8E8E8080807777772F2F2F898989BFBF
        BFFFDBDBFF3F3FFFABABABABAB414141999999AFAFAF999999919191A6A6A6A3
        A3A3BEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBBBBBBB4B4B48E8E8EA5A5A5B4
        B4B4B8B8B8878787A8A8A8F1F1F1FF5C5CFF5959FFE0E0FFD0D0FCF2F2343434
        7676768D8D8DABABABBABABABEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEAAAAAA979797AAAAAAAEAEAEA5A5A5CFCFCFFFFF
        FFFF9F9FFF8787FF5F5FFFD7D7C7C7C75858589B9B9BBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEA5A5A5A1A1A1919191A2A2A2F1F1F1FF8F8FFFB9B9FFAEAEFF6F6FFBF2F2
        BDBDBD6161619C9C9CBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBABABAB0B0B0919191C5C5
        C5FFD9D9FF3737FF8888FFC7C7FFFBFBFAFAFAC3C3C34D4D4DABABABBEBEBEBE
        BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBCBCBC969696C8C6C6F8F0F0FFE0E0FFCFCFFF4040
        FF7575FEFEFECFCFCF333333474747BEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BE9C9C9CC3C3C3F5A0A0FF6767FFF5F5F8F8F8DADADAB6B6B69B9B9BA2A2A2BE
        BEBEBEBEBEBEBEBE0000BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB9B9B9A1A1A1C3C3C3F7F7F7DBDBDB
        ACACACA1A1A1A4A4A4BABABABEBEBEBEBEBEBEBEBEBEBEBE0000BEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEB9B9B99D9D9D949494929292B2B2B2B8B8B8BEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBE0000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btImprimirPedidoClick
    end
    object btEmitirNFCe: TBitBtn
      Left = 401
      Top = 5
      Width = 155
      Height = 41
      Hint = 'Emitir Nota Fiscal Consumidor'
      Anchors = [akTop, akRight]
      Caption = 'NFCe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC9D9A9A898687FF00FFFF00
        FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7B5B6F0EFEFF4F3F3AAA7A7
        9D9A9A4241424644456E6C6D999797BCBBBBDAD9D9E0E0E0C9C7C7A3A0A1FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989697A9A5A6E3E2E2FFFEFEFC
        FBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A2A2C4745476D6A6C9A9898
        C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FFFF00FF9A9899D8D5D5FCFB
        FBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F805453543332341E1E1F16
        16171A1A1C29292B454445736F70918F8FFF00FFFF00FFFF00FF8E8A8BC4C1C1
        F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B79896978986878C8A8A9A9798A5A1
        A39F9D9D878686605F603D3C3D2222231415162B2A2C8A8788FF00FFFF00FFFF
        00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD969293A6A4A4C7C6C6A4A1A1
        928F8F8B88898884868B8989969293A19F9EA19F9F918F906A696A5151528B89
        89FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5A5939091A7A5A5CAC9CAD5
        D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F8B8C8A8788898687918E8E
        9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B9E9C9D939191A9A7A7C7C7
        C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEBEBE0DEDECFCECEBFBDBDAF
        ACACA19F9F9592928C8A8A8A8788868283FF00FFFF00FFFF00FF8E8A8BAAA7A9
        C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3B5B2B4B6AAB4C4C1C2D8D7
        D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7A7928F90FF00FFFF00FFFF
        00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7D7D7F4F3F3AFAAAC999E98
        66B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCBD1D1D1D1D1D1CFCFCF9A99
        99FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCECECECECEDEDEDEE3E2E2A4
        A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0ADAF9F9D9D9591929A9798
        ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FFFF00FFA19FA0BBBABACAC9
        C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7E7E5E3E3E2E2E2E1E1E1D9
        D9D9CECECE000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999BABABAD3D1D1DEDDDDE1E0
        E0DEDEDEDCDCDCDDDDDDD7D7D7000415A7A4A5033DFFFF00FF010929FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4F3F2D9D5D4AAA7A7A7A9A9
        B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697000B37033CFFFF00FF033D
        FF022096FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE9CECCFFE3D9FF
        DDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0D0D0B8B7B8FF00FF000A32
        FF00FFFF00FFFF00FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBAA4FFB79FFCB099E5C5C1FF
        00FFFF00FF00000200030C000000000208021D850338FEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB4
        9CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E603
        36FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FFE5D8FFD8C9FFCFC0FFC9B7
        FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFE2D5FF
        D8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF00FFFF00FFFF00FF000000
        000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBBA5F8AF9AF8AF9AFF00FFFF
        00FFFF00FF000415FF00FF033DFFFF00FF010929FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0FEC9B7FEC2ADFFBDA6F8AF
        9AFF00FFFF00FFFF00FFFF00FF000B37033CFFFF00FF033DFF022096FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FFE5D8FFDECEFFD5C5FFCEBB
        FFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF000A32FF00FFFF00FFFF00
        FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DE1BDB8E0B7B2E0B5ADE0
        B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FF000002
        00030C000000000208021D850338FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E60336FF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btEmitirNFCeClick
    end
    object btSair: TBitBtn
      Left = 562
      Top = 28
      Width = 155
      Height = 41
      Hint = 'Fechar janela atual'
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333388888888888F333301BBBBBBBB033333883F3333338F3333011BBBBBBB
        0333338F83F333338F33330111BBBBBB0333338F383F33338F333301110BBBBB
        0333338F338F33338F333301110BBBBB0333338F338F33338F333301110BBBBB
        0333338F338F33338F3F3301110BBBBB0393338F338F33338FF83301110BBBBB
        0993338F338F3F338F883301110BB9BB9993338F338FF8F3F883330111B0B9B9
        9933338F338838FF88333301110BB9999333338F338F38F88F333301110BB999
        0333338F3F8F38888F333301E10BB9999933338F8F8F388888333301EE0BBBBB
        0333338F888FFFFF8F3333000000000003333388888888888333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btSairClick
    end
    object btImprimirEtiquetas: TBitBtn
      Left = 240
      Top = 48
      Width = 155
      Height = 41
      Hint = 'Imprimir etiquetas do pedido'
      Anchors = [akTop, akRight]
      Caption = 'Etiquetas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666666666666666666666666666666666666600000000
        000000000000000066666660FFFFFFFFFFFFFFFFFFFFFFFF0666660FFFFFFFFF
        FFFFFFFFFFFFFFFFF066660FFFFFFFFFFFFFFFFFFFFFFFFFF066660FFFFF00FF
        FF0F00FF00F000FFF066660FFF00FFF00F0FFF0F0FFFFF0FF066660FFFFFFFFF
        FFFFFFFFFFFFFFFFF066660FFFFFFFFFFFFFFFFFFFFFFFFFF066660FFF00F0FF
        FF00F0FF00FFF0FFF066660FFF0FF00F00FFFFF00FF00FFFF066660FFFFFFFFF
        FFFFFFFFFFFFFFFFF0666660FFFFFFFFFFFFFFFFFFFFFFFF0666666600000000
        0000000000000000666666666666666666666666666666666666666600000000
        000000000000000066666660FFFFFFFFFFFFFFFFFFFFFFFF0666660FFFFFFFFF
        FFFFFFFFFFFFFFFFF066660FFFFFFFFFFFFFFFFFFFFFFFFFF066660FFFFF00FF
        FF0F000F00F0000FF066660FFF00FFF0000FFF0F0FFFFF0FF066660FFFFFFFFF
        FFFFFFFFFFFFFFFFF066660FFFFFFFFFFFFFFFFFFFFFFFFFF066660FFF0000FF
        FF0000FF000FF0FFF066660FFF0FF00F000FFFF00FF00FFFF066660FFFFFFFFF
        FFFFFFFFFFFFFFFFF0666660FFFFFFFFFFFFFFFFFFFFFFFF0666666600000000
        0000000000000000666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btImprimirEtiquetasClick
    end
    object btCancelar: TBitBtn
      Left = 401
      Top = 48
      Width = 155
      Height = 41
      Hint = 'Cancelar pedido, NFCe e transa'#231#227'o de cart'#227'o'
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000077788777777777777000000077D55877777D87777000000077D5
        558777D558777000000077D555587D55558770000000777D5555855555877000
        00007777D555555558777000000077777D555555877770000000777777555558
        777770000000777777D5555877777000000077777D5555587777700000007777
        D5558555877770000000777D55587D55587770000000777D558777D555877000
        00007777D577777D555770000000777777777777D5D770000000777777777777
        777770000000}
      TabOrder = 4
      OnClick = btCancelarClick
    end
  end
end
