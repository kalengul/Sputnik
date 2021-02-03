object Form1: TForm1
  Left = 15
  Top = 0
  Width = 1255
  Height = 930
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PMapC: TPanel
    Left = 0
    Top = 27
    Width = 827
    Height = 415
    Align = alCustom
    TabOrder = 1
    object MapC: TPaintBox
      Left = 1
      Top = 1
      Width = 825
      Height = 413
      Align = alClient
      OnMouseDown = MapCMouseDown
      OnMouseMove = MapCMouseMove
    end
  end
  object PMapS: TPanel
    Left = 832
    Top = 35
    Width = 404
    Height = 404
    UseDockManager = False
    TabOrder = 0
    object MapS: TPaintBox
      Left = 1
      Top = 1
      Width = 402
      Height = 402
      Align = alClient
      OnMouseDown = MapSMouseDown
      OnMouseMove = MapSMouseMove
    end
  end
  object MeStation: TMemo
    Left = 744
    Top = 104
    Width = 217
    Height = 73
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
  end
  object MeSattelite: TMemo
    Left = 744
    Top = 32
    Width = 217
    Height = 73
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
  end
  object PInformation: TPanel
    Left = 0
    Top = 0
    Width = 1247
    Height = 25
    Align = alTop
    TabOrder = 4
    object LaSh: TLabel
      Left = 4
      Top = 5
      Width = 3
      Height = 13
    end
    object LaDl: TLabel
      Left = 161
      Top = 5
      Width = 3
      Height = 13
    end
    object LaKolSpytnik: TLabel
      Left = 341
      Top = 5
      Width = 22
      Height = 13
      Caption = #1092#1099#1074
    end
    object LaStation: TLabel
      Left = 493
      Top = 4
      Width = 45
      Height = 13
      Caption = 'LaStation'
    end
    object LaObTime: TLabel
      Left = 888
      Top = 8
      Width = 49
      Height = 13
      Caption = 'LaObTime'
    end
    object Date1: TDateTimePicker
      Left = 1032
      Top = 2
      Width = 186
      Height = 21
      Date = 40560.031414722220000000
      Time = 40560.031414722220000000
      TabOrder = 0
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 440
    Width = 1247
    Height = 436
    Align = alBottom
    TabOrder = 5
    object GbDvishSpytnik: TGroupBox
      Left = 936
      Top = 112
      Width = 273
      Height = 241
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1089#1087#1091#1090#1085#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      object LaTime: TLabel
        Left = 8
        Top = 101
        Width = 3
        Height = 13
      end
      object LeShagArgShir: TLabeledEdit
        Left = 56
        Top = 33
        Width = 169
        Height = 21
        EditLabel.Width = 131
        EditLabel.Height = 13
        EditLabel.Caption = #1064#1072#1075' '#1072#1088#1075#1091#1084#1077#1085#1090#1072' '#1096#1080#1088#1086#1090#1099' ('#176')'
        TabOrder = 0
        Text = '1'
        OnChange = LeShagArgShirChange
        OnKeyPress = LeVremiaKeyPress
      end
      object BtGo: TButton
        Left = 8
        Top = 152
        Width = 249
        Height = 25
        Caption = #1053#1072#1095#1072#1090#1100' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077
        TabOrder = 1
        OnClick = BtGoClick
      end
      object CbVisibletraektoria: TCheckBox
        Left = 8
        Top = 184
        Width = 169
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1088#1072#1077#1082#1090#1086#1088#1080#1080
        TabOrder = 2
      end
      object BtCleartraektory: TButton
        Left = 8
        Top = 208
        Width = 257
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1090#1088#1072#1077#1082#1090#1086#1088#1080#1080
        TabOrder = 3
        OnClick = BtCleartraektoryClick
      end
      object BtStop: TButton
        Left = 8
        Top = 152
        Width = 249
        Height = 25
        Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077
        TabOrder = 4
        Visible = False
        OnClick = BtStopClick
      end
      object LeVremia: TLabeledEdit
        Left = 56
        Top = 73
        Width = 169
        Height = 21
        EditLabel.Width = 82
        EditLabel.Height = 13
        EditLabel.Caption = #1064#1072#1075' '#1074#1088#1077#1084#1077#1085#1080' ('#1089')'
        Enabled = False
        TabOrder = 5
        OnChange = LeVremiaChange
        OnKeyPress = LeVremiaKeyPress
      end
      object LeZaderzka: TLabeledEdit
        Left = 48
        Top = 129
        Width = 193
        Height = 21
        EditLabel.Width = 152
        EditLabel.Height = 13
        EditLabel.Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1084#1077#1078#1076#1091' '#1096#1072#1075#1072#1084#1080' ('#1084#1089')'
        TabOrder = 6
        Text = '500'
        OnKeyPress = LeVremiaKeyPress
      end
    end
    object PSetka: TGroupBox
      Left = 200
      Top = 201
      Width = 161
      Height = 192
      Align = alCustom
      Caption = #1057#1077#1090#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 90
        Height = 13
        Caption = #1062#1074#1077#1090' '#1083#1080#1085#1080#1081' '#1089#1077#1090#1082#1080
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 111
        Height = 13
        Caption = #1058#1086#1083#1097#1080#1085#1072' '#1083#1080#1085#1080#1081' '#1089#1077#1090#1082#1080
      end
      object Label3: TLabel
        Left = 8
        Top = 96
        Width = 90
        Height = 13
        Caption = #1064#1072#1075' '#1087#1072#1088#1072#1083#1077#1083#1080#1081' ('#176')'
      end
      object Label4: TLabel
        Left = 8
        Top = 136
        Width = 86
        Height = 13
        Caption = #1064#1072#1075' '#1084#1077#1088#1080#1076#1080#1072#1085' ('#176')'
      end
      object CbPenColor: TColorBox
        Left = 8
        Top = 32
        Width = 145
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnChange = CbPenColorChange
      end
      object SePenWight: TSpinEdit
        Left = 8
        Top = 72
        Width = 145
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 10
        MinValue = 1
        ParentFont = False
        TabOrder = 1
        Value = 1
        OnChange = CbPenColorChange
      end
      object SeShagX: TSpinEdit
        Left = 8
        Top = 112
        Width = 145
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 2
        Value = 30
        OnChange = CbPenColorChange
      end
      object SeShagY: TSpinEdit
        Left = 8
        Top = 152
        Width = 145
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 3
        Value = 10
        OnChange = CbPenColorChange
      end
    end
    object GbRast: TGroupBox
      Left = 40
      Top = 208
      Width = 169
      Height = 177
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1090#1086#1095#1082#1072#1084#1080
      TabOrder = 2
      Visible = False
      object GbPoint1: TGroupBox
        Left = 8
        Top = 16
        Width = 153
        Height = 57
        Caption = #1058#1086#1095#1082#1072' '#8470'1'
        TabOrder = 0
        object LaX1: TLabel
          Left = 8
          Top = 16
          Width = 3
          Height = 13
        end
        object LaY1: TLabel
          Left = 8
          Top = 32
          Width = 3
          Height = 13
        end
      end
      object GbPoint2: TGroupBox
        Left = 8
        Top = 72
        Width = 153
        Height = 57
        Caption = #1058#1086#1095#1082#1072' '#8470'2'
        TabOrder = 1
        object LaX2: TLabel
          Left = 8
          Top = 16
          Width = 3
          Height = 13
        end
        object LaY2: TLabel
          Left = 8
          Top = 32
          Width = 3
          Height = 13
        end
      end
      object LeRastPoint: TLabeledEdit
        Left = 8
        Top = 144
        Width = 153
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = #1056#1072#1089#1090#1086#1103#1085#1080#1077
        TabOrder = 2
      end
    end
    object GbVisibleStation: TGroupBox
      Left = 26
      Top = 121
      Width = 222
      Height = 120
      Align = alCustom
      Caption = #1057#1090#1072#1085#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      object MeAllStation: TMemo
        Left = 2
        Top = 41
        Width = 218
        Height = 77
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 2
        Top = 15
        Width = 218
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object CbAllStation: TCheckBox
          Left = 8
          Top = 5
          Width = 209
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077' '#1089#1090#1072#1085#1094#1080#1080
          TabOrder = 0
        end
      end
    end
    object GbProtocol: TGroupBox
      Left = 263
      Top = 110
      Width = 225
      Height = 192
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1089#1074#1103#1079#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
      object MeSviaz: TMemo
        Left = 2
        Top = 15
        Width = 221
        Height = 175
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object GbVisibleAllSpytnik: TGroupBox
      Left = 1
      Top = 1
      Width = 1245
      Height = 105
      Align = alCustom
      Caption = #1057#1087#1091#1090#1085#1080#1082#1080
      TabOrder = 5
      Visible = False
      object SgSpytnik: TStringGrid
        Left = 2
        Top = 15
        Width = 1241
        Height = 88
        Align = alClient
        ColCount = 9
        RowCount = 2
        TabOrder = 0
      end
    end
    object GbRadioVidimost: TGroupBox
      Left = 352
      Top = 136
      Width = 201
      Height = 185
      Caption = #1054#1073#1083#1072#1089#1090#1100' '#1088#1072#1076#1080#1086#1074#1080#1076#1080#1084#1086#1089#1090#1080
      TabOrder = 6
      Visible = False
      object Label5: TLabel
        Left = 24
        Top = 143
        Width = 166
        Height = 13
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1086#1085#1099' '#1088#1072#1076#1080#1086#1074#1080#1076#1080#1084#1086#1089#1090#1080
      end
      object Label6: TLabel
        Left = 25
        Top = 154
        Width = 78
        Height = 13
        Caption = #1074#1089#1077#1093' '#1089#1087#1091#1090#1085#1080#1082#1086#1074
      end
      object Label7: TLabel
        Left = 24
        Top = 166
        Width = 121
        Height = 13
        Caption = #1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1089#1090#1072#1085#1094#1080#1080
      end
      object Label8: TLabel
        Left = 8
        Top = 56
        Width = 90
        Height = 13
        Caption = #1062#1074#1077#1090' '#1083#1080#1085#1080#1081' '#1089#1077#1090#1082#1080
      end
      object Label9: TLabel
        Left = 8
        Top = 96
        Width = 111
        Height = 13
        Caption = #1058#1086#1083#1097#1080#1085#1072' '#1083#1080#1085#1080#1081' '#1089#1077#1090#1082#1080
      end
      object LeHRadiovidimosti: TLabeledEdit
        Left = 8
        Top = 32
        Width = 185
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1099#1089#1086#1090#1072' ('#1082#1084')'
        TabOrder = 0
        Text = '400'
        OnChange = LeHRadiovidimostiChange
      end
      object CbAllZoneSattelite: TCheckBox
        Left = 8
        Top = 149
        Width = 17
        Height = 25
        TabOrder = 1
      end
      object ClZoneSviaz: TColorBox
        Left = 8
        Top = 72
        Width = 145
        Height = 22
        Selected = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
        OnChange = CbPenColorChange
      end
      object SeWidthZoneSviaz: TSpinEdit
        Left = 8
        Top = 112
        Width = 145
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 10
        MinValue = 1
        ParentFont = False
        TabOrder = 3
        Value = 2
        OnChange = CbPenColorChange
      end
    end
    object GbSelectStation: TGroupBox
      Left = 544
      Top = 128
      Width = 185
      Height = 105
      Caption = #1042#1099#1073#1088#1072#1085#1085#1072#1103' '#1089#1090#1072#1085#1094#1080#1103
      TabOrder = 7
      Visible = False
      object MeSelectStation: TMemo
        Left = 2
        Top = 15
        Width = 181
        Height = 88
        Align = alClient
        Lines.Strings = (
          #1057#1090#1072#1085#1094#1080#1103' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1072)
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object GbChiklogramm: TGroupBox
      Left = 1
      Top = 8
      Width = 1245
      Height = 98
      Align = alCustom
      Caption = #1062#1080#1082#1083#1086#1075#1088#1072#1084#1084#1072
      TabOrder = 8
      Visible = False
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 191
        Height = 81
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LeVremiaC: TLabeledEdit
          Left = 0
          Top = 16
          Width = 177
          Height = 21
          EditLabel.Width = 188
          EditLabel.Height = 13
          EditLabel.Caption = #1042#1099#1074#1086#1076#1080#1084#1099#1081' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1082' '#1074#1088#1077#1084#1077#1085#1080' (c)'
          TabOrder = 0
          Text = '20000'
        end
      end
      object Panel3: TPanel
        Left = 193
        Top = 15
        Width = 1050
        Height = 81
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PbCiklogramm: TPaintBox
          Left = 0
          Top = 0
          Width = 1050
          Height = 64
          Align = alClient
        end
        object SbCiklogramm: TScrollBar
          Left = 0
          Top = 64
          Width = 1050
          Height = 17
          Align = alBottom
          PageSize = 0
          TabOrder = 0
          OnChange = SbCiklogrammChange
        end
      end
    end
    object GbStat: TGroupBox
      Left = 528
      Top = 128
      Width = 289
      Height = 289
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1094#1080#1082#1083#1086#1075#1088#1072#1084#1084#1099
      TabOrder = 9
      Visible = False
      object SgStat: TStringGrid
        Left = 2
        Top = 15
        Width = 285
        Height = 272
        Align = alClient
        ColCount = 2
        DefaultColWidth = 140
        TabOrder = 0
        RowHeights = (
          24
          24
          24
          24
          25)
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 401
    Top = 40
    object NStation: TMenuItem
      Caption = #1057#1090#1072#1085#1094#1080#1080
      object NMSozdStation: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = BtSozdClick
      end
      object NSaveStation: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = BtSaveStationClick
      end
      object NLoaStation: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        OnClick = BtLoadStationClick
      end
      object NChooseStation: TMenuItem
        Caption = #1042#1099#1073#1088#1072#1090#1100
        OnClick = NChooseStationClick
      end
      object NIzmenitStation: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        Enabled = False
        OnClick = NIzmenitStationClick
      end
    end
    object NSattelite: TMenuItem
      Caption = #1057#1087#1091#1090#1085#1080#1082#1080
      object NSozdSattelite: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = NSozdSatteliteClick
      end
      object NSaveSattelite: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = NSaveSatteliteClick
      end
      object NLoadSattelite: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        OnClick = NLoadSatteliteClick
      end
      object NChooseSattelite: TMenuItem
        Caption = #1042#1099#1073#1088#1072#1090#1100
      end
    end
    object NPanel: TMenuItem
      Caption = #1055#1072#1085#1077#1083#1080
      object NVisibleModel: TMenuItem
        AutoCheck = True
        Caption = #1052#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077
        OnClick = NVisibleModelClick
      end
      object NVisibleZoneRadiovidimosti: TMenuItem
        AutoCheck = True
        Caption = #1047#1086#1085#1099' '#1088#1072#1076#1080#1086#1074#1080#1076#1080#1084#1086#1089#1090#1080
        OnClick = NVisibleZoneRadiovidimostiClick
      end
      object NVisibleProtokol: TMenuItem
        AutoCheck = True
        Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1089#1074#1103#1079#1080
        OnClick = NVisibleProtokolClick
      end
      object NVisibleStatistik: TMenuItem
        AutoCheck = True
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
        OnClick = NVisibleStatistikClick
      end
      object NVisibleCiklogramm: TMenuItem
        AutoCheck = True
        Caption = #1062#1080#1082#1083#1086#1075#1088#1072#1084#1084#1072
        OnClick = NVisibleCiklogrammClick
      end
      object NVisiblesattelite: TMenuItem
        AutoCheck = True
        Caption = #1057#1087#1091#1090#1085#1080#1082#1080
        OnClick = NVisiblesatteliteClick
      end
      object NVisibleAllStation: TMenuItem
        AutoCheck = True
        Caption = #1042#1089#1077' '#1089#1090#1072#1085#1094#1080#1080
        OnClick = NVisibleAllStationClick
      end
      object NVisibleSelectStation: TMenuItem
        AutoCheck = True
        Caption = #1042#1099#1073#1088#1072#1085#1085#1072#1103' '#1089#1090#1072#1085#1094#1080#1103
        OnClick = NVisibleSelectStationClick
      end
      object NVisibleRast: TMenuItem
        AutoCheck = True
        Caption = #1056#1072#1089#1090#1086#1103#1085#1080#1077
        OnClick = NVisibleRastClick
      end
      object NVisibleSetka: TMenuItem
        AutoCheck = True
        Caption = #1057#1077#1090#1082#1072
        OnClick = NVisibleSetkaClick
      end
    end
    object Y1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object ND: TMenuItem
        Caption = 'hddd,dd'#176
        Checked = True
        GroupIndex = 1
        RadioItem = True
        OnClick = NDClick
      end
      object NM: TMenuItem
        Caption = 'hddd'#176'mm,mm'#39
        GroupIndex = 1
        RadioItem = True
        OnClick = NMClick
      end
      object NS: TMenuItem
        Caption = 'hddd'#176'mm'#39'ss,s"'
        GroupIndex = 1
        RadioItem = True
        OnClick = NSClick
      end
    end
  end
  object SD: TSaveDialog
    Left = 337
    Top = 40
  end
  object OD: TOpenDialog
    Left = 305
    Top = 40
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 368
    Top = 44
  end
end
