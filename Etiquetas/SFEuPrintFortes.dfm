object FSFEuPrintFortes: TFSFEuPrintFortes
  Left = 0
  Top = 0
  Caption = 'FSFEuPrintFortes'
  ClientHeight = 451
  ClientWidth = 857
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLEtiqLanche: TRLReport
    Left = 8
    Top = 8
    Width = 416
    Height = 208
    Margins.LeftMargin = 2.000000000000000000
    Margins.TopMargin = 3.000000000000000000
    Margins.RightMargin = 2.000000000000000000
    Margins.BottomMargin = 3.000000000000000000
    DataSource = uDM.DSPedItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 110.000000000000000000
    PageSetup.PaperHeight = 55.000000000000000000
    RecordRange = rrCurrentOnly
    BeforePrint = RLEtiqLancheBeforePrint
    object RLDetLanche: TRLBand
      Left = 8
      Top = 42
      Width = 400
      Height = 152
      AutoExpand = False
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBMemo1: TRLDBMemo
        Left = 23
        Top = 123
        Width = 373
        Height = 12
        Behavior = [beSiteExpander]
        DataField = 'Observacao'
        DataSource = uDM.DSPedItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLPanel3: TRLPanel
        Left = 1
        Top = 1
        Width = 398
        Height = 18
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText4: TRLDBText
          Left = 148
          Top = 0
          Width = 102
          Height = 18
          Align = faTopOnly
          Alignment = taCenter
          DataField = 'ZC_Descricao'
          DataSource = uDM.DSPedItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object RLPanel4: TRLPanel
        Left = 1
        Top = 19
        Width = 398
        Height = 100
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLPanel5: TRLPanel
          Left = 0
          Top = 0
          Width = 133
          Height = 83
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object RLSem: TRLMemo
            Left = 16
            Top = 2
            Width = 112
            Height = 12
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLNadaSem: TRLImage
            Left = 20
            Top = 24
            Width = 100
            Height = 50
            Picture.Data = {
              07544269746D61709E0A0000424D9E0A00000000000076000000280000006400
              0000320000000100040000000000280A00000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888000088888888FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF8888888800008888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888880000F888
              88888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF88888888888F0000FFF88888888888FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888
              88888FFF0000FFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFF0000FFFFFFF88888
              888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF88888888888FFFFFFF0000FFFFFFFFF88888888888FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFF
              0000FFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF0000FFFFFFFFFFFFF8888888
              8888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888
              888FFFFFFFFFFFFF0000FFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF88888888888FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFF888888888
              88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888
              8FFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF88888888888
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFF
              FF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF888888888888FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888F
              FFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888FFFFFFFFFFF88888888888F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF888888888888FFFFFF888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888FF8
              88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888888888888FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF888888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF88888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888
              888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888888888888FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF88888888888FFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFF
              FF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFF88888888888FFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888
              888888FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFF
              88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFF
              FFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88
              888888888FFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF8888888
              8888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888
              8888888FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFF88888888888FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF0000FFFFFFFFFFF888888888
              88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888
              88888FFFFFFFFFFF0000FFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFF0000FFFF
              FFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF88888888888FFFFFFF0000FFFFF88888888888FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888
              888FFFFF0000FFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFF0000F88888888888
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF88888888888F00008888888888FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888
              000088888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888880000888888FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF8888880000}
            Visible = False
          end
          object RLAngleLabel1: TRLAngleLabel
            Left = 1
            Top = 8
            Width = 14
            Height = 28
            Angle = 90.000000000000000000
            Caption = 'Sem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel6: TRLPanel
          Left = 133
          Top = 0
          Width = 133
          Height = 83
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object RLMais: TRLMemo
            Left = 16
            Top = 2
            Width = 112
            Height = 12
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLNadaMais: TRLImage
            Left = 20
            Top = 24
            Width = 100
            Height = 50
            Picture.Data = {
              07544269746D61709E0A0000424D9E0A00000000000076000000280000006400
              0000320000000100040000000000280A00000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888000088888888FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF8888888800008888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888880000F888
              88888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF88888888888F0000FFF88888888888FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888
              88888FFF0000FFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFF0000FFFFFFF88888
              888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF88888888888FFFFFFF0000FFFFFFFFF88888888888FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFF
              0000FFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF0000FFFFFFFFFFFFF8888888
              8888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888
              888FFFFFFFFFFFFF0000FFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF88888888888FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFF888888888
              88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888
              8FFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF88888888888
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFF
              FF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF888888888888FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888F
              FFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888FFFFFFFFFFF88888888888F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF888888888888FFFFFF888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888FF8
              88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888888888888FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF888888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF88888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888
              888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888888888888FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF88888888888FFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFF
              FF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFF88888888888FFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888
              888888FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFF
              88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFF
              FFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88
              888888888FFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF8888888
              8888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888
              8888888FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFF88888888888FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF0000FFFFFFFFFFF888888888
              88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888
              88888FFFFFFFFFFF0000FFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFF0000FFFF
              FFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF88888888888FFFFFFF0000FFFFF88888888888FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888
              888FFFFF0000FFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFF0000F88888888888
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF88888888888F00008888888888FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888
              000088888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888880000888888FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF8888880000}
            Visible = False
          end
          object RLAngleLabel2: TRLAngleLabel
            Left = 1
            Top = 8
            Width = 14
            Height = 46
            Angle = 90.000000000000000000
            Caption = 'Mais [+]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLPanel7: TRLPanel
          Left = 266
          Top = 0
          Width = 133
          Height = 83
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLMenos: TRLMemo
            Left = 16
            Top = 2
            Width = 112
            Height = 12
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLNadaMenos: TRLImage
            Left = 20
            Top = 24
            Width = 100
            Height = 50
            Picture.Data = {
              07544269746D61709E0A0000424D9E0A00000000000076000000280000006400
              0000320000000100040000000000280A00000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888000088888888FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF8888888800008888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888880000F888
              88888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF88888888888F0000FFF88888888888FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888
              88888FFF0000FFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFF0000FFFFFFF88888
              888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF88888888888FFFFFFF0000FFFFFFFFF88888888888FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFF
              0000FFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF0000FFFFFFFFFFFFF8888888
              8888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888
              888FFFFFFFFFFFFF0000FFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF88888888888FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFF888888888
              88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888
              8FFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF88888888888
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFF
              FF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF888888888888FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888F
              FFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888FFFFFFFFFFF88888888888F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF888888888888FFFFFF888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888888888FF8
              88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888888888888FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF888888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF88888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888
              888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888888888888888FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF88888888888FFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFF
              FF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFF88888888888FFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888
              888888FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFF
              88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFF
              FFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88
              888888888FFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF8888888
              8888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888
              8888888FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFF88888888888FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF88888888888FFFFFFFFFFFFF0000FFFFFFFFFFF888888888
              88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888
              88888FFFFFFFFFFF0000FFFFFFFFF88888888888FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFFFFFFFF0000FFFF
              FFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF88888888888FFFFFFF0000FFFFF88888888888FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888
              888FFFFF0000FFF88888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888888888FFF0000F88888888888
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF88888888888F00008888888888FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888888888
              000088888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888880000888888FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF8888880000}
            Visible = False
          end
          object RLAngleLabel3: TRLAngleLabel
            Left = 1
            Top = 8
            Width = 14
            Height = 56
            Angle = 90.000000000000000000
            Caption = 'Menos [-]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLLabPrensado: TRLLabel
          Left = 6
          Top = 83
          Width = 67
          Height = 15
          Caption = 'PRENSADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object RLLabCortado: TRLLabel
          Left = 80
          Top = 83
          Width = 60
          Height = 15
          Caption = 'CORTADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object RLDBText8: TRLDBText
          Left = 164
          Top = 83
          Width = 231
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'NomeCliente'
          DataSource = uDM.DSPedidos
          Text = ''
        end
      end
      object RLAngleLabel4: TRLAngleLabel
        Left = 7
        Top = 123
        Width = 14
        Height = 25
        Angle = 90.000000000000000000
        Caption = 'Obs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLCabLanche: TRLBand
      Left = 8
      Top = 11
      Width = 400
      Height = 31
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLPanel2: TRLPanel
        Left = 1
        Top = 17
        Width = 398
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText1: TRLDBText
          Left = 0
          Top = 0
          Width = 100
          Height = 14
          Align = faLeftTop
          DataField = 'ZC_PedLcto'
          DataSource = uDM.DSPedItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Pedido: '
        end
        object RLDBText2: TRLDBText
          Left = 300
          Top = 0
          Width = 98
          Height = 14
          Align = faRightTop
          Alignment = taRightJustify
          DataField = 'ZC_DataHora'
          DataSource = uDM.DSPedidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Dt/Hr: '
        end
        object RLLabel1: TRLLabel
          Left = 173
          Top = -1
          Width = 52
          Height = 16
          Align = faCenter
          Alignment = taCenter
          Caption = 'Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLPanel1: TRLPanel
        Left = 1
        Top = 1
        Width = 398
        Height = 16
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText3: TRLDBText
          Left = 179
          Top = 0
          Width = 40
          Height = 16
          Alignment = taCenter
          DataField = 'nome'
          DataSource = uDM.DSSisPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
    end
  end
  object RLEtiqBebida: TRLReport
    Left = 196
    Top = 222
    Width = 416
    Height = 208
    Margins.LeftMargin = 2.000000000000000000
    Margins.TopMargin = 3.000000000000000000
    Margins.RightMargin = 2.000000000000000000
    Margins.BottomMargin = 3.000000000000000000
    DataSource = uDM.DSPedItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 110.000000000000000000
    PageSetup.PaperHeight = 55.000000000000000000
    object RLCabBeb: TRLBand
      Left = 8
      Top = 11
      Width = 400
      Height = 31
      BandType = btHeader
      object RLPanel8: TRLPanel
        Left = 0
        Top = 16
        Width = 400
        Height = 15
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText5: TRLDBText
          Left = 0
          Top = 0
          Width = 78
          Height = 14
          Align = faLeftTop
          DataField = 'Numero'
          DataSource = uDM.DSPedItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Pedido: '
        end
        object RLDBText6: TRLDBText
          Left = 302
          Top = 0
          Width = 98
          Height = 14
          Align = faRightTop
          Alignment = taRightJustify
          DataField = 'ZC_DataHora'
          DataSource = uDM.DSPedidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Dt/Hr: '
        end
        object RLLabel2: TRLLabel
          Left = 172
          Top = -1
          Width = 56
          Height = 16
          Align = faCenter
          Alignment = taCenter
          Caption = 'Bebidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLPanel9: TRLPanel
        Left = 0
        Top = 0
        Width = 400
        Height = 16
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText7: TRLDBText
          Left = 179
          Top = 0
          Width = 40
          Height = 16
          Alignment = taCenter
          DataField = 'nome'
          DataSource = uDM.DSSisPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
    end
    object RLDetBebida: TRLBand
      Left = 8
      Top = 42
      Width = 400
      Height = 16
      object RLDBText10: TRLDBText
        Left = 20
        Top = 0
        Width = 39
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Quant'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 64
        Top = 0
        Width = 85
        Height = 16
        DataField = 'ZC_Descricao'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 248
        Top = 0
        Width = 146
        Height = 16
        AutoSize = False
        DataField = 'Observacao'
        DataSource = uDM.DSPedItens
        Text = ''
      end
    end
    object RLBebFooter: TRLBand
      Left = 8
      Top = 74
      Width = 400
      Height = 16
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
    end
    object RLBebColFooter: TRLBand
      Left = 8
      Top = 58
      Width = 400
      Height = 16
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBResult1: TRLDBResult
        Left = 20
        Top = 0
        Width = 110
        Height = 16
        DataField = 'Quant'
        DataSource = uDM.DSPedItens
        Info = riSum
        Text = '# itens'
      end
      object RLDBText9: TRLDBText
        Left = 164
        Top = -2
        Width = 231
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'NomeCliente'
        DataSource = uDM.DSPedidos
        Text = ''
      end
    end
  end
end
