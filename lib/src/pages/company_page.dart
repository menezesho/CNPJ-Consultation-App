import 'package:fipe_consultation/src/components/app_bar_component.dart';
import 'package:fipe_consultation/src/components/info_text_component.dart';
import 'package:fipe_consultation/src/controllers/theme_controller.dart';
import 'package:fipe_consultation/src/models/company_model.dart';
import 'package:fipe_consultation/src/tools/datetime_format_tool.dart';
import 'package:fipe_consultation/src/tools/string_format_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key, required this.company});
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (_) => AppBarComponent(
            title: 'Detalhes da empresa',
            themeController: themeController,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.home_work_rounded, size: 60),
            const SizedBox(height: 46),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                company.socialReason,
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 46),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTextComponent(title: 'Nome fantasia', value: company.fantasyName),
                InfoTextComponent(title: 'CNPJ', value: StringFormat.formatCnpj(company.cnpj)),
                InfoTextComponent(title: 'Descrição', value: company.description),
                InfoTextComponent(
                  title: 'E-mail',
                  value: company.email ?? '',
                ),
                InfoTextComponent(title: 'Data de início', value: DatetimeFormatTool.format(company.initDate)),
                InfoTextComponent(title: 'Status', value: company.registrationStatus),
                InfoTextComponent(title: 'Porte', value: company.size),
                InfoTextComponent(title: 'Nome do sócio', value: company.memberName),
                InfoTextComponent(
                  title: 'País',
                  value: company.country ?? '',
                ),
                InfoTextComponent(
                  title: 'Endereço',
                  value: StringFormat.formatAddress(
                    company.streetType,
                    company.street,
                    company.number,
                    company.complement ?? '',
                    company.neighborhood,
                    company.city,
                    company.uf,
                    company.cep,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
