object FViborStation: TFViborStation
  Left = 3
  Top = 125
  Width = 1277
  Height = 600
  Caption = #1042#1099#1073#1086#1088' '#1089#1090#1072#1085#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1269
    Height = 504
    Align = alClient
    TabOrder = 0
    object Sg: TStringGrid
      Left = 1
      Top = 1
      Width = 1267
      Height = 502
      Align = alClient
      ColCount = 6
      RowCount = 2
      TabOrder = 0
    end
  end
  object Pbutton: TPanel
    Left = 0
    Top = 504
    Width = 1269
    Height = 62
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 104
      Top = 16
      Width = 185
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1089#1090#1072#1085#1094#1080#1080' '#1074' '#1089#1087#1080#1089#1082#1077
    end
    object BtOk: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 49
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 0
      OnClick = BtOkClick
    end
    object btCansel: TButton
      Left = 312
      Top = 8
      Width = 137
      Height = 49
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 1
      OnClick = btCanselClick
    end
    object SeNomStation: TSpinEdit
      Left = 104
      Top = 32
      Width = 185
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 1
    end
  end
end
