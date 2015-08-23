unit Pais;

interface

uses
  Table, Atributos;

type
  [AttTable('COMUM.PAIS')]
  TPais = class(TTable)
  private
    FNome: string;
    FId: Double;
    procedure SetNome(const Value: string);
    procedure SetId(const Value: Double);
  public
    [AttPK]
    [AttNotNull('Código do Pais')]
    property Id: Double read FId write SetId;
    [AttNotNull('Nome do Pais')]
    property Nome: string read FNome write SetNome;
  end;

implementation

{ TPais }

procedure TPais.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TPais.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.

