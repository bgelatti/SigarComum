unit Estado;

interface

uses
  Atributos, Table;

type
  [AttTable('COMUM.ESTADO')]
  TEstado = class(TTable)
  private
    FIdPais: Double;
    FId: Double;
    FNome: String;
    procedure SetId(const Value: Double);
    procedure SetIdPais(const Value: Double);
    procedure SetNome(const Value: String);
  public
    [AttPK]
    [AttNotNull('Código do Estado')]
    property Id: Double read FId write SetId;
    [AttNotNull('Nome do Estado')]
    property Nome: String read FNome write SetNome;
    [AttNotNull('País do Estado')]
    property IdPais: Double read FIdPais write SetIdPais;
  end;

implementation

{ TEstado }

procedure TEstado.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TEstado.SetIdPais(const Value: Double);
begin
  FIdPais := Value;
end;

procedure TEstado.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
