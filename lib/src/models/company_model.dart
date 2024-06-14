class CompanyModel {
  final String cnpj;
  final String fantasyName;
  final String socialReason;
  final String description;
  final String size;
  final String? email;
  final DateTime initDate;
  final String registrationStatus;
  final String memberName;
  final String cep;
  final String streetType;
  final String street;
  final String number;
  final String neighborhood;
  final String city;
  final String uf;
  final String? country;
  final String? complement;

  CompanyModel({
    required this.cnpj,
    required this.uf,
    required this.cep,
    required this.country,
    required this.memberName,
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
      cnpj: json['cnpj'],
      uf: json['uf'],
      cep: json['cep'],
      country: json['pais'],
      memberName: json['qsa'][0]['nome_socio'],
      email: json['email'],
      size: json['company_size'],
      neighborhood: json['neighborhood'],
      number: json['phone'],
      city: json['city'],
      street: json['street'],
      streetType: json['desc_street_type'],
      complement: json['complement'],
      socialReason: json['social_reason'] ?? '',
      fantasyName: json['trading_name'] ?? '',
      description: json['cnae_fiscal_desc'],
      initDate: DateTime.parse(json['date_start_activity']),
      registrationStatus: json['description_cadastral_situation'],
    );
  }
}