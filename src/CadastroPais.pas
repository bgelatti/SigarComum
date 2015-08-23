unit CadastroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, Pais, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxLabel, Vcl.ExtCtrls;

type
  TFrmCadastroPais = class(TFrmCadastroPadrao)
    cxLabel1: TcxLabel;
    edtNome: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetTableFields; override;
    procedure SetFieldsTable; override;
    procedure CleanFields; override;
    procedure SetFieldsFromSearch(ADataSet: TDataSet); override;
    procedure GetPk; override;
    function VerifyId: Integer; override;
  end;

var
  FrmCadastroPais: TFrmCadastroPais;

implementation

uses
  uDmDao;

{$R *.dfm}

{ TFrmCadastroPais }

procedure TFrmCadastroPais.ActNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TFrmCadastroPais.CleanFields;
begin
  inherited;
  edtNome.Clear;
  TPais(Table).Id   := 0;
  TPais(Table).Nome := '';
end;

procedure TFrmCadastroPais.FormCreate(Sender: TObject);
begin
  Table := TPais.Create;
  inherited;
end;

procedure TFrmCadastroPais.GetPk;
begin
  inherited;
  TPais(Table).Id := DmDao.Dao.GetID(Table, 'id');
end;

procedure TFrmCadastroPais.SetFieldsFromSearch(ADataSet: TDataSet);
begin
  inherited;
  edtNome.Text := TPais(Table).Nome;
end;

procedure TFrmCadastroPais.SetFieldsTable;
begin
  inherited;
  edtNome.Text := TPais(Table).Nome;
end;

procedure TFrmCadastroPais.SetTableFields;
begin
  inherited;
  TPais(Table).Nome := edtNome.Text;
end;

function TFrmCadastroPais.VerifyId: Integer;
begin
  Result := TPais(Table).Id;
end;

end.
