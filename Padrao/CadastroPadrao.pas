unit CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaPadrao, Table, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, uDmDao, dxBarExtItems, Data.DB, Vcl.ExtCtrls;

type
  TFrmCadastroPadrao = class(TFrmTelaPadrao)
    bmControladorBarra: TdxBarManager;
    bmBarraFerramenta: TdxBar;
    btnNovo: TdxBarLargeButton;
    btnAlterar: TdxBarLargeButton;
    btnExcluir: TdxBarLargeButton;
    btnSalvar: TdxBarLargeButton;
    btnCancelar: TdxBarLargeButton;
    btnPesquisar: TdxBarLargeButton;
    btnSair: TdxBarLargeButton;
    alAcoes: TActionList;
    ActNovo: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    ActSalvar: TAction;
    ActCancelar: TAction;
    ActPesquisar: TAction;
    ActSair: TAction;
    pnPrincipal: TPanel;
    procedure ActNovoExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
  private
    FTable: TTable;
    FInserting: Boolean;
    FUpdating: Boolean;
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
    procedure SetFieldsFromSearch(ADataSet: TDataSet); virtual; abstract;
    procedure GetPk; virtual; abstract;
    function VerifyId: Integer; virtual; abstract;
  end;

var
  FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

{$R *.dfm}

{ TFrmCadastroPadrao }

procedure TFrmCadastroPadrao.ActAlterarExecute(Sender: TObject);
begin
  inherited;
  SetEditMode;
  FInserting := False;
  FUpdating  := True;
end;

procedure TFrmCadastroPadrao.ActCancelarExecute(Sender: TObject);
begin
  inherited;
  if FUpdating then
  begin
    SetFieldsTable;
  end
  else
  begin
    CleanFields;
  end;
  SetBrowseMode;
  FInserting := False;
  FUpdating  := False;
end;

procedure TFrmCadastroPadrao.ActExcluirExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir este registro?', 'Atenção',
                            MB_APPLMODAL + MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    ConnectionVerify;
    RegDelete;
    CleanFields;
    SetBrowseMode;
  end;
end;

procedure TFrmCadastroPadrao.ActNovoExecute(Sender: TObject);
begin
  inherited;
  SetEditMode;
  FInserting := True;
  FUpdating  := False;
end;

procedure TFrmCadastroPadrao.ActPesquisarExecute(Sender: TObject);
var
  vDataSet: TDataSet;
begin
  inherited;
  SetFieldsFromSearch(vDataSet);
end;

procedure TFrmCadastroPadrao.ActSairExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmCadastroPadrao.ActSalvarExecute(Sender: TObject);
begin
  inherited;
  SetTableFields;

  if FInserting then
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
  FInserting := False;
  FUpdating  := False;
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
        raise Exception.Create('Verifique a conexão com o banco de dados!' +
                               #13 + e.message);
      end;
    end;
  end;
end;

procedure TFrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  SetBrowseMode;
  FInserting := False;
  FUpdating  := False;
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
      DmDao.Transaction.RollBack;
      raise Exception.Create('Erro ao excluir!' + #13 + e.message);
    end;
  end;
end;

procedure TFrmCadastroPadrao.RegInsert;
begin
  DmDao.Transaction.StartTransaction;
  try
    GetPk;
    DmDao.Dao.Insert(FTable);
    DmDao.Transaction.Commit;
  except
    on E: Exception do
    begin
      DmDao.Transaction.RollBack;
      raise Exception.Create('Erro ao inserir!' + #13 + e.message);
    end;
  end;
end;

procedure TFrmCadastroPadrao.SetBrowseMode;
begin
  ActNovo.Enabled      := True;
  ActAlterar.Enabled   := VerifyID > 0;
  ActExcluir.Enabled   := VerifyID > 0;
  ActSalvar.Enabled    := False;
  ActCancelar.Enabled  := False;
  ActPesquisar.Enabled := True;
  ActSair.Enabled      := True;
  pnPrincipal.Enabled  := False;
end;

procedure TFrmCadastroPadrao.SetEditMode;
begin
  ActNovo.Enabled      := False;
  ActAlterar.Enabled   := False;
  ActExcluir.Enabled   := False;
  ActSalvar.Enabled    := True;
  ActCancelar.Enabled  := True;
  ActPesquisar.Enabled := False;
  ActSair.Enabled      := False;
  pnPrincipal.Enabled  := True;
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
      DmDao.Transaction.RollBack;
      raise Exception.Create('Erro ao alterar!' + #13 + e.message);
    end;
  end;
end;

end.
