unit Bairro;

interface

uses
  Atributos, Table;

type
  [AttTable('COMUM.BAIRRO')]
  TBairro = class(TTable)
  private
    FIdCidade: Double;
    FId: Double;
    FNome: string;
    procedure SetId(const Value: Double);
    procedure SetIdCidade(const Value: Double);
    procedure SetNome(const Value: string);
  public
    [AttPK]
    [AttNotNull('Código do Bairro')]
    property Id: Double read FId write SetId;
    [AttNotNull('Nome do Bairro')]
    property Nome: string read FNome write SetNome;
    [AttNotNull('Cidade do Bairro')]
    property IdCidade: Double read FIdCidade write SetIdCidade;
  end;

implementation

{ TBairro }

procedure TBairro.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TBairro.SetIdCidade(const Value: Double);
begin
  FIdCidade := Value;
end;

procedure TBairro.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
