import 'package:fipe_consultation/src/controllers/theme_controller.dart';
import 'package:fipe_consultation/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final ThemeController themeController;

  const App({super.key, required this.themeController});

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Provider<ThemeController>(
      create: (_) => themeController,
      child: Consumer<ThemeController>(
        builder: (context, _, child) {
          return Observer(
            builder: (_) => MaterialApp(
              title: 'Consulta de CNPJ',
              theme: themeController.themeData,
              navigatorKey: navigatorKey,
              scaffoldMessengerKey: scaffoldMessengerKey,
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
