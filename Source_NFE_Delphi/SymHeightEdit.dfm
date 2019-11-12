object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1089#1086#1090#1091' '#1089#1080#1084#1074#1086#1083#1086#1074
  ClientHeight = 125
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel1: TsLabel
    Left = 16
    Top = 53
    Width = 320
    Height = 13
    Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1079#1085#1072#1095#1077#1085#1080#1103', '#1086#1090#1083#1080#1095#1085#1086#1075#1086' '#1086#1090' '#1073#1072#1079#1086#1074#1086#1075#1086', '#1084#1086#1078#1077#1090' '#1087#1088#1080#1074#1077#1089#1090#1080' '
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 66049
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel2: TsLabel
    Left = 16
    Top = 72
    Width = 215
    Height = 13
    Caption = #1082' '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1086#1084#1091' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1102' '#1089#1080#1084#1074#1086#1083#1086#1074'.'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 66049
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sEdit1: TsEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 9212561
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    OnChange = sEdit1Change
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
  end
  object sButton1: TsButton
    Left = 249
    Top = 22
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 1
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sButton2: TsButton
    Left = 143
    Top = 22
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = sButton2Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sButton3: TsButton
    Left = 129
    Top = 92
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = sButton3Click
    SkinData.SkinSection = 'BUTTON'
  end
end
