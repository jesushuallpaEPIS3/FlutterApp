import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Acción para volver a la pantalla anterior
          },
        ),
        title: const Text('Configuraciones'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección del perfil
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.account_circle, size: 48.0),
                SizedBox(width: 16.0),
                Text(
                  'Felipe Amorin',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          const Divider(),

          // Opciones del menú
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Modo Oscuro'),
            onTap: () {
              // Acción para Modo Oscuro
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Lenguaje'),
            onTap: () {
              // Acción para Lenguaje
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {
              // Acción para Feedback
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Ayuda?'),
            onTap: () {
              // Acción para Ayuda
            },
          ),
          const Spacer(),

          // Opción de salir
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Acción para salir
              },
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Salir'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
