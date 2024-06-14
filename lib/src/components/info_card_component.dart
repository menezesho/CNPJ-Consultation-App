import 'package:fipe_consultation/src/models/company_model.dart';
import 'package:flutter/material.dart';

class InfoCardComponent extends StatelessWidget {
  const InfoCardComponent({super.key, required this.company});
  final CompanyModel company;

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
      title: Text(company.socialReason, style: theme.textTheme.labelLarge),
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
                    Text(company.fantasyName, style: theme.textTheme.labelSmall),
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
      onTap: () => print('Card tapped'),
    );
  }
}
