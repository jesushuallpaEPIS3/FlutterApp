import 'package:flutter/material.dart';
import '/menu/home.dart'; // Asegúrate de importar WeatherHome o MainScreen desde menu/main.dart
import 'screens/form_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          '/form_one', // Pantalla inicial, puedes cambiarla si lo deseas
      routes: {
        '/': (context) =>
            MainScreen(), // Ruta a la pantalla principal (MainScreen o WeatherHome)
        '/form_one': (context) => WeatherHome(), // Ruta para FormTwo
      },
    );
  }
}
