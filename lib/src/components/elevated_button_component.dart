import 'package:fipe_consultation/src/components/animated_switcher_component.dart';
import 'package:fipe_consultation/src/components/wave_loader_component.dart';
import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  const ElevatedButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });
  final String text;
  final void Function() onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ElevatedButton(
      // Configurações
      onPressed: onPressed,

      // Estilização
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Conteúdo
      child: AnimatedSwitcherComponent(
        child: enabled
            ? Text(
                text,
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              )
            : WaveLoaderComponent(color: theme.colorScheme.onSurface),
      ),
    );
  }
}
