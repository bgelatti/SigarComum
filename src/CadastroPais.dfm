inherited FrmCadastroPais: TFrmCadastroPais
  Caption = 'Cadastro de Pa'#237's'
  ClientHeight = 99
  ClientWidth = 405
  ExplicitWidth = 421
  ExplicitHeight = 137
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 405
    Height = 53
    ExplicitWidth = 405
    ExplicitHeight = 53
    object cxLabel1: TcxLabel
      Left = 10
      Top = 6
      Caption = 'Nome:'
    end
    object edtNome: TSigarEdit
      Left = 10
      Top = 21
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      SigarField = 'NOME'
      Width = 359
    end
  end
  inherited bmControladorBarra: TdxBarManager
    Left = 192
    Top = 16
    DockControlHeights = (
      0
      0
      46
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
