unit CadastroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, Pais, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxLabel, Vcl.ExtCtrls, cxTextEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter;

type
  TFrmCadastroPais = class(TFrmCadastroPadrao)
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
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
  FrmCadastroPais: TFrmCadastroPais;

implementation

uses
  uDmDao, PesquisaGenerica;

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
  ConnectionVerify;
  TPais(Table).Id := DmDao.Dao.GetID(Table, 'id');
end;

procedure TFrmCadastroPais.SetFieldsFromSearch;
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

function TFrmCadastroPais.VerifyId: Double;
begin
  Result := TPais(Table).Id;
end;

end.
