unit CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaPadrao, Table, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, uDmDao, dxBarExtItems, Data.DB, Vcl.ExtCtrls,
  dxSkinLilian, dxSkinsCore, dxSkinsdxBarPainter, SigarEdit, System.Rtti,
  SigarMemo;

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
    alAcoesCadastro: TActionList;
    ActNovo: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    ActSalvar: TAction;
    ActCancelar: TAction;
    ActPesquisar: TAction;
    ActSair: TAction;
    pnPrincipal: TPanel;
    alAcoesGerais: TActionList;
    procedure ActNovoExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
  private
    FTable: TTable;
    FInserting: Boolean;
    FUpdating: Boolean;
    procedure SetTable(const Value: TTable);
    procedure RegInsert;
    procedure RegUpdate;
    procedure RegDelete;
    procedure SetEditField(AField: String; AValor: Variant);
    function SetFieldEdit(AField: String): Variant;
  public
    procedure ConnectionVerify;
    procedure SetBrowseMode;
    procedure SetEditMode;
    procedure SetTableFields;
    procedure SetFieldsTable;
    procedure CleanFields; virtual; abstract;
    procedure SetFieldsFromSearch;
    procedure GetPk; virtual; abstract;
    function VerifyId: Double; virtual; abstract;
    property Table: TTable read FTable write SetTable;
  end;

var
  FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

uses
  PesquisaGenerica;

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
  CleanFields;
end;

procedure TFrmCadastroPadrao.ActPesquisarExecute(Sender: TObject);
begin
  inherited;
  ConnectionVerify;
  FTable := TFrmPesquisaGenerica.SearchTable(FTable);
  if FTable <> nil then
  begin
    SetFieldsFromSearch;
  end;
  SetBrowseMode;
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

procedure TFrmCadastroPadrao.SetEditField(AField: String; AValor: Variant);
var
  Context: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
begin
  Context := TRttiContext.Create;
  try
    RttiType := Context.GetType(FTable.ClassType);
    for RttiProperty in RttiType.GetProperties do
    begin
      if UpperCase(RttiProperty.Name) = UpperCase(AField) then
      begin
        case RttiProperty.PropertyType.TypeKind of
          tkInt64, tkInteger:
            begin
              RttiProperty.SetValue(FTable, Integer(AValor));
            end;
          tkChar, tkString, tkUString:
            begin
              RttiProperty.SetValue(FTable, String(AValor));
            end;
          tkFloat:
            begin
              if CompareText(RttiProperty.PropertyType.Name, 'TDateTime') = 0 then
              begin
                RttiProperty.SetValue(FTable, TDateTime(AValor));
              end
              else
              begin
                RttiProperty.SetValue(FTable, Double(AValor));
              end;
            end;
        else
          raise Exception.Create('Tipo de Campo não conhecido: ' +
            RttiProperty.PropertyType.ToString);
        end;
      end;
    end;
  finally
    Context.Free;
  end;
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

function TFrmCadastroPadrao.SetFieldEdit(AField: String): Variant;
var
  Context: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
begin
  Result := '';
  Context := TRttiContext.Create;
  try
    RttiType := Context.GetType(FTable.ClassType);
    for RttiProperty in RttiType.GetProperties do
    begin
      if UpperCase(RttiProperty.Name) = UpperCase(AField) then
      begin
        case RttiProperty.PropertyType.TypeKind of
          tkInt64, tkInteger:
            begin
              Result := RttiProperty.GetValue(Table).AsInteger;
            end;
          tkChar, tkString, tkUString:
            begin
              Result := RttiProperty.GetValue(Table).AsString;
            end;
          tkFloat:
            begin
              if CompareText(RttiProperty.PropertyType.Name, 'TDateTime') = 0 then
              begin
                Result := RttiProperty.GetValue(Table).AsType<TDateTime>;
              end
              else
              begin
                Result := RttiProperty.GetValue(Table).AsCurrency;
              end;
            end;
        else
          raise Exception.Create('Tipo de Campo não conhecido: ' +
            RttiProperty.PropertyType.ToString);
        end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

procedure TFrmCadastroPadrao.SetFieldsFromSearch;
begin
  SetFieldsTable;
end;

procedure TFrmCadastroPadrao.SetFieldsTable;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i].ClassType = TSigarEdit then
    begin
      TSigarEdit(Self.Components[i]).Text := String(SetFieldEdit(TSigarEdit(
        Self.Components[i]).SigarField))
    end
    else if Self.Components[i].ClassType = TSigarMemo then
    begin
      TSigarMemo(Self.Components[i]).Text := String(SetFieldEdit(TSigarMemo(
        Self.Components[i]).SigarField))
    end;
  end;
end;

procedure TFrmCadastroPadrao.SetTable(const Value: TTable);
begin
  FTable := Value;
end;

procedure TFrmCadastroPadrao.SetTableFields;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i].ClassType = TSigarEdit then
    begin
      SetEditField(TSigarEdit(Self.Components[i]).SigarField,
        TSigarEdit(Self.Components[i]).Text);
    end
    else if Self.Components[i].ClassType = TSigarMemo then
    begin
      SetEditField(TSigarMemo(Self.Components[i]).SigarField,
        TSigarMemo(Self.Components[i]).Text);
    end;
  end;
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
