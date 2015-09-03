unit FilialEndereco;

interface

uses
  Atributos, Table;

type
  [AttTable('COMUM.FILIALENDERECO')]
  TFilialEndereco = class(TTable)
  private
    FLogradouro: string;
    FCep: string;
    FId: Double;
    FNumero: string;
    FIdFilial: Double;
    FIdBairro: Double;
    FComplemento: string;
    procedure SetCep(const Value: string);
    procedure SetId(const Value: Double);
    procedure SetIdBairro(const Value: Double);
    procedure SetIdFilial(const Value: Double);
    procedure SetLogradouro(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetComplemento(const Value: string);
  public
    [AttPK]
    [AttNotNull('Código do Endereço da Filial')]
    property Id: Double read FId write SetId;
    [AttNotNull('Filial do Endereço da Filial')]
    property IdFilial: Double read FIdFilial write SetIdFilial;
    [AttNotNull('Bairro do Endereço da Filial')]
    property IdBairro: Double read FIdBairro write SetIdBairro;
    [AttNotNull('Logradouro do Endereço da Filial')]
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Numero: string read FNumero write SetNumero;
    property Cep: string read FCep write SetCep;
    property Complemento: string read FComplemento write SetComplemento;
  end;

implementation

{ TFilialEndereco }

procedure TFilialEndereco.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TFilialEndereco.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TFilialEndereco.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TFilialEndereco.SetIdBairro(const Value: Double);
begin
  FIdBairro := Value;
end;

procedure TFilialEndereco.SetIdFilial(const Value: Double);
begin
  FIdFilial := Value;
end;

procedure TFilialEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TFilialEndereco.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

end.
