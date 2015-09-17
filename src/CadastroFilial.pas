unit CadastroFilial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, dxSkinsCore,
  dxSkinLilian, dxSkinsdxBarPainter, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  dxBar, cxClasses, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, SigarEdit, cxLabel,
  cxMaskEdit, SigarMask, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC;

type
  TFrmCadastroFilial = class(TFrmCadastroPadrao)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    edtRazaoSocial: TSigarEdit;
    edtNomeFantasia: TSigarEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtDocEstadual: TSigarEdit;
    cxLabel4: TcxLabel;
    edtDocFederal: TSigarMask;
    edtRntrc: TSigarEdit;
    cxLabel5: TcxLabel;
    procedure ActNovoExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CleanFields; override;
    procedure GetPk; override;
    function VerifyId: Double; override;
  end;

var
  FrmCadastroFilial: TFrmCadastroFilial;

implementation

uses
  Filial, uDmDao;

{$R *.dfm}

procedure TFrmCadastroFilial.ActAlterarExecute(Sender: TObject);
begin
  inherited;
  edtRazaoSocial.SetFocus;
end;

procedure TFrmCadastroFilial.ActNovoExecute(Sender: TObject);
begin
  inherited;
  edtRazaoSocial.SetFocus;
end;

procedure TFrmCadastroFilial.CleanFields;
begin
  inherited;
  TFilial(Table).Id := 0;
  TFilial(Table).RazaoSocial := '';
  TFilial(Table).NomeFantasia := '';
  TFilial(Table).DocFederal := '';
  TFilial(Table).DocEstadual := '';
  TFilial(Table).Rntrc := '';
end;

procedure TFrmCadastroFilial.FormCreate(Sender: TObject);
begin
  Table := TFilial.Create;
  inherited;
end;

procedure TFrmCadastroFilial.GetPk;
begin
  inherited;
  ConnectionVerify;
  TFilial(Table).Id := DmDao.Dao.GetID(Table, 'id');
end;

function TFrmCadastroFilial.VerifyId: Double;
begin
  Result := TFilial(Table).Id;
end;

end.
