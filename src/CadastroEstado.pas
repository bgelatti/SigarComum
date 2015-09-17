unit CadastroEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  CadastroPadrao, System.Actions, Vcl.ActnList, dxBar, cxClasses,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, dxSkinsCore,
  dxSkinLilian, dxSkinsdxBarPainter, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxLabel, Table,
  PesquisaGenerica, Pais, Estado, SigarEdit;

type
  TFrmCadastroEstado = class(TFrmCadastroPadrao)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtNome: TSigarEdit;
    edtPais: TSigarEdit;
    ActPesquisaPais: TAction;
    lbNomePais: TcxLabel;
    btnPesquisaPais: TcxButton;
    procedure ActPesquisaPaisExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPaisPropertiesEditValueChanged(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
    procedure edtPaisKeyPress(Sender: TObject; var Key: Char);
    procedure ActAlterarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CleanFields; override;
    procedure GetPk; override;
    function VerifyId: Double; override;
  end;

var
  FrmCadastroEstado: TFrmCadastroEstado;

implementation

uses
  uDmDao;

{$R *.dfm}

procedure TFrmCadastroEstado.ActAlterarExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TFrmCadastroEstado.ActNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TFrmCadastroEstado.ActPesquisaPaisExecute(Sender: TObject);
var
  vPais: TTable;
begin
  inherited;
  vPais := TPais.Create;
  try
    ConnectionVerify;
    vPais := TFrmPesquisaGenerica.SearchTable(vPais);
    if TPais(vPais).Id > 0 then
    begin
      edtPais.Text := FloatToStr(TPais(vPais).Id);
      lbNomePais.Caption := TPais(vPais).Nome;
    end;
  finally
    vPais.Free;
  end;
end;

procedure TFrmCadastroEstado.CleanFields;
begin
  inherited;
  lbNomePais.Clear;
  TEstado(Table).Id       := 0;
  TEstado(Table).Nome     := '';
  TEstado(Table).IdPais   := 0;
end;

procedure TFrmCadastroEstado.edtPaisKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(Key,['0'..'9',#8])) then
  begin
    Key := #0;
  end;
end;

procedure TFrmCadastroEstado.edtPaisPropertiesEditValueChanged(Sender: TObject);
var
  vPais: TPais;
  vReg: Integer;
begin
  inherited;
  if edtPais.Text <> '' then
  begin
    vPais := TPais.Create;
    try
      vPais.Id := StrToInt(edtPais.Text);
      ConnectionVerify;
      vReg := DmDao.Dao.Read(vPais);
      if vReg > 0 then
      begin
        lbNomePais.Caption := vPais.Nome;
      end;
    finally
      vPais.Free;
    end;
  end;
end;

procedure TFrmCadastroEstado.FormCreate(Sender: TObject);
begin
  Table := TEstado.Create;
  inherited;
end;

procedure TFrmCadastroEstado.GetPk;
begin
  inherited;
  TEstado(Table).Id := DmDao.Dao.GetID(Table, 'id');
end;

function TFrmCadastroEstado.VerifyId: Double;
begin
  Result := TEstado(Table).Id;
end;

end.
