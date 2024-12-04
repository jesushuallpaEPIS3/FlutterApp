import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa provider
import '/themeprovider.dart'; // Importa el ThemeProvider

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

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
                  'usuario',
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
            trailing: Switch(
              value: themeProvider
                  .isDarkMode, // El valor del switch depende del tema
              onChanged: (value) {
                themeProvider.toggleTheme(); // Cambia el estado del tema
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Lenguaje'),
            onTap: () {
              // Acción para Lenguaje
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
