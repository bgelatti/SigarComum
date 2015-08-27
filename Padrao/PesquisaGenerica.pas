unit PesquisaGenerica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Table,
  Datasnap.DBClient, dxSkinLilian, dxSkinsCore, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, CadastroPesquisaGenerica;

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
    function GetSearchSQL(ATable: TTable): string;
  public
    class function SearchTable(ATable: TTable): TTable;
  end;

var
  FrmPesquisaGenerica: TFrmPesquisaGenerica;

implementation

uses
  uDmDao, PesquisaGenericaSQL;

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

function TFrmPesquisaGenerica.GetSearchSQL(ATable: TTable): string;
var
  vPesquisa: TPesquisaGenericaSQL;
  vReg: Integer;
begin
  vPesquisa := TPesquisaGenericaSQL.Create;
  try
    vPesquisa.Objeto := UpperCase(ATable.ToString);
    vReg := DmDao.Dao.Read(vPesquisa);

    if vReg > 0 then
    begin
      Result := vPesquisa.SQL;
    end
    else
    begin
      Result := '';
    end;
  finally
    vPesquisa.Free;
  end;
end;

class function TFrmPesquisaGenerica.SearchTable(ATable: TTable): TTable;
var
  i: Integer;
  vSql: string;
begin
  Application.CreateForm(TFrmPesquisaGenerica, FrmPesquisaGenerica);
  try
    with FrmPesquisaGenerica do
    begin
      vSql := GetSearchSQL(ATable);
      if vSql <> '' then
      begin
        dsPesquisa.DataSet := DmDao.Dao.SearchSql(vSql);
      end
      else
      begin
        dsPesquisa.DataSet := DmDao.Dao.SearchTab(ATable, []);
      end;

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

end.
