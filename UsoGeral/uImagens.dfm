object FuImagens: TFuImagens
  Left = 751
  Top = 140
  Width = 742
  Height = 489
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Logotipos e imagens utilizadas pelo sistema'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000AAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAAAA00000000000
    0000AAA00AA000AAA00AAA00000000000000AA0AA0A0AA0A0AA0AA0000000000
    0000AA0AA0A0AA0AAAA0AA00000000000000AA0AA0A0AA0AA00AAA0000000000
    0000AA0AA0A000AA0AAAAA00000000000000AA0AA0A0AA0A0AAAAA0000000000
    0000AA0AA0A0AA0A0AA0AA00000000000000AA0AA0A000AAA00AAA0000000000
    00000AAAAAAAAAAAAAAAA00000000000000000AAAA0000000000000000000000
    00000000A0AAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAAAA0000000
    00000000AAA00AA000AAA00AAA00000000000000AA0AA0A0AA0A0AA0AA000000
    00000000AA0AA0A0AA0AAAA0AA00000000000000AA0AA0A0AA0AA00AAA000000
    00000000AA0AA0A000AA0AAAAA00000000000000AA0AA0A0AA0A0AAAAA000000
    00000000AA0AA0A0AA0A0AA0AA00000000000000AA0AA0A000AAA00AAA000000
    000000000AAAAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAA00000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000FFFF80007FFF00003FFE00
    001FFE00001FFE00001FFE00001FFE00001FFE00001FFE00001FFE00001FFF00
    003FFF80000FFFC00007FFF00003FFE00001FFE00001FFE00001FFE00001FFE0
    0001FFE00001FFE00001FFE00001FFF00003FFF80007FFFC000FFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 165
    Height = 410
    Align = alLeft
    Color = 14342867
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 121
      Height = 16
      Caption = 'Indique o arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 36
      Width = 25
      Height = 13
      Caption = 'Drive'
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 27
      Height = 13
      Caption = 'Pasta'
    end
    object Label11: TLabel
      Left = 8
      Top = 240
      Width = 72
      Height = 13
      Caption = 'Arquivo (*.bmp)'
    end
    object Drive: TDriveComboBox
      Left = 8
      Top = 48
      Width = 145
      Height = 19
      Hint = 'Unidade, drive onde deve ser pesquisada a imagem'
      Color = 13631229
      DirList = Diret
      TabOrder = 0
      OnEnter = DriveEnter
    end
    object Diret: TDirectoryListBox
      Left = 8
      Top = 84
      Width = 145
      Height = 153
      Hint = 'Pasta, sub-pasta onde a imagem est'#225' localizada'
      Color = 13631229
      FileList = Lista
      ItemHeight = 16
      TabOrder = 1
      OnEnter = DriveEnter
    end
    object Lista: TFileListBox
      Left = 8
      Top = 252
      Width = 145
      Height = 157
      Hint = 'Duplo Click para utilizar a figura apontada'
      Color = 13631229
      ItemHeight = 13
      Mask = '*.bmp'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnDblClick = ListaDblClick
      OnEnter = DriveEnter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 410
    Width = 726
    Height = 41
    Align = alBottom
    Color = 12105899
    TabOrder = 0
    DesignSize = (
      726
      41)
    object BtSaveExit: TBitBtn
      Left = 505
      Top = 8
      Width = 105
      Height = 25
      Hint = 'Salvar os dados e sair da rotina'
      Anchors = [akTop, akRight]
      Caption = '&Salvar && Sair'
      TabOrder = 0
      OnClick = BtSaveExitClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555005555
        5555555555FF55555555555555A0055555555555558FF555555555555AAA0555
        555555555888F55555555555AAAAA0555555555588888F555555555AAA5AAA05
        55555558885888F55555550AA555AAA0555555F88555888F555550A555555AAA
        05555F8555555888F55555555500555AA0055555558855588FF5555555200555
        AAA5555555788555888555555222055555555555577785555555555522222055
        5555555577777855555555522252220555555557775777855555550225552220
        5555558775557778555550255555522205555875555557778555555555555552
        2005555555555557788555555555555522255555555555557775}
      NumGlyphs = 2
    end
    object BtCancExit: TBitBtn
      Left = 617
      Top = 8
      Width = 105
      Height = 25
      Hint = 'Cancelar as altera'#231#245'es e sair da rotina'
      Anchors = [akTop, akRight]
      Caption = '&Cancelar && Sair'
      TabOrder = 1
      OnClick = BtCancExitClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F88888FFF333333999999999
        33333338888FF388FF3333993333339993333388F33333388FF3399993333339
        993338888F33333388F3393999333333993338F888F3333338FF993399933333
        399388F3888F3333388F993339993333399388F33888F333388F993333999333
        399388F333888F33388F993333399933399388F333388FF3388F993333339993
        399388F33333888FF883399333333999393338FF33333888F8F3399933333399
        9933388FF3333388883333999333333993333388FFF33FF88333333999999999
        3333333888FFF888333333333999993333333333388888333333}
      NumGlyphs = 2
    end
    object BtPrior: TBitBtn
      Left = 8
      Top = 8
      Width = 93
      Height = 25
      Caption = 'Anterior'
      TabOrder = 2
      OnClick = BtPriorClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333FFFF33333333333300033333333333FF777F333333333300
        000333333333FF77337F3333333300000003333333FF7733337F333333000000
        00033333FF773333337F333300000000000333FF77333333337F330000000000
        0003FF7733333333337F0000000000000003773333333333337F000000000000
        000377FF33333333337F33000000000000033377FF333333337F333300000000
        0003333377FF3333337F333333000000000333333377FF33337F333333330000
        00033333333377FF337F3333333333000003333333333377FF7F333333333333
        0003333333333333777333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BtNext: TBitBtn
      Left = 108
      Top = 8
      Width = 93
      Height = 25
      Caption = 'Pr'#243'xima'
      TabOrder = 3
      OnClick = BtNextClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFF33333333333330003333333333333777FF3333333333300000333333
        333337F377FF33333333300000003333333337F33377FF333333300000000033
        333337F3333377FF3333300000000000333337F333333377FF33300000000000
        003337F33333333377FF300000000000000037F3333333333377300000000000
        000037F333333333FF77300000000000003337F3333333FF7733300000000000
        333337F33333FF773333300000000033333337F333FF77333333300000003333
        333337F3FF7733333333300000333333333337FF773333333333300033333333
        3333377733333333333333333333333333333333333333333333}
      Layout = blGlyphRight
      NumGlyphs = 2
    end
  end
  object Panel5: TPanel
    Left = 165
    Top = 0
    Width = 561
    Height = 410
    Align = alClient
    TabOrder = 2
    object DbTextEmpresa: TDBText
      Left = 1
      Top = 1
      Width = 559
      Height = 17
      Align = alTop
      Alignment = taCenter
      Color = 12615680
      DataField = 'ExibeAll'
      DataSource = SEmpFil
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object TabNB: TTabbedNotebook
      Left = 1
      Top = 18
      Width = 559
      Height = 391
      Hint = 'Guia de controle'
      Align = alClient
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clBtnText
      TabFont.Height = -11
      TabFont.Name = 'MS Sans Serif'
      TabFont.Style = [fsBold]
      TabOrder = 0
      OnChange = TabNBChange
      object TTabPage
        Left = 4
        Top = 24
        Caption = 'Imagem &Inicial'
        object PanTN0: TPanel
          Left = 0
          Top = 0
          Width = 551
          Height = 363
          Align = alClient
          BevelOuter = bvLowered
          ParentColor = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object Label6: TLabel
            Left = 20
            Top = 228
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Propor'#231#227'o: 1 X 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText0: TDBText
            Left = 370
            Top = 228
            Width = 50
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'InicialStEx'
            DataSource = SImag
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 4
            Top = 4
            Width = 209
            Height = 13
            Caption = 'Imagens utilizada na inicializa'#231#227'o do sistema'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Img0: TDBImage
            Left = 20
            Top = 24
            Width = 400
            Height = 200
            Hint = 'Duplo CLICK para Dimensionado / Normal'
            Color = clBtnFace
            DataField = 'Inicial'
            DataSource = SImag
            TabOrder = 0
            OnDblClick = Img0DblClick
          end
        end
      end
      object TTabPage
        Left = 4
        Top = 24
        Caption = '&Duplicata'
        object PanTN1: TPanel
          Left = 0
          Top = 0
          Width = 551
          Height = 363
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object TDBText
            Left = 614
            Top = 24
            Width = 5
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'DSt2Ex'
            DataSource = SImag
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 4
            Top = 4
            Width = 118
            Height = 13
            Caption = 'Logotipo para Duplicatas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 20
            Top = 228
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Propor'#231#227'o: 1 X 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText1: TDBText
            Left = 370
            Top = 228
            Width = 50
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'DupStEx'
            DataSource = SImag
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Img1: TDBImage
            Left = 20
            Top = 24
            Width = 400
            Height = 200
            Hint = 'Duplo CLICK para Dimensionado / Normal'
            Color = clBtnFace
            DataField = 'Dup'
            DataSource = SImag
            TabOrder = 0
            OnDblClick = Img1DblClick
          end
        end
      end
      object TTabPage
        Left = 4
        Top = 24
        Caption = '&Ordens Servi'#231'os'
        object PanTN2: TPanel
          Left = 0
          Top = 0
          Width = 551
          Height = 363
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label9: TLabel
            Left = 20
            Top = 228
            Width = 89
            Height = 13
            Caption = 'Propor'#231#227'o: 1 X 1,5'
          end
          object DBText2: TDBText
            Left = 270
            Top = 228
            Width = 50
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'OSStEx'
            DataSource = SImag
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 4
            Top = 4
            Width = 154
            Height = 13
            Caption = 'Logotipo para Ordens de servi'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Img2: TDBImage
            Left = 20
            Top = 24
            Width = 300
            Height = 200
            Hint = 'Duplo CLICK para Dimensionado / Normal'
            Color = clBtnFace
            DataField = 'OS'
            DataSource = SImag
            TabOrder = 0
            OnDblClick = Img2DblClick
          end
        end
      end
      object TTabPage
        Left = 4
        Top = 24
        Caption = 'Or'#231'a&mentos'
        object PanTN3: TPanel
          Left = 0
          Top = 0
          Width = 551
          Height = 363
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 549
            Height = 361
            Align = alClient
            BevelOuter = bvNone
            ParentColor = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Label20: TLabel
              Left = 4
              Top = 4
              Width = 125
              Height = 13
              Caption = 'Logotipo para Or'#231'amentos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 20
              Top = 228
              Width = 89
              Height = 13
              Caption = 'Propor'#231#227'o: 1 X 1,5'
            end
            object DBText3: TDBText
              Left = 270
              Top = 228
              Width = 50
              Height = 13
              Alignment = taRightJustify
              AutoSize = True
              DataField = 'OrcStEx'
              DataSource = SImag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Img3: TDBImage
              Left = 20
              Top = 24
              Width = 300
              Height = 200
              Hint = 'Duplo CLICK para Dimensionado / Normal'
              Color = clBtnFace
              DataField = 'Orc'
              DataSource = SImag
              TabOrder = 0
              OnDblClick = Img3DblClick
            end
          end
        end
      end
      object TTabPage
        Left = 4
        Top = 24
        Caption = '&Etiquetas'
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 551
          Height = 363
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object PanEtq1: TPanel
            Left = 1
            Top = 1
            Width = 549
            Height = 124
            Align = alTop
            TabOrder = 0
            object Label3: TLabel
              Left = 12
              Top = 52
              Width = 48
              Height = 16
              Caption = 'Logo 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 137
              Top = 16
              Width = 80
              Height = 13
              Alignment = taRightJustify
              Caption = 'Propor'#231#227'o: 1 X 2'
            end
            object DBText5: TDBText
              Left = 167
              Top = 100
              Width = 50
              Height = 13
              Alignment = taRightJustify
              AutoSize = True
              DataField = 'Etiq1StEx'
              DataSource = SImag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Img4_1: TDBImage
              Left = 220
              Top = 14
              Width = 200
              Height = 100
              Hint = 'Duplo CLICK para Dimensionado / Normal'
              Color = clBtnFace
              DataField = 'Etiq1'
              DataSource = SImag
              TabOrder = 0
              OnDblClick = Img4_1DblClick
            end
            object Bt1: TBitBtn
              Left = 12
              Top = 72
              Width = 109
              Height = 25
              Hint = 'Obter imagem correspondente'
              Caption = 'Obter imagem &1'
              TabOrder = 1
              OnClick = Bt1Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333333333333333333333333333FFF3333333333333
                00333333333333FF77F3333333333300903333333333FF773733333333330099
                0333333333FF77337F3333333300999903333333FF7733337333333700999990
                3333333777333337F3333333099999903333333373F333373333333330999903
                33333333F7F3337F33333333709999033333333F773FF3733333333709009033
                333333F7737737F3333333709073003333333F77377377F33333370907333733
                33333773773337333333309073333333333337F7733333333333370733333333
                3333377733333333333333333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
          object PanEtq2: TPanel
            Left = 1
            Top = 125
            Width = 549
            Height = 113
            Align = alClient
            TabOrder = 1
            object Label5: TLabel
              Left = 12
              Top = 52
              Width = 48
              Height = 16
              Caption = 'Logo 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 137
              Top = 16
              Width = 80
              Height = 13
              Alignment = taRightJustify
              Caption = 'Propor'#231#227'o: 1 X 2'
            end
            object DBText6: TDBText
              Left = 167
              Top = 100
              Width = 50
              Height = 13
              Alignment = taRightJustify
              AutoSize = True
              DataField = 'Etiq2StEx'
              DataSource = SImag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Img4_2: TDBImage
              Left = 220
              Top = 14
              Width = 200
              Height = 100
              Hint = 'Duplo CLICK para Dimensionado / Normal'
              Color = clBtnFace
              DataField = 'Etiq2'
              DataSource = SImag
              TabOrder = 0
              OnDblClick = Img4_2DblClick
            end
            object Bt2: TBitBtn
              Left = 12
              Top = 72
              Width = 109
              Height = 25
              Hint = 'Obter imagem correspondente'
              Caption = 'Obter imagem &2'
              TabOrder = 1
              OnClick = Bt2Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333333333333333333333333333FFF3333333333333
                00333333333333FF77F3333333333300903333333333FF773733333333330099
                0333333333FF77337F3333333300999903333333FF7733337333333700999990
                3333333777333337F3333333099999903333333373F333373333333330999903
                33333333F7F3337F33333333709999033333333F773FF3733333333709009033
                333333F7737737F3333333709073003333333F77377377F33333370907333733
                33333773773337333333309073333333333337F7733333333333370733333333
                3333377733333333333333333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
          object PanEtq3: TPanel
            Left = 1
            Top = 238
            Width = 549
            Height = 124
            Align = alBottom
            TabOrder = 2
            object Label10: TLabel
              Left = 12
              Top = 52
              Width = 48
              Height = 16
              Caption = 'Logo 3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 137
              Top = 16
              Width = 80
              Height = 13
              Alignment = taRightJustify
              Caption = 'Propor'#231#227'o: 1 X 2'
            end
            object DBText7: TDBText
              Left = 167
              Top = 100
              Width = 50
              Height = 13
              Alignment = taRightJustify
              AutoSize = True
              DataField = 'Etiq3StEx'
              DataSource = SImag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Img4_3: TDBImage
              Left = 220
              Top = 14
              Width = 200
              Height = 100
              Hint = 'Duplo CLICK para Dimensionado / Normal'
              Color = clBtnFace
              DataField = 'Etiq3'
              DataSource = SImag
              TabOrder = 0
              OnDblClick = Img4_3DblClick
            end
            object Bt3: TBitBtn
              Left = 12
              Top = 72
              Width = 109
              Height = 25
              Hint = 'Obter imagem correspondente'
              Caption = 'Obter imagem &3'
              TabOrder = 1
              OnClick = Bt3Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333333333333333333333333333FFF3333333333333
                00333333333333FF77F3333333333300903333333333FF773733333333330099
                0333333333FF77337F3333333300999903333333FF7733337333333700999990
                3333333777333337F3333333099999903333333373F333373333333330999903
                33333333F7F3337F33333333709999033333333F773FF3733333333709009033
                333333F7737737F3333333709073003333333F77377377F33333370907333733
                33333773773337333333309073333333333337F7733333333333370733333333
                3333377733333333333333333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
        end
      end
    end
  end
  object Imag: TTable
    OnCalcFields = ImagCalcFields
    DatabaseName = 'Oficina'
    TableName = 'Imagens.DB'
    Left = 64
    Top = 332
    object ImagEmpFil: TSmallintField
      FieldName = 'EmpFil'
    end
    object ImagInicial: TGraphicField
      FieldName = 'Inicial'
      BlobType = ftGraphic
      Size = 10
    end
    object ImagInicialSt: TBooleanField
      FieldName = 'InicialSt'
    end
    object ImagDup: TGraphicField
      FieldName = 'Dup'
      BlobType = ftGraphic
      Size = 10
    end
    object ImagDupSt: TBooleanField
      FieldName = 'DupSt'
    end
    object ImagOS: TGraphicField
      FieldName = 'OS'
      BlobType = ftGraphic
      Size = 10
    end
    object ImagOSSt: TBooleanField
      FieldName = 'OSSt'
    end
    object ImagEtiq1: TGraphicField
      FieldName = 'Etiq1'
      BlobType = ftGraphic
      Size = 10
    end
    object ImagEtiq1St: TBooleanField
      FieldName = 'Etiq1St'
    end
    object ImagEtiq2: TGraphicField
      FieldName = 'Etiq2'
      BlobType = ftGraphic
      Size = 10
    end
    object ImagEtiq2St: TBooleanField
      FieldName = 'Etiq2St'
    end
    object ImagEtiq3: TGraphicField
      FieldName = 'Etiq3'
      BlobType = ftGraphic
      Size = 10
    end
    object ImagEtiq3St: TBooleanField
      FieldName = 'Etiq3St'
    end
    object ImagOrc: TGraphicField
      FieldName = 'Orc'
      BlobType = ftGraphic
      Size = 10
    end
    object ImagOrcSt: TBooleanField
      FieldName = 'OrcSt'
    end
    object ImagOrcStEx: TStringField
      FieldKind = fkCalculated
      FieldName = 'OrcStEx'
      Size = 15
      Calculated = True
    end
    object ImagDupStEx: TStringField
      FieldKind = fkCalculated
      FieldName = 'DupStEx'
      Size = 15
      Calculated = True
    end
    object ImagEtiq1StEx: TStringField
      FieldKind = fkCalculated
      FieldName = 'Etiq1StEx'
      Size = 15
      Calculated = True
    end
    object ImagEtiq2StEx: TStringField
      FieldKind = fkCalculated
      FieldName = 'Etiq2StEx'
      Size = 15
      Calculated = True
    end
    object ImagEtiq3StEx: TStringField
      FieldKind = fkCalculated
      FieldName = 'Etiq3StEx'
      Size = 15
      Calculated = True
    end
    object ImagOSStEx: TStringField
      FieldKind = fkCalculated
      FieldName = 'OSStEx'
      Size = 15
      Calculated = True
    end
    object ImagDST2Ex: TStringField
      FieldKind = fkCalculated
      FieldName = 'DST2Ex'
      Size = 1
      Calculated = True
    end
    object ImagInicialStEx: TStringField
      FieldKind = fkCalculated
      FieldName = 'InicialStEx'
      Size = 15
      Calculated = True
    end
  end
  object SImag: TDataSource
    DataSet = Imag
    Left = 92
    Top = 332
  end
  object EmpFil: TTable
    OnCalcFields = EmpFilCalcFields
    DatabaseName = 'UBSGeral'
    TableName = 'Tb02EFi.DB'
    Left = 64
    Top = 292
    object EmpFilCod: TSmallintField
      FieldName = 'Cod'
    end
    object EmpFilDenom: TStringField
      FieldName = 'Denom'
      Size = 50
    end
    object EmpFilAbrev: TStringField
      FieldName = 'Abrev'
      Size = 10
    end
    object EmpFilExibeAll: TStringField
      FieldKind = fkCalculated
      FieldName = 'ExibeAll'
      Size = 70
      Calculated = True
    end
  end
  object SEmpFil: TDataSource
    DataSet = EmpFil
    Left = 92
    Top = 292
  end
end
