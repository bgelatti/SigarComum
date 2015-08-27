inherited FrmCadastroPesquisaGenerica: TFrmCadastroPesquisaGenerica
  Caption = 'Cadastro das Pesquisas Gen'#233'ricas'
  ClientWidth = 405
  ExplicitWidth = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 405
    ExplicitLeft = 72
    ExplicitTop = 70
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = 'Nome:'
    end
    object edtNome: TcxTextEdit
      Left = 57
      Top = 15
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Height = 21
      Width = 328
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 43
      Caption = 'SQL:'
    end
    object mmSql: TcxMemo
      Left = 57
      Top = 42
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 8000
      Properties.ScrollBars = ssVertical
      TabOrder = 3
      Height = 143
      Width = 328
    end
  end
  inherited bmControladorBarra: TdxBarManager
    Left = 248
    Top = 0
    DockControlHeights = (
      0
      0
      46
      0)
  end
  inherited alAcoesCadastro: TActionList
    Left = 208
    Top = 0
  end
  inherited alAcoesGerais: TActionList
    Left = 152
    Top = 0
  end
end
