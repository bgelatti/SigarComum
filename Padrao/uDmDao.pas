unit uDmDao;

interface

uses
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls, cxGraphics,
  ConnectionUni, TransactionUni, DaoUni;

type
  TDmDao = class(TDataModule)
    ListaImagem24x24: TcxImageList;
    ListaImagem16x16: TcxImageList;
  private
    { Private declarations }
  public
    Dao: TDaoUni;
    Transaction: TTransactionUni;
    Connection: TConnectionUni;
    procedure SetDao(AConnection: TConnectionUni);
  end;

var
  DmDao: TDmDao;

implementation

{$R *.dfm}

{ TFrmDmDao }

procedure TDmDao.SetDao(AConnection: TConnectionUni);
begin
  Transaction := TTransactionUni.Create(AConnection.Database);
  Connection := AConnection;
  Dao := TDaoUni.Create(Connection, Transaction);
end;

end.
