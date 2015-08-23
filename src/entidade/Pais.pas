unit Pais;

interface

uses
  Table, Atributos;

type
  [AttTable('COMUM.PAIS')]
  TPais = class(TTable)
  private
    FId: Integer;
    FNome: string;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    [AttPK]
    [AttNotNull('C�digo do Pais')]
    property Id: Integer read FId write SetId;
    [AttNotNull('Nome do Pais')]
    property Nome: string read FNome write SetNome;
  end;

implementation

{ TPais }

procedure TPais.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPais.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.

