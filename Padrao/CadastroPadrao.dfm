inherited FrmCadastroPadrao: TFrmCadastroPadrao
  Caption = 'FrmCadastroPadrao'
  ClientHeight = 242
  ClientWidth = 629
  OnCreate = FormCreate
  ExplicitWidth = 645
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarManager1: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Cadastro')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = DmDao.ListaImagem24x24
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 240
    Top = 128
    DockControlHeights = (
      0
      0
      50
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'ToolBar'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 524
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = DmDao.ListaImagem24x24
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarLargeButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarLargeButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarLargeButton7'
        end>
      NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActNovo
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActAltera
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActExclui
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActSalva
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = ActCancela
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Action = ActPesquisa
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = ActSai
      Align = iaRight
      Category = 0
      AutoGrayScale = False
    end
    object dxBarSpinEdit1: TdxBarSpinEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
  end
  object ActionList1: TActionList
    Left = 312
    Top = 128
    object ActNovo: TAction
      Caption = 'Novo'
      ImageIndex = 0
      OnExecute = ActNovoExecute
    end
    object ActAltera: TAction
      Caption = 'Alterar'
      ImageIndex = 2
      OnExecute = ActAlteraExecute
    end
    object ActExclui: TAction
      Caption = 'Excluir'
      ImageIndex = 1
      OnExecute = ActExcluiExecute
    end
    object ActSalva: TAction
      Caption = 'Salvar'
      ImageIndex = 4
      OnExecute = ActSalvaExecute
    end
    object ActCancela: TAction
      Caption = 'Cancelar'
      ImageIndex = 5
      OnExecute = ActCancelaExecute
    end
    object ActPesquisa: TAction
      Caption = 'Pesquisar'
      ImageIndex = 6
      OnExecute = ActPesquisaExecute
    end
    object ActSai: TAction
      Caption = 'Sair'
      ImageIndex = 3
      OnExecute = ActSaiExecute
    end
  end
end
