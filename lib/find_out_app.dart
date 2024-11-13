// lib/menu/find_out_app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import '/themeprovider.dart'; // Importa el ThemeProvider
import 'package:flutter_application_2/menu/settings_screen.dart'; // Importa la pantalla de configuración o la principal

class FindOutApp extends StatelessWidget {
  const FindOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos Consumer para escuchar los cambios en el tema
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Mi Aplicación',
          theme: themeProvider.currentTheme, // Cambia el tema según el estado
          home: const SettingsScreen(), // Pantalla inicial
        );
      },
    );
  }
}