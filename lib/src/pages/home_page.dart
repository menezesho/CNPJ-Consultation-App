import 'package:fipe_consultation/src/components/app_bar_component.dart';
import 'package:fipe_consultation/src/components/elevated_button_component.dart';
import 'package:fipe_consultation/src/components/info_card_component.dart';
import 'package:fipe_consultation/src/components/text_form_field_component.dart';
import 'package:fipe_consultation/src/controllers/company_controller.dart';
import 'package:fipe_consultation/src/controllers/theme_controller.dart';
import 'package:fipe_consultation/src/pages/company_page.dart';
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
        child: Observer(
          builder: (_) => AppBarComponent(
            title: 'Check CNPJ',
            themeController: themeController,
            hasLeading: false,
          ),
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
                Observer(
                  builder: (_) => companyController.errorMessage.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              companyController.errorMessage,
                              style: theme.textTheme.labelSmall!.copyWith(color: theme.colorScheme.error),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 46),
                if (companyController.company != null)
                  InfoCardComponent(
                    company: companyController.company!,
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => CompanyPage(company: companyController.company!),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
