class CompanyModel {
  final String cnpj;
  final String fantasyName;
  final String socialReason;
  final String description;
  final String size;
  final String? email;
  final DateTime initDate;
  final String registrationStatus;
  final List<String> membersName;
  final String cep;
  final String streetType;
  final String street;
  final String number;
  final String neighborhood;
  final String city;
  final String uf;
  final String? complement;

  CompanyModel({
    required this.cnpj,
    required this.uf,
    required this.cep,
    required this.membersName,
    required this.email,
    required this.size,
    required this.neighborhood,
    required this.number,
    required this.city,
    required this.street,
    required this.streetType,
    required this.complement,
    required this.socialReason,
    required this.fantasyName,
    required this.description,
    required this.initDate,
    required this.registrationStatus,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      cnpj: json['cnpj'] ?? '',
      uf: json['uf'] ?? '',
      cep: json['cep'] ?? '',
      membersName: json['qsa'] != null ? List<String>.from(json['qsa'].map((x) => x['nome_socio'])) : [],
      email: json['email'] ?? '',
      size: json['porte'] ?? '',
      neighborhood: json['bairro'] ?? '',
      number: json['numero'] ?? '',
      city: json['municipio'] ?? '',
      street: json['logradouro'] ?? '',
      streetType: json['descricao_tipo_de_logradouro'] ?? '',
      complement: json['complemento'] ?? '',
      socialReason: json['razao_social'] ?? '',
      fantasyName: json['nome_fantasia'] ?? '',
      description: json['cnae_fiscal_descricao'] ?? '',
      initDate: DateTime.parse(json['data_inicio_atividade'] ?? ''),
      registrationStatus: json['descricao_situacao_cadastral'] ?? '',
    );
  }
}
