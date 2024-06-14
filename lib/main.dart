import 'package:fipe_consultation/src/app.dart';
import 'package:fipe_consultation/src/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carrega a preferência do tema
  final themeController = ThemeController();
  await themeController.loadTheme();

  runApp(App(themeController: themeController));
}
