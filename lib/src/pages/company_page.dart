import 'package:fipe_consultation/src/components/app_bar_component.dart';
import 'package:fipe_consultation/src/components/text_component.dart';
import 'package:fipe_consultation/src/controllers/theme_controller.dart';
import 'package:fipe_consultation/src/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key, required this.company});
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (_) => AppBarComponent(
            title: 'Consultar CNPJ',
            themeController: themeController,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextComponent(text: 'CNPJ: ${company.cnpj}'),
              TextComponent(text: 'UF: ${company.uf}'),
              TextComponent(text: 'CEP: ${company.cep}'),
              TextComponent(text: 'País: ${company.country}'),
              TextComponent(text: 'Nome do sócio: ${company.memberName}'),
              TextComponent(text: 'Email: ${company.email}'),
              TextComponent(text: 'Porte: ${company.size}'),
              TextComponent(text: 'Bairro: ${company.neighborhood}'),
              TextComponent(text: 'Número: ${company.number}'),
              TextComponent(text: 'Cidade: ${company.city}'),
              TextComponent(text: 'Logradouro: ${company.street}'),
              TextComponent(text: 'Complemento: ${company.complement}'),
              TextComponent(text: 'Razão social: ${company.socialReason}'),
              TextComponent(text: 'Nome fantasia: ${company.fantasyName}'),
              TextComponent(text: 'Descrição: ${company.description}'),
              TextComponent(text: 'Data de início: ${company.initDate}'),
              TextComponent(text: 'Status de registro: ${company.registrationStatus}'),
            ],
          ),
        ),
      ),
    );
  }
}
