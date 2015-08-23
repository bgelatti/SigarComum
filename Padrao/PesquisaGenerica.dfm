inherited FrmPesquisaGenerica: TFrmPesquisaGenerica
  Caption = 'Pesquisa'
  ClientHeight = 318
  ClientWidth = 562
  ExplicitWidth = 578
  ExplicitHeight = 356
  PixelsPerInch = 96
  TextHeight = 13
  object cxgPesquisa: TcxGrid
    Left = 0
    Top = 0
    Width = 479
    Height = 318
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 104
    ExplicitTop = 32
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxgvPesquisa: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsPesquisa
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
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
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 424
    Top = 144
    DockControlHeights = (
      0
      83
      0
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
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
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
  end
  object ListaAcao: TActionList
    Images = DmDao.ListaImagem24x24
    Left = 424
    Top = 208
    object ActSair: TAction
      Caption = 'Sair'
      ImageIndex = 3
      OnExecute = ActSairExecute
    end
  end
  object dsPesquisa: TDataSource
    Left = 424
    Top = 80
  end
end
