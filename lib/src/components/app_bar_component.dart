import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key, required this.title, required this.actions, this.hasLeading = true});
  final String title;
  final List<Widget> actions;
  final bool hasLeading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      // Conteúdo
      title: Text(title.toUpperCase(), style: theme.textTheme.titleSmall),
      actions: actions,
      leading: hasLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,

      // Configuração
      centerTitle: true,
      elevation: 0,

      // Estilização
      backgroundColor: Colors.transparent,
      foregroundColor: theme.colorScheme.onPrimary,
      shadowColor: Colors.transparent,
    );
  }
}
