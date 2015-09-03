unit Filial;

interface

uses
  Atributos, Table;

type
  [AttTable('COMUM.FILIAL')]
  TFilial = class(TTable)
  private
    FDocEstadual: string;
    FId: Double;
    FDocFederal: string;
    FRazaoSocial: string;
    FRntrc: string;
    FNomeFantasia: string;
    procedure SetDocEstadual(const Value: string);
    procedure SetDocFederal(const Value: string);
    procedure SetId(const Value: Double);
    procedure SetNomeFantasia(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    procedure SetRntrc(const Value: string);
  public
    [AttPK]
    [AttNotNull('Código da Filial')]
    property Id: Double read FId write SetId;
    [AttNotNull('Razão Social da Filial')]
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    property NomeFantasia: string read FNomeFantasia write SetNomeFantasia;
    property DocFederal: string read FDocFederal write SetDocFederal;
    property DocEstadual: string read FDocEstadual write SetDocEstadual;
    property Rntrc: string read FRntrc write SetRntrc;
  end;

implementation

{ TFilial }

procedure TFilial.SetDocEstadual(const Value: string);
begin
  FDocEstadual := Value;
end;

procedure TFilial.SetDocFederal(const Value: string);
begin
  FDocFederal := Value;
end;

procedure TFilial.SetId(const Value: Double);
begin
  FId := Value;
end;

procedure TFilial.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TFilial.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TFilial.SetRntrc(const Value: string);
begin
  FRntrc := Value;
end;

end.
