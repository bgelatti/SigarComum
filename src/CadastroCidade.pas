unit CadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, System.Actions, Vcl.ActnList, dxBar,
  cxClasses, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxLabel, Estado, Table, PesquisaGenerica, Cidade;

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
    procedure edtEstadoPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
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

procedure TFrmCadastroCidade.ActPesquisarExecute(Sender: TObject);
var
  vSql: String;
begin
  vSql := 'SELECT ' +
          '  A.ID, ' +
          '  A.NOME, ' +
          '  B.NOME AS ESTADO ' +
          'FROM ' +
          '  COMUM.CIDADE A ' +
          'INNER JOIN COMUM.ESTADO B ' +
          '  ON A.IDESTADO = B.ID ' +
          'ORDER BY ' +
          '  A.ID';
  ConnectionVerify;
  Table := TFrmPesquisaGenerica.SearchSQL(Table, vSql);
  if Table <> nil then
  begin
    SetFieldsFromSearch;
  end;
  SetBrowseMode;
end;

procedure TFrmCadastroCidade.CleanFields;
begin
  inherited;
  edtNome.Clear;
  edtEstado.Clear;
  lbNomeEstado.Clear;
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
