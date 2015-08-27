inherited FrmCadastroCidade: TFrmCadastroCidade
  Caption = 'Cadastro de Cidades'
  ClientHeight = 113
  ClientWidth = 386
  ExplicitWidth = 402
  ExplicitHeight = 151
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 386
    Height = 67
    ExplicitWidth = 386
    ExplicitHeight = 67
    object lbNomeEstado: TcxLabel
      Left = 130
      Top = 39
    end
    object btnPesquisaEstado: TcxButton
      Left = 101
      Top = 38
      Width = 23
      Height = 21
      Action = ActPesquisaEstado
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.SkinName = ''
      TabOrder = 2
    end
    object edtEstado: TcxTextEdit
      Left = 56
      Top = 38
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.OnEditValueChanged = edtEstadoPropertiesEditValueChanged
      TabOrder = 1
      OnKeyPress = edtEstadoKeyPress
      Height = 21
      Width = 40
    end
    object cxLabel2: TcxLabel
      Left = 9
      Top = 39
      Caption = 'Estado:'
    end
    object cxLabel1: TcxLabel
      Left = 15
      Top = 15
      Caption = 'Nome:'
    end
    object edtNome: TcxTextEdit
      Left = 56
      Top = 12
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Height = 21
      Width = 312
    end
  end
  inherited bmControladorBarra: TdxBarManager
    Left = 192
    Top = 8
    DockControlHeights = (
      0
      0
      46
      0)
  end
  inherited alAcoesCadastro: TActionList
    Top = 8
  end
  inherited alAcoesGerais: TActionList
    Top = 8
    object ActPesquisaEstado: TAction
      ImageIndex = 0
      OnExecute = ActPesquisaEstadoExecute
    end
  end
end
