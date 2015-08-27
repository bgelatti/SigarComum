unit PesquisaGenericaSQL;

interface

uses
  Table, Atributos;

type
  [AttTable('COMUM.PESQUISAGENERICASQL')]
  TPesquisaGenericaSQL = class(TTable)
  private
    FId: Double;
    FSQL: string;
    FObjeto: string;
    procedure SetId(const Value: Double);
    procedure SetObjeto(const Value: string);
    procedure SetSQL(const Value: string);
  public
    [AttNotNull('Código da Pesquisa')]
    property Id: Double read FId write SetId;
    [AttPK]
    [AttNotNull('Objeto da Pesquisa')]
    property Objeto: string read FObjeto write SetObjeto;
    property SQL: string read FSQL write SetSQL;
  end;

implementation

{ TPesquisaGenericaSQL }

procedure TPesquisaGenericaSQL.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TPesquisaGenericaSQL.SetObjeto(const Value: string);
begin
  FObjeto := Value;
end;

procedure TPesquisaGenericaSQL.SetSQL(const Value: string);
begin
  FSQL := Value;
end;

end.
