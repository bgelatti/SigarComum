unit Cidade;

interface

uses
  Table, Atributos;

type
  [AttTable('COMUM.CIDADE')]
  TCidade = class(TTable)
  private
    FIdEstado: Double;
    FId: Double;
    FNome: string;
    procedure SetId(const Value: Double);
    procedure SetIdEstado(const Value: Double);
    procedure SetNome(const Value: string);
  public
    [AttPK]
    [AttNotNull('Código da Cidade')]
    property Id: Double read FId write SetId;
    [AttNotNull('Nome da Cidade')]
    property Nome: string read FNome write SetNome;
    [AttNotNull('Estado da Cidade')]
    property IdEstado: Double read FIdEstado write SetIdEstado;
  end;

implementation

{ TCidade }

procedure TCidade.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TCidade.SetIdEstado(const Value: Double);
begin
  FIdEstado := Value;
end;

procedure TCidade.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
