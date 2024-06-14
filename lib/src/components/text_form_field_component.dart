import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.borderSide,
    this.borderRadius,
    this.validator,
    this.floatingLabelBehavior,
    this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final IconData? prefixIcon;
  final List<Widget>? suffixIcon;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final void Function(String)? onChanged;

  

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    // Padrão de estilo de borda
    final defaultInputBorder = OutlineInputBorder(
      borderRadius: borderRadius ??
          const BorderRadius.all(
            Radius.circular(8.0),
          ),
      borderSide: borderSide ??
          BorderSide(
            width: 1.0,
            color: currentTheme.colorScheme.onPrimary,
          ),
    );

    // Padrão de estilo de texto
    final textStyle = currentTheme.textTheme.labelMedium!.copyWith(
      color:  currentTheme.colorScheme.onPrimary,
      fontWeight:   FontWeight.w500,
    );

    return TextFormField(
      // Configurações
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      enabled: enabled,
      validator: validator,
      minLines: 1,
      maxLines: obscureText ? 1 : 3,

      // Estilização
      cursorColor:  currentTheme.colorScheme.onPrimary,
      style: textStyle,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: textStyle.copyWith(fontWeight: FontWeight.w300),
        labelStyle: textStyle,
        floatingLabelBehavior: floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        // fillColor: currentTheme.colorScheme.secondary,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color:  currentTheme.colorScheme.onPrimary,
                size:   24.0,
              )
            : null,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: suffixIcon ?? [],
        ),
        contentPadding: const EdgeInsets.all(16.0),
        enabledBorder: defaultInputBorder,
        disabledBorder: defaultInputBorder,
        focusedBorder: defaultInputBorder.copyWith(
          borderSide: borderSide ??
              BorderSide(
                color: currentTheme.colorScheme.surface,
                width: 2.0,
              ),
        ),
        errorStyle: textStyle.copyWith(
          color: currentTheme.colorScheme.error,
          fontSize: 12.0,
        ),
        focusedErrorBorder: defaultInputBorder.copyWith(
          borderSide: borderSide ??
              BorderSide(
                color: currentTheme.colorScheme.error,
                width: 2.0,
              ),
        ),
        errorBorder: defaultInputBorder.copyWith(
          borderSide: borderSide ??
              BorderSide(
                color: currentTheme.colorScheme.error,
              ),
        ),
      ),
    );
  }
}