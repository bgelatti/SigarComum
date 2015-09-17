inherited FrmCadastroFilial: TFrmCadastroFilial
  Caption = 'Cadastro de Filial'
  ClientHeight = 208
  ClientWidth = 515
  ExplicitWidth = 531
  ExplicitHeight = 246
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 515
    Height = 162
    ExplicitLeft = -128
    ExplicitTop = 8
    ExplicitWidth = 515
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 0
      Width = 515
      Height = 162
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.SkinName = 'Lilian'
      ExplicitLeft = 112
      ExplicitTop = 16
      ExplicitWidth = 289
      ExplicitHeight = 193
      ClientRectBottom = 155
      ClientRectLeft = 3
      ClientRectRight = 508
      ClientRectTop = 27
      object cxTabSheet1: TcxTabSheet
        Caption = 'Dados'
        ImageIndex = 0
        ExplicitLeft = -3
        ExplicitTop = -16
        ExplicitWidth = 289
        ExplicitHeight = 169
        object edtRazaoSocial: TSigarEdit
          Left = 9
          Top = 25
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          SigarField = 'RAZAOSOCIAL'
          Width = 488
        end
        object edtNomeFantasia: TSigarEdit
          Left = 9
          Top = 62
          Properties.CharCase = ecUpperCase
          TabOrder = 1
          SigarField = 'NOMEFANTASIA'
          Width = 488
        end
        object cxLabel1: TcxLabel
          Left = 9
          Top = 10
          Caption = 'Raz'#227'o Social:'
        end
        object cxLabel2: TcxLabel
          Left = 9
          Top = 47
          Caption = 'Nome Fantasia:'
        end
        object cxLabel3: TcxLabel
          Left = 9
          Top = 85
          Caption = 'Doc. Estadual:'
        end
        object edtDocEstadual: TSigarEdit
          Left = 9
          Top = 100
          Properties.CharCase = ecUpperCase
          TabOrder = 2
          SigarField = 'DOCESTADUAL'
          Width = 120
        end
        object cxLabel4: TcxLabel
          Left = 135
          Top = 85
          Caption = 'Doc. Federal:'
        end
        object edtDocFederal: TSigarMask
          Left = 135
          Top = 100
          Properties.CharCase = ecUpperCase
          Properties.EditMask = '##.###.###/####-##'
          TabOrder = 3
          Text = '  .   .   /    -  '
          SigarField = 'DOCFEDERAL'
          Width = 154
        end
        object edtRntrc: TSigarEdit
          Left = 295
          Top = 100
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          SigarField = 'RNTRC'
          Width = 120
        end
        object cxLabel5: TcxLabel
          Left = 295
          Top = 85
          Caption = 'RNTRC:'
        end
      end
    end
  end
  inherited bmControladorBarra: TdxBarManager
    Left = 496
    Top = 8
    DockControlHeights = (
      0
      0
      46
      0)
  end
  inherited alAcoesCadastro: TActionList
    Left = 448
    Top = 8
  end
  inherited alAcoesGerais: TActionList
    Left = 392
    Top = 8
  end
end
