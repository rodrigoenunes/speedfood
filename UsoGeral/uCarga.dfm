object FCarga: TFCarga
  Left = 201
  Top = 108
  Cursor = crHourGlass
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Inicializa'#231#227'o'
  ClientHeight = 111
  ClientWidth = 286
  Color = 65534
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormShow
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 11
    Width = 229
    Height = 29
    Caption = 'Carregando m'#243'dulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Book Antiqua'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 28
    Top = 44
    Width = 147
    Height = 20
    Caption = 'Aguarde, por favor....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabCor: TLabel
    Left = 205
    Top = 44
    Width = 52
    Height = 20
    Alignment = taRightJustify
    Caption = 'LabCor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edInfo: TEditAlinh
    Left = 8
    Top = 80
    Width = 253
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    Text = 'edInfo'
    Alinhamento = taRightJustify
  end
end
