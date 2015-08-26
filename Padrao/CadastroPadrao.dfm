inherited FrmCadastroPadrao: TFrmCadastroPadrao
  Caption = 'FrmCadastroPadrao'
  ClientHeight = 242
  ClientWidth = 629
  OnCreate = FormCreate
  ExplicitWidth = 645
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 46
    Width = 629
    Height = 196
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 50
    ExplicitHeight = 192
  end
  object bmControladorBarra: TdxBarManager
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
    LookAndFeel.SkinName = 'Lilian'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 240
    Top = 128
    DockControlHeights = (
      0
      0
      46
      0)
    object bmBarraFerramenta: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
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
          ItemName = 'btnNovo'
        end
        item
          Visible = True
          ItemName = 'btnAlterar'
        end
        item
          Visible = True
          ItemName = 'btnExcluir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnSalvar'
        end
        item
          Visible = True
          ItemName = 'btnCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnPesquisar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnSair'
        end>
      NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object btnNovo: TdxBarLargeButton
      Action = ActNovo
      Category = 0
      AutoGrayScale = False
    end
    object btnAlterar: TdxBarLargeButton
      Action = ActAlterar
      Category = 0
      AutoGrayScale = False
    end
    object btnExcluir: TdxBarLargeButton
      Action = ActExcluir
      Category = 0
      AutoGrayScale = False
    end
    object btnSalvar: TdxBarLargeButton
      Action = ActSalvar
      Category = 0
      AutoGrayScale = False
    end
    object btnCancelar: TdxBarLargeButton
      Action = ActCancelar
      Category = 0
      AutoGrayScale = False
    end
    object btnPesquisar: TdxBarLargeButton
      Action = ActPesquisar
      Category = 0
      AutoGrayScale = False
    end
    object btnSair: TdxBarLargeButton
      Action = ActSair
      Align = iaRight
      Category = 0
      AutoGrayScale = False
    end
  end
  object alAcoesCadastro: TActionList
    Images = DmDao.ListaImagem24x24
    Left = 296
    Top = 80
    object ActNovo: TAction
      Caption = 'Novo'
      ImageIndex = 0
      OnExecute = ActNovoExecute
    end
    object ActAlterar: TAction
      Caption = 'Alterar'
      ImageIndex = 2
      OnExecute = ActAlterarExecute
    end
    object ActExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 1
      OnExecute = ActExcluirExecute
    end
    object ActSalvar: TAction
      Caption = 'Salvar'
      ImageIndex = 4
      OnExecute = ActSalvarExecute
    end
    object ActCancelar: TAction
      Caption = 'Cancelar'
      ImageIndex = 5
      OnExecute = ActCancelarExecute
    end
    object ActPesquisar: TAction
      Caption = 'Pesquisar'
      ImageIndex = 6
      OnExecute = ActPesquisarExecute
    end
    object ActSair: TAction
      Caption = 'Sair'
      ImageIndex = 3
      ShortCut = 27
      OnExecute = ActSairExecute
    end
  end
  object alAcoesGerais: TActionList
    Images = DmDao.ListaImagem16x16
    Left = 240
    Top = 80
  end
end
