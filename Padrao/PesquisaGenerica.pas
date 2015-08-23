unit PesquisaGenerica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Table,
  Datasnap.DBClient;

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
  private
    { Private declarations }
  public
    function SearchTable(ATable: TTable): TTable;
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
  Close;
end;

function TFrmPesquisaGenerica.SearchTable(ATable: TTable): TTable;
begin
  dsPesquisa.DataSet := DmDao.Dao.SearchTab(ATable, []);
//  cxgvPesquisa.DataController.
end;

end.
