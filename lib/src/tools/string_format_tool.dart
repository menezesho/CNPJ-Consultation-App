class StringFormat {
  static formatCnpj(cnpj) {
    // Verifica se o CNPJ é nulo
    if (cnpj == null) return '';

    // Verifica se o CNPJ é menor que 14 caracteres
    if (cnpj.length < 14) return '';

    // Remove caracteres não numéricos do CNPJ
    cnpj = cnpj.replaceAll(RegExp(r'\D'), '');

    // Adiciona os separadores do CNPJ
    return '${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}';
  }

  static formatCep(cep) {
    if (cep == null) return '';
    // Remove caracteres não numéricos do CEP
    cep = cep.replaceAll(RegExp(r'\D'), '');
    // Adiciona os separadores do CEP
    return '${cep.substring(0, 5)}-${cep.substring(5)}';
  }

  static formatAddress(String streetType, String street, String number, String complement, String neighborhood, String city, String uf, String cep) {
    return '$streetType $street, $number${complement.isNotEmpty ? ', $complement' : ''}${complement.isNotEmpty ? ' - $complement' : ''}, $city/$uf, ${formatCep(cep)}';
  }
}
