unit CadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  CadastroPadrao, dxSkinLilian, Estado, Table, PesquisaGenerica, Cidade,
  dxSkinsCore, dxSkinsdxBarPainter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, cxTextEdit,
  Vcl.StdCtrls, cxButtons, cxLabel, System.Actions, Vcl.ActnList, dxBar,
  cxClasses, Vcl.ExtCtrls;

type
  TFrmCadastroCidade = class(TFrmCadastroPadrao)
    ActPesquisaEstado: TAction;
    lbNomeEstado: TcxLabel;
    btnPesquisaEstado: TcxButton;
    edtEstado: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
    procedure ActPesquisaEstadoExecute(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
    procedure edtEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure edtEstadoPropertiesEditValueChanged(Sender: TObject);
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
  FrmCadastroCidade: TFrmCadastroCidade;

implementation

uses
  uDmDao;

{$R *.dfm}

procedure TFrmCadastroCidade.ActAlterarExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TFrmCadastroCidade.ActNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TFrmCadastroCidade.ActPesquisaEstadoExecute(Sender: TObject);
var
  vEstado: TTable;
begin
  inherited;
  vEstado := TEstado.Create;
  try
    ConnectionVerify;
    vEstado := TFrmPesquisaGenerica.SearchTable(vEstado);
    if TEstado(vEstado).Id > 0 then
    begin
      edtEstado.Text := FloatToStr(TEstado(vEstado).Id);
      lbNomeEstado.Caption := TEstado(vEstado).Nome;
    end;
  finally
    vEstado.Free;
  end;
end;

procedure TFrmCadastroCidade.CleanFields;
begin
  inherited;
  edtNome.Clear;
  edtEstado.Clear;
  lbNomeEstado.Clear;
  TCidade(Table).Id       := 0;
  TCidade(Table).Nome     := '';
  TCidade(Table).IdEstado := 0;
end;

procedure TFrmCadastroCidade.edtEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(Key,['0'..'9',#8])) then
  begin
    Key := #0;
  end;
end;

procedure TFrmCadastroCidade.edtEstadoPropertiesEditValueChanged(
  Sender: TObject);
var
  vEstado: TEstado;
  vReg: Integer;
begin
  inherited;
  if edtEstado.Text <> '' then
  begin
    vEstado := TEstado.Create;
    try
      vEstado.Id := StrToInt(edtEstado.Text);
      ConnectionVerify;
      vReg := DmDao.Dao.Read(vEstado);
      if vReg > 0 then
      begin
        lbNomeEstado.Caption := vEstado.Nome;
      end;
    finally
      vEstado.Free;
    end;
  end;
end;

procedure TFrmCadastroCidade.FormCreate(Sender: TObject);
begin
  Table := TCidade.Create;
  inherited;
end;

procedure TFrmCadastroCidade.GetPk;
begin
  inherited;
  TCidade(Table).Id := DmDao.Dao.GetID(Table, 'id');
end;

procedure TFrmCadastroCidade.SetFieldsFromSearch;
begin
  inherited;
  edtNome.Text   := TCidade(Table).Nome;
  edtEstado.Text := FloatToStr(TCidade(Table).IdEstado);
end;

procedure TFrmCadastroCidade.SetFieldsTable;
begin
  inherited;
  edtNome.Text   := TCidade(Table).Nome;
  edtEstado.Text := FloatToStr(TCidade(Table).IdEstado);
end;

procedure TFrmCadastroCidade.SetTableFields;
begin
  inherited;
  TCidade(Table).Nome     := edtNome.Text;
  TCidade(Table).IdEstado := StrToFloatDef(edtEstado.Text, 0);
end;

function TFrmCadastroCidade.VerifyId: Double;
begin
  Result := TCidade(Table).Id;
end;

end.
