unit PesquisaGenerica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Table,
  Datasnap.DBClient, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TFrmPesquisaGenerica = class(TFrmTelaPadrao)
    cxgvPesquisa: TcxGridDBTableView;
    cxgPesquisaLevel1: TcxGridLevel;
    cxgPesquisa: TcxGrid;
    bmMenuLateral: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    ListaAcao: TActionList;
    ActSair: TAction;
    dsPesquisa: TDataSource;
    procedure ActSairExecute(Sender: TObject);
    procedure cxgvPesquisaDblClick(Sender: TObject);
  private
    FFiltered: Boolean;
  public
    class function SearchTable(ATable: TTable): TTable;
    class function SearchSQL(ATable: TTable; ASql: String): TTable;
  end;

var
  FrmPesquisaGenerica: TFrmPesquisaGenerica;

implementation

uses
  uDmDao;

{$R *.dfm}

procedure TFrmPesquisaGenerica.ActSairExecute(Sender: TObject);
begin
  inherited;
  FFiltered := False;
  Close;
end;

procedure TFrmPesquisaGenerica.cxgvPesquisaDblClick(Sender: TObject);
var
  i: Integer;
  vSep, vFilter: String;
begin
  inherited;
  FFiltered := True;
  vSep := '';
  for i := 0 to dsPesquisa.DataSet.FieldCount - 1 do
  begin
    case dsPesquisa.DataSet.Fields.Fields[i].DataType of
      ftString:
      begin
        vFilter := vSep + dsPesquisa.DataSet.Fields.Fields[i].FieldName +
          ' = ' + QuotedStr(dsPesquisa.DataSet.Fields.Fields[i].AsString);
      end;
      ftFloat:
      begin
        vFilter := vSep + dsPesquisa.DataSet.Fields.Fields[i].FieldName +
          ' = ' + FloatToStr(dsPesquisa.DataSet.Fields.Fields[i].AsFloat);
      end;
      ftInteger:
      begin
        vFilter := vSep + dsPesquisa.DataSet.Fields.Fields[i].FieldName +
          ' = ' + IntToStr(dsPesquisa.DataSet.Fields.Fields[i].AsInteger);
      end;
      ftDateTime:
      begin
        vFilter := vSep + dsPesquisa.DataSet.Fields.Fields[i].FieldName +
          ' = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dsPesquisa.DataSet.Fields.Fields[i].AsDateTime));
      end;
    end;
    dsPesquisa.DataSet.Filter := dsPesquisa.DataSet.Filter + vFilter;
    vSep := ' AND ';
  end;
  dsPesquisa.DataSet.Filtered := True;
  Close;
end;

class function TFrmPesquisaGenerica.SearchSQL(ATable: TTable;
  ASql: String): TTable;
var
  i: Integer;
begin
  Application.CreateForm(TFrmPesquisaGenerica, FrmPesquisaGenerica);
  try
    with FrmPesquisaGenerica do
    begin
      dsPesquisa.DataSet := DmDao.Dao.SearchSql(ASql);

      for i := 0 to dsPesquisa.DataSet.FieldCount - 1 do
      begin
        dsPesquisa.DataSet.Fields.Fields[i].DisplayLabel := UpperCase(
          dsPesquisa.DataSet.Fields.Fields[i].DisplayLabel);
      end;

      cxgvPesquisa.DataController.CreateAllItems();
      cxgvPesquisa.ApplyBestFit();

      ShowModal;

      if FFiltered then
      begin
        ATable := DmDao.Dao.DataSetToTable(ATable, dsPesquisa.DataSet);
        DmDao.Dao.Read(ATable);
        Result := ATable;
      end
      else
      begin
        Result := ATable;
      end;
    end;
  finally
    FrmPesquisaGenerica.Free;
  end;
end;

class function TFrmPesquisaGenerica.SearchTable(ATable: TTable): TTable;
var
  i: Integer;
begin
  Application.CreateForm(TFrmPesquisaGenerica, FrmPesquisaGenerica);
  try
    with FrmPesquisaGenerica do
    begin
      dsPesquisa.DataSet := DmDao.Dao.SearchTab(ATable, []);

      for i := 0 to dsPesquisa.DataSet.FieldCount - 1 do
      begin
        dsPesquisa.DataSet.Fields.Fields[i].DisplayLabel := UpperCase(
          dsPesquisa.DataSet.Fields.Fields[i].DisplayLabel);
      end;

      cxgvPesquisa.DataController.CreateAllItems();
      cxgvPesquisa.ApplyBestFit();

      ShowModal;

      if FFiltered then
      begin
        Result := DmDao.Dao.DataSetToTable(ATable, dsPesquisa.DataSet);
      end
      else
      begin
        Result := ATable;
      end;
    end;
  finally
    FrmPesquisaGenerica.Free;
  end;
end;

end.
