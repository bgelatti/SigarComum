inherited FrmPesquisaGenerica: TFrmPesquisaGenerica
  BorderIcons = []
  Caption = 'Pesquisa'
  ClientHeight = 463
  ClientWidth = 772
  FormStyle = fsNormal
  Visible = False
  ExplicitWidth = 788
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  object cxgPesquisa: TcxGrid
    Left = 0
    Top = 0
    Width = 737
    Height = 463
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    LevelTabs.Style = 8
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Lilian'
    object cxgvPesquisa: TcxGridDBTableView
      OnDblClick = cxgvPesquisaDblClick
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsPesquisa
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DateTimeHandling.MonthFormat = 'mm'
      DateTimeHandling.YearFormat = 'yyyy'
      DateTimeHandling.DateFormat = 'dd/mm/yyyy'
      DateTimeHandling.HourFormat = 'hh:nn'
      FilterRow.InfoText = 'Clique aqui para definir um filtro'
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'Sem Registros'
    end
    object cxgPesquisaLevel1: TcxGridLevel
      GridView = cxgvPesquisa
    end
  end
  object bmMenuLateral: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = DmDao.ListaImagem24x24
    LookAndFeel.SkinName = 'Lilian'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 424
    Top = 144
    DockControlHeights = (
      0
      35
      0
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'BarraLateral'
      CaptionButtons = <>
      DockedDockingStyle = dsRight
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsRight
      FloatLeft = 596
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = DmDao.ListaImagem24x24
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsBottom]
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActSair
      Category = 0
      AutoGrayScale = False
    end
  end
  object ListaAcao: TActionList
    Images = DmDao.ListaImagem24x24
    Left = 424
    Top = 208
    object ActSair: TAction
      Caption = 'Sair'
      ImageIndex = 3
      ShortCut = 27
      OnExecute = ActSairExecute
    end
  end
  object dsPesquisa: TDataSource
    Left = 424
    Top = 80
  end
end
