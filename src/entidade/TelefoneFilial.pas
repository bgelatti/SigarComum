unit TelefoneFilial;

interface

uses
  Atributos, Table;

type
  [AttTable('COMUM.FILIALTELEFONE')]
  TTelefoneFilial = class(TTable)
  private
    FId: Double;
    FNumero: string;
    FIdFilial: Double;
    FTipo: string;
    procedure SetId(const Value: Double);
    procedure SetIdFilial(const Value: Double);
    procedure SetNumero(const Value: string);
    procedure SetTipo(const Value: string);
  public
    [AttPK]
    [AttNotNull('Código do Telefone da Filial')]
    property Id: Double read FId write SetId;
    [AttNotNull('Filial do Telefone da Filial')]
    property IdFilial: Double read FIdFilial write SetIdFilial;
    property Tipo: string read FTipo write SetTipo;
    [AttNotNull('Número do Telefone da Filial')]
    property Numero: string read FNumero write SetNumero;
  end;

implementation

{ TTelefoneFilial }

procedure TTelefoneFilial.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TTelefoneFilial.SetIdFilial(const Value: Double);
begin
  FIdFilial := Value;
end;

procedure TTelefoneFilial.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TTelefoneFilial.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

end.
