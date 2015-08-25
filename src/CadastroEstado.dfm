inherited FrmCadastroEstado: TFrmCadastroEstado
  Caption = 'Cadastro de Estado'
  ClientHeight = 146
  ClientWidth = 408
  ExplicitWidth = 424
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 408
    Height = 96
    ExplicitLeft = 8
    ExplicitTop = 8
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = 'Nome:'
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 55
      Caption = 'Pa'#237's:'
    end
    object edtNome: TcxTextEdit
      Left = 57
      Top = 15
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Height = 21
      Width = 312
    end
    object edtPais: TcxTextEdit
      Left = 57
      Top = 54
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.OnEditValueChanged = edtPaisPropertiesEditValueChanged
      TabOrder = 3
      OnKeyPress = edtPaisKeyPress
      Height = 21
      Width = 40
    end
    object lbNomePais: TcxLabel
      Left = 131
      Top = 55
    end
    object cxButton1: TcxButton
      Left = 102
      Top = 54
      Width = 23
      Height = 21
      Action = ActPesquisaPais
      TabOrder = 5
    end
  end
  inherited bmControladorBarra: TdxBarManager
    Left = 368
    Top = 8
    DockControlHeights = (
      0
      0
      50
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
