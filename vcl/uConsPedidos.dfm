object FuConsPedidos: TFuConsPedidos
  Left = 0
  Top = 0
  Caption = 'FuConsPedidos'
  ClientHeight = 485
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 412
    Align = alClient
    TabOrder = 0
    object GridPed: TDBGrid
      Left = 1
      Top = 1
      Width = 712
      Height = 410
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
          Expanded = False
          FieldName = 'ZC_DataHora'
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
          Width = 232
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Lanctos'
          Title.Alignment = taRightJustify
          Title.Caption = 'Lctos'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZC_MeioPagto'
          Title.Alignment = taCenter
          Title.Caption = 'Pagto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NrNFCe'
          Title.Alignment = taCenter
          Title.Caption = 'Nr NFCe'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SrNFCe'
          Title.Alignment = taCenter
          Title.Caption = 'Ser'
          Width = 28
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 714
    Height = 73
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object NavPed: TDBNavigator
      Left = 8
      Top = 6
      Width = 140
      Height = 33
      DataSource = uDM.DSPedidos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object btImprimePed: TBitBtn
      Left = 160
      Top = 6
      Width = 153
      Height = 35
      Caption = 'Imprimir pedido'
      TabOrder = 1
      OnClick = btImprimePedClick
    end
  end
end
