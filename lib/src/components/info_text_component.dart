import 'package:flutter/material.dart';

class InfoTextComponent extends StatelessWidget {
  const InfoTextComponent({
    super.key,
    required this.title,
    required this.value,
    this.upperCase = true,
    this.valueColor,
  });

  final String title;
  final String value;
  final bool upperCase;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = value.isEmpty ? 'Não informado' : value;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: theme.textTheme.labelSmall,
            ),
            const SizedBox(width: 20.0),
            Flexible(
              child: Text(
                upperCase ? text.toUpperCase() : text,
                textAlign: TextAlign.end,
                style: theme.textTheme.labelSmall?.copyWith(color: value.isEmpty ? theme.colorScheme.error : theme.colorScheme.onSecondary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
