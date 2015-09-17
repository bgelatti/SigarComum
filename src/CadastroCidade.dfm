inherited FrmCadastroCidade: TFrmCadastroCidade
  Caption = 'Cadastro de Cidades'
  ClientHeight = 133
  ClientWidth = 386
  ExplicitWidth = 402
  ExplicitHeight = 171
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 386
    Height = 87
    ExplicitWidth = 386
    ExplicitHeight = 87
    object lbNomeEstado: TcxLabel
      Left = 84
      Top = 55
    end
    object btnPesquisaEstado: TcxButton
      Left = 55
      Top = 54
      Width = 23
      Height = 21
      Action = ActPesquisaEstado
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.SkinName = ''
      TabOrder = 2
    end
    object edtEstado: TSigarEdit
      Left = 10
      Top = 54
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.OnEditValueChanged = edtEstadoPropertiesEditValueChanged
      TabOrder = 1
      OnKeyPress = edtEstadoKeyPress
      SigarField = 'IDESTADO'
      Height = 21
      Width = 40
    end
    object cxLabel2: TcxLabel
      Left = 10
      Top = 39
      Caption = 'Estado:'
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 4
      Caption = 'Nome:'
    end
    object edtNome: TSigarEdit
      Left = 10
      Top = 19
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      SigarField = 'NOME'
      Height = 21
      Width = 359
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
