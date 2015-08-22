unit CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaPadrao, Table, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, uDmDao, dxBarExtItems;

type
  TFrmCadastroPadrao = class(TFrmTelaPadrao)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    ActionList1: TActionList;
    ActNovo: TAction;
    ActAltera: TAction;
    ActExclui: TAction;
    ActSalva: TAction;
    ActCancela: TAction;
    ActPesquisa: TAction;
    ActSai: TAction;
    dxBarSpinEdit1: TdxBarSpinEdit;
    procedure ActNovoExecute(Sender: TObject);
    procedure ActAlteraExecute(Sender: TObject);
    procedure ActSalvaExecute(Sender: TObject);
    procedure ActCancelaExecute(Sender: TObject);
    procedure ActSaiExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActPesquisaExecute(Sender: TObject);
    procedure ActExcluiExecute(Sender: TObject);
  private
    FTable: TTable;
    procedure SetTable(const Value: TTable);
    procedure SetBrowseMode;
    procedure SetEditMode;
    procedure ConnectionVerify;
    procedure RegInsert;
    procedure RegUpdate;
    procedure RegDelete;
  public
    property Table: TTable read FTable write SetTable;
    procedure SetTableFields; virtual; abstract;
    procedure SetFieldsTable; virtual; abstract;
    procedure CleanFields; virtual; abstract;
    function VerifyID: Integer; virtual; abstract;
  end;

var
  FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

{$R *.dfm}

{ TFrmCadastroPadrao }

procedure TFrmCadastroPadrao.ActAlteraExecute(Sender: TObject);
begin
  inherited;
  SetEditMode;
end;

procedure TFrmCadastroPadrao.ActCancelaExecute(Sender: TObject);
begin
  inherited;
  SetBrowseMode;
  SetFieldsTable;
end;

procedure TFrmCadastroPadrao.ActExcluiExecute(Sender: TObject);
begin
  inherited;
  ConnectionVerify;
  RegDelete;
end;

procedure TFrmCadastroPadrao.ActNovoExecute(Sender: TObject);
begin
  inherited;
  SetEditMode;
end;

procedure TFrmCadastroPadrao.ActPesquisaExecute(Sender: TObject);
begin
  inherited;
  SetFieldsTable;
end;

procedure TFrmCadastroPadrao.ActSaiExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmCadastroPadrao.ActSalvaExecute(Sender: TObject);
begin
  inherited;
  SetTableFields;

  if VerifyID > 0 then
  begin
    ConnectionVerify;
    RegInsert;
  end
  else
  begin
    ConnectionVerify;
    RegUpdate;
  end;
  SetBrowseMode;
end;

procedure TFrmCadastroPadrao.ConnectionVerify;
begin
  if not(DmDao.Connection.Connected) then
  begin
    try
      DmDao.Connection.Connect
    except
      on E: Exception do
      begin
        Application.MessageBox(PWideChar('Verifique a conexão com o banco de dados!' +
                               #13 + e.message), 'Erro', MB_APPLMODAL + MB_OK + MB_ICONERROR);
      end;
    end;
  end;
end;

procedure TFrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  SetBrowseMode;
end;

procedure TFrmCadastroPadrao.RegDelete;
begin
  DmDao.Transaction.StartTransaction;
  try
    DmDao.Dao.Delete(FTable);
    DmDao.Transaction.Commit;
  except
    on E: Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao excluir!' + #13 + e.message),
                            'Erro', MB_APPLMODAL + MB_OK + MB_ICONERROR);
      DmDao.Transaction.RollBack;
    end;
  end;
end;

procedure TFrmCadastroPadrao.RegInsert;
begin
  DmDao.Transaction.StartTransaction;
  try
    DmDao.Dao.Insert(FTable);
    DmDao.Transaction.Commit;
  except
    on E: Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao inserir!' + #13 + e.message),
                            'Erro', MB_APPLMODAL + MB_OK + MB_ICONERROR);
      DmDao.Transaction.RollBack;
    end;
  end;
end;

procedure TFrmCadastroPadrao.SetBrowseMode;
begin
  ActNovo.Enabled     := True;
  ActAltera.Enabled   := VerifyID > 0;
  ActExclui.Enabled   := VerifyID > 0;
  ActSalva.Enabled    := False;
  ActCancela.Enabled  := False;
  ActPesquisa.Enabled := True;
  ActSai.Enabled      := True;
end;

procedure TFrmCadastroPadrao.SetEditMode;
begin
  ActNovo.Enabled     := False;
  ActAltera.Enabled   := False;
  ActExclui.Enabled   := False;
  ActSalva.Enabled    := True;
  ActCancela.Enabled  := True;
  ActPesquisa.Enabled := False;
  ActSai.Enabled      := False;
end;

procedure TFrmCadastroPadrao.SetTable(const Value: TTable);
begin
  FTable := Value;
end;

procedure TFrmCadastroPadrao.RegUpdate;
begin
  DmDao.Transaction.StartTransaction;
  try
    DmDao.Dao.Update(FTable);
    DmDao.Transaction.Commit;
  except
    on E: Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao alterar!' + #13 + e.message),
                            'Erro', MB_APPLMODAL + MB_OK + MB_ICONERROR);
      DmDao.Transaction.RollBack;
    end;
  end;
end;

end.
