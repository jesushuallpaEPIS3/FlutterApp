import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import 'menu/find_out_app.dart'; // Importa FindOutApp
import 'themeprovider.dart'; // Importa el ThemeProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Crea una instancia de ThemeProvider
      child: const FindOutApp(), // Ejecuta FindOutApp
    ),
  );
}
