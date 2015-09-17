inherited FrmCadastroPesquisaGenerica: TFrmCadastroPesquisaGenerica
  Caption = 'Cadastro das Pesquisas Gen'#233'ricas'
  ClientHeight = 266
  ClientWidth = 405
  ExplicitWidth = 421
  ExplicitHeight = 304
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 405
    Height = 220
    ExplicitWidth = 405
    ExplicitHeight = 220
    object cxLabel1: TcxLabel
      Left = 12
      Top = 2
      Caption = 'Nome:'
    end
    object edtNome: TSigarEdit
      Left = 12
      Top = 19
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      SigarField = 'OBJETO'
      Height = 21
      Width = 373
    end
    object cxLabel2: TcxLabel
      Left = 12
      Top = 44
      Caption = 'SQL:'
    end
    object mmSql: TSigarMemo
      Left = 12
      Top = 60
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 8000
      Properties.ScrollBars = ssVertical
      TabOrder = 3
      SigarField = 'SQL'
      Height = 143
      Width = 373
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
