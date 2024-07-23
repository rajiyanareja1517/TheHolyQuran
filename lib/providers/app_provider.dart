import 'package:flutter/material.dart';


final themeMap = {
  "dark": ThemeMode.dark,
  "light": ThemeMode.light,
};

class AppProvider extends ChangeNotifier {

  int _first = 0;

  int get checkVisit => _first;



  void visited() {
    _first = 1;

    notifyListeners();
  }

  ThemeMode? _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode!;
  bool get isDark => _themeMode == ThemeMode.dark;



}
