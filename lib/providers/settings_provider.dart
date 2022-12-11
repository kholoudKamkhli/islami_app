import 'dart:ffi';

import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang = 'en';
  void changeTheme(ThemeMode newMode){
    currentTheme = newMode;
    notifyListeners();
  }
  bool isDarkMode(){
    return currentTheme == ThemeMode.dark;
  }
  void changeLocale(String newLocale){
    currentLang = newLocale;
    notifyListeners();
  }
  bool isArabic(){
    return currentLang=='ar';
  }
}