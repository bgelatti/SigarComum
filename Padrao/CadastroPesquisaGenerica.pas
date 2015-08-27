unit CadastroPesquisaGenerica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, dxSkinsCore,
  dxSkinLilian, dxSkinsdxBarPainter, System.Actions, Vcl.ActnList, dxBar,
  cxClasses, Vcl.ExtCtrls, PesquisaGenericaSQL, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxMemo,
  cxTextEdit, cxLabel, uDmDao;

type
  TFrmCadastroPesquisaGenerica = class(TFrmCadastroPadrao)
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
    cxLabel2: TcxLabel;
    mmSql: TcxMemo;
    procedure FormCreate(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetTableFields; override;
    procedure SetFieldsTable; override;
    procedure CleanFields; override;
    procedure SetFieldsFromSearch; override;
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

procedure TFrmCadastroPesquisaGenerica.SetFieldsFromSearch;
begin
  inherited;
  edtNome.Text := TPesquisaGenericaSQL(Table).Objeto;
  mmSql.Text   := TPesquisaGenericaSQL(Table).SQL;
end;

procedure TFrmCadastroPesquisaGenerica.SetFieldsTable;
begin
  inherited;
  edtNome.Text := TPesquisaGenericaSQL(Table).Objeto;
  mmSql.Text   := TPesquisaGenericaSQL(Table).SQL;
end;

procedure TFrmCadastroPesquisaGenerica.SetTableFields;
begin
  inherited;
  TPesquisaGenericaSQL(Table).Objeto := edtNome.Text;
  TPesquisaGenericaSQL(Table).SQL    := mmSql.Text;
end;

function TFrmCadastroPesquisaGenerica.VerifyId: Double;
begin
  Result := TPesquisaGenericaSQL(Table).Id;
end;

end.
