object FormCryp: TFormCryp
  Left = 295
  Top = 292
  Width = 424
  Height = 159
  Caption = 'CrypForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 80
    Width = 161
    Height = 17
    Caption = 'Label1'
    Visible = False
  end
  object ButtonCryp: TButton
    Left = 24
    Top = 48
    Width = 91
    Height = 25
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = ButtonCrypClick
  end
  object ButtonReCryp: TButton
    Left = 296
    Top = 48
    Width = 89
    Height = 25
    Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = ButtonReCrypClick
  end
  object EditPass: TEdit
    Left = 16
    Top = 16
    Width = 377
    Height = 21
    Hint = #1055#1072#1088#1086#1083#1100
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 103
    Width = 408
    Height = 17
    Align = alBottom
    TabOrder = 3
  end
  object Button1: TButton
    Left = 296
    Top = 80
    Width = 75
    Height = 17
    Caption = 'Button1'
    TabOrder = 4
    Visible = False
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 144
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 200
    Top = 48
  end
end
