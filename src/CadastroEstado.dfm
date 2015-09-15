inherited FrmCadastroEstado: TFrmCadastroEstado
  Caption = 'Cadastro de Estados'
  ClientHeight = 115
  ClientWidth = 408
  ExplicitWidth = 424
  ExplicitHeight = 153
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 408
    Height = 69
    ExplicitWidth = 408
    ExplicitHeight = 69
    object cxLabel1: TcxLabel
      Left = 16
      Top = 12
      Caption = 'Nome:'
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 41
      Caption = 'Pa'#237's:'
    end
    object edtNome: TSigarEdit
      Left = 57
      Top = 11
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      SigarField = 'NOME'
      Height = 21
      Width = 312
    end
    object edtPais: TSigarEdit
      Left = 57
      Top = 40
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
      Left = 131
      Top = 41
    end
    object btnPesquisaPais: TcxButton
      Left = 102
      Top = 40
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
