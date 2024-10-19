import 'package:flutter/material.dart';
import 'vista_general_screen.dart'; // Pantalla de Vista General
import 'mapa_screen.dart'; // Pantalla del Mapa
import 'evaluaciones_screen.dart'; // Importa la pantalla de Evaluaciones
import 'sobre_screen.dart'; // Importa la pantalla de Sobre

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetallesScreen(),
    );
  }
}

class DetallesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vista General'),
          backgroundColor: Colors.green,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Vista General'),
              Tab(text: 'Evaluaciones'),
              Tab(text: 'Sobre'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            VistaGeneralScreen(), // Llama a la pantalla Vista General
            EvaluacionesScreen(), // Llama a la pantalla Evaluaciones
            SobreScreen(), // Placeholder para Sobre
          ],
        ),
      ),
    );
  }
}
