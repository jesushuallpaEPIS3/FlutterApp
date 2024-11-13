import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false; // Modo oscuro por defecto

  bool get isDarkMode => _isDarkMode;

  // Alternar entre modos claro y oscuro
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notifica a los oyentes que el tema ha cambiado
  }

  // Tema actual según el estado
  ThemeData get currentTheme {
    if (_isDarkMode) {
      // Modo oscuro
      return ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black, // Fondo negro en modo oscuro
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      );
    } else {
      // Modo claro
      return ThemeData.light().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white, // Fondo blanco en modo claro
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      );
    }
  }
}
