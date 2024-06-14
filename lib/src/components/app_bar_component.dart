import 'package:fipe_consultation/src/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key, required this.title, required this.themeController, this.hasLeading = true});
  final String title;
  final ThemeController themeController;
  final bool hasLeading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      // Conteúdo
      title: Text(title.toUpperCase(), style: theme.textTheme.titleSmall),
      actions: [
        IconButton(
          icon: Icon(themeController.isDarkTheme ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
          onPressed: () => themeController.toggleTheme(),
        ),
      ],
      automaticallyImplyLeading: false,
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
