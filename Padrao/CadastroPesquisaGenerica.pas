unit CadastroPesquisaGenerica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, dxSkinsCore,
  dxSkinLilian, dxSkinsdxBarPainter, System.Actions, Vcl.ActnList, dxBar,
  cxClasses, Vcl.ExtCtrls, PesquisaGenericaSQL, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxMemo,
  cxTextEdit, cxLabel, uDmDao, SigarEdit, SigarMemo;

type
  TFrmCadastroPesquisaGenerica = class(TFrmCadastroPadrao)
    cxLabel1: TcxLabel;
    edtNome: TSigarEdit;
    cxLabel2: TcxLabel;
    mmSql: TSigarMemo;
    procedure FormCreate(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CleanFields; override;
    procedure GetPk; override;
    function VerifyId: Double; override;
  end;

var
  FrmCadastroPesquisaGenerica: TFrmCadastroPesquisaGenerica;

implementation

{$R *.dfm}

{ TFrmCadastroPesquisaGenerica }

procedure TFrmCadastroPesquisaGenerica.ActNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TFrmCadastroPesquisaGenerica.CleanFields;
begin
  inherited;
  edtNome.Clear;
  mmSql.Clear;
  TPesquisaGenericaSQL(Table).Id     := 0;
  TPesquisaGenericaSQL(Table).Objeto := '';
  TPesquisaGenericaSQL(Table).SQL    := '';
end;

procedure TFrmCadastroPesquisaGenerica.FormCreate(Sender: TObject);
begin
  Table := TPesquisaGenericaSQL.Create;
  inherited;
end;

procedure TFrmCadastroPesquisaGenerica.GetPk;
begin
  inherited;
  ConnectionVerify;
  TPesquisaGenericaSQL(Table).Id := DmDao.Dao.GetID(Table, 'id');
end;

function TFrmCadastroPesquisaGenerica.VerifyId: Double;
begin
  Result := TPesquisaGenericaSQL(Table).Id;
end;

end.
