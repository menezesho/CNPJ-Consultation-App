import 'package:fipe_consultation/src/models/company_model.dart';
import 'package:flutter/material.dart';

class InfoCardComponent extends StatelessWidget {
  const InfoCardComponent({super.key, required this.company, required this.onTap});
  final CompanyModel company;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: theme.colorScheme.secondary,
      contentPadding: const EdgeInsets.all(16),
      enableFeedback: true,
      iconColor: theme.colorScheme.onPrimary,
      leading: const Icon(Icons.home_work_rounded),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
      title: Text(
        company.socialReason,
        style: theme.textTheme.labelLarge,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (company.fantasyName.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.theater_comedy_rounded,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      company.fantasyName,
                      style: theme.textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          if (company.registrationStatus.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    company.registrationStatus.toUpperCase() == 'ATIVA'
                        ? Icon(
                            Icons.check_circle_rounded,
                            size: 16,
                            color: theme.colorScheme.onPrimary,
                          )
                        : Icon(
                            Icons.cancel_rounded,
                            color: theme.colorScheme.error,
                            size: 16,
                          ),
                    const SizedBox(width: 8),
                    Text(company.registrationStatus, style: theme.textTheme.labelSmall),
                  ],
                ),
              ],
            ),
          if (company.description.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: 4),
                Text(
                  company.description,
                  style: theme.textTheme.labelSmall!.copyWith(color: theme.colorScheme.onSecondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
