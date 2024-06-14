import 'package:fipe_consultation/src/components/app_bar_component.dart';
import 'package:fipe_consultation/src/components/elevated_button_component.dart';
import 'package:fipe_consultation/src/components/info_card_component.dart';
import 'package:fipe_consultation/src/components/text_form_field_component.dart';
import 'package:fipe_consultation/src/controllers/company_controller.dart';
import 'package:fipe_consultation/src/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CompanyController companyController = CompanyController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MaskedTextController cnpjController = MaskedTextController(mask: '00.000.000/0000-00');

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarComponent(
          title: 'Consultar CNPJ',
          hasLeading: false,
          actions: [
            Observer(
              builder: (_) => IconButton(
                icon: Icon(themeController.isDarkTheme ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
                onPressed: () => themeController.toggleTheme(),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Observer(
            builder: (_) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormFieldComponent(
                          controller: cnpjController,
                          label: 'CNPJ',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (value.length < 18) {
                              return 'CNPJ inválido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButtonComponent(
                          text: 'Consultar',
                          enabled: !companyController.isLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              companyController.searchCnpj(
                                cnpjController.text.replaceAll('.', '').replaceAll('-', '').replaceAll('/', ''),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 46),
                if (companyController.company != null) InfoCardComponent(company: companyController.company!),

                // AnimatedSwitcherComponent(
                //   child: companyController.company == null
                //       ? const SizedBox()
                //       : Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const SizedBox(height: 16),
                //             TextComponent(text: 'CNPJ: ${companyController.company?.cnpj}'),
                //             TextComponent(text: 'UF: ${companyController.company?.uf}'),
                //             TextComponent(text: 'CEP: ${companyController.company?.cep}'),
                //             TextComponent(text: 'País: ${companyController.company?.country}'),
                //             TextComponent(text: 'Nome do sócio: ${companyController.company?.memberName}'),
                //             TextComponent(text: 'Email: ${companyController.company?.email}'),
                //             TextComponent(text: 'Porte: ${companyController.company?.size}'),
                //             TextComponent(text: 'Bairro: ${companyController.company?.neighborhood}'),
                //             TextComponent(text: 'Número: ${companyController.company?.number}'),
                //             TextComponent(text: 'Cidade: ${companyController.company?.city}'),
                //             TextComponent(text: 'Logradouro: ${companyController.company?.street}'),
                //             TextComponent(text: 'Complemento: ${companyController.company?.complement}'),
                //             TextComponent(text: 'Razão social: ${companyController.company?.socialReason}'),
                //             TextComponent(text: 'Nome fantasia: ${companyController.company?.fantasyName}'),
                //             TextComponent(text: 'Descrição: ${companyController.company?.description}'),
                //             TextComponent(text: 'Data de início: ${companyController.company?.initDate}'),
                //             TextComponent(text: 'Status de registro: ${companyController.company?.registrationStatus}'),
                //           ],
                //         ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
