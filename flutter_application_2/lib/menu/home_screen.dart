import 'package:flutter/material.dart';
import 'tourist_spots_screen.dart'; // Importa la pantalla de puntos turísticos

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Image.network(
                  'https://via.placeholder.com/400x200', // Imagen de ejemplo
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  'BIENVENIDO A TARATA GO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                MenuOption(
                    title: 'Puntos Turísticos',
                    icon: Icons.place,
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TouristSpotsScreen()),
                      );
                    }),
                MenuOption(
                    title: 'Ruta Tarata',
                    icon: Icons.map,
                    color: Colors.orange),
                MenuOption(
                    title: 'Gastronomía',
                    icon: Icons.restaurant,
                    color: Colors.pink),
                MenuOption(
                    title: 'Estadía', icon: Icons.hotel, color: Colors.yellow),
                MenuOption(
                    title: 'Senderismo',
                    icon: Icons.directions_walk,
                    color: Colors.blue),
                MenuOption(
                    title: 'Relajamiento',
                    icon: Icons.spa,
                    color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  MenuOption(
      {required this.title,
      required this.icon,
      required this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap, // Asigna la función que se ejecutará cuando el usuario haga clic
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
