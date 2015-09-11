unit CadastroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, System.Actions,
  Vcl.ActnList, dxBar, dxSkinsCore, dxSkinLilian, dxSkinsdxBarPainter,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxLabel, cxClasses, Vcl.ExtCtrls, Pais, SigarEdit;

type
  TFrmCadastroPais = class(TFrmCadastroPadrao)
    cxLabel1: TcxLabel;
    edtNome: TSigarEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CleanFields; override;
    procedure GetPk; override;
    function VerifyId: Double; override;
  end;

var
  FrmCadastroPais: TFrmCadastroPais;

implementation

uses
  uDmDao, PesquisaGenerica;

{$R *.dfm}

{ TFrmCadastroPais }

procedure TFrmCadastroPais.ActAlterarExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

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
  ConnectionVerify;
  TPais(Table).Id := DmDao.Dao.GetID(Table, 'id');
end;

function TFrmCadastroPais.VerifyId: Double;
begin
  Result := TPais(Table).Id;
end;

end.
