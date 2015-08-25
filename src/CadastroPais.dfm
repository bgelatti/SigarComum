inherited FrmCadastroPais: TFrmCadastroPais
  Caption = 'Cadastro de Pa'#237's'
  ClientHeight = 104
  ClientWidth = 405
  ExplicitWidth = 421
  ExplicitHeight = 142
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 405
    Height = 54
    ExplicitWidth = 405
    ExplicitHeight = 54
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
  end
  inherited bmControladorBarra: TdxBarManager
    Left = 192
    Top = 16
    DockControlHeights = (
      0
      0
      50
      0)
  end
  inherited alAcoesCadastro: TActionList
    Left = 264
    Top = 16
  end
  inherited alAcoesGerais: TActionList
    Left = 320
    Top = 16
  end
end
