inherited FrmCadastroEstado: TFrmCadastroEstado
  Caption = 'Cadastro de Estados'
  ClientHeight = 137
  ClientWidth = 408
  ExplicitWidth = 424
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 408
    Height = 91
    ExplicitWidth = 408
    ExplicitHeight = 91
    object cxLabel1: TcxLabel
      Left = 8
      Top = 5
      Caption = 'Nome:'
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 46
      Caption = 'Pa'#237's:'
    end
    object edtNome: TSigarEdit
      Left = 8
      Top = 21
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      SigarField = 'NOME'
      Height = 21
      Width = 385
    end
    object edtPais: TSigarEdit
      Left = 8
      Top = 61
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.OnEditValueChanged = edtPaisPropertiesEditValueChanged
      TabOrder = 1
      OnKeyPress = edtPaisKeyPress
      SigarField = 'IDPAIS'
      Height = 21
      Width = 40
    end
    object lbNomePais: TcxLabel
      Left = 82
      Top = 62
    end
    object btnPesquisaPais: TcxButton
      Left = 53
      Top = 61
      Width = 23
      Height = 21
      Action = ActPesquisaPais
      TabOrder = 2
    end
  end
  inherited bmControladorBarra: TdxBarManager
    Left = 368
    Top = 8
    DockControlHeights = (
      0
      0
      46
      0)
  end
  inherited alAcoesCadastro: TActionList
    Left = 328
    Top = 8
  end
  inherited alAcoesGerais: TActionList
    Left = 272
    Top = 8
    object ActPesquisaPais: TAction
      Hint = 'Pesquisa Pa'#237's'
      ImageIndex = 0
      OnExecute = ActPesquisaPaisExecute
    end
  end
end
