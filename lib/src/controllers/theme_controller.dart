import 'package:fipe_consultation/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

class ThemeController = ThemeControllerBase with _$ThemeController;

abstract class ThemeControllerBase with Store {
  static const String isDarkThemeKey = 'isDarkTheme';

  _ThemeController() {
    loadTheme();
  }

  @observable
  bool isDarkTheme = false;

  @action
  Future<void> toggleTheme() async {
    isDarkTheme = !isDarkTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkThemeKey, isDarkTheme);
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkTheme = prefs.getBool(isDarkThemeKey) ?? false;
  }

  ThemeData get themeData {
    return isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}