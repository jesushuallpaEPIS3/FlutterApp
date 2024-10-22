import 'package:flutter/material.dart';
import 'favorites_screen.dart'; // Importación de la pantalla de Favoritos.
import 'home_screen.dart'; // Importación de la pantalla Home.
import 'settings_screen.dart'; // Importa la pantalla de configuraciones

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(), // Pantalla principal con navegación
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // Establece Home como la pantalla inicial

  // Lista de pantallas para cada índice del BottomNavigationBar
  final List<Widget> _screens = [
    FavoritesScreen(), // Pantalla de Favoritos
    SettingsScreen(), // Pantalla de Configuración
    HomeScreen(), // Pantalla Principal
  ];

  // Función para actualizar la pantalla seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex, // Mantiene el índice actual
        onTap: _onItemTapped, // Cambia la pantalla al presionar un botón
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}