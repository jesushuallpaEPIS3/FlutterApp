import 'package:flutter/material.dart';
import 'screens/tourist_spots_screen.dart'; // Importa la pantalla de puntos turísticos

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                MenuOption(
                  title: 'Puntos Turísticos',
                  imagePath:
                      'assets/images/PuntosTuristicos0.png', // Imagen local
                  gradientColors: [Colors.orange, Colors.deepOrange],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Puntos_Turísticos', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
                MenuOption(
                  title: 'Ruta Tarata',
                  imagePath: 'assets/images/RutaTarata0.png', // Imagen local
                  gradientColors: [Colors.orange, Colors.deepOrange],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Ruta_Tarata', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
                MenuOption(
                  title: 'Senderismo',
                  imagePath: 'assets/images/Senderismo0.png', // Imagen local
                  gradientColors: [Colors.blue, Colors.lightBlueAccent],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Senderismo', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
                MenuOption(
                  title: 'Relajamiento',
                  imagePath: 'assets/images/Relajamiento0.png', // Imagen local
                  gradientColors: [Colors.green, Colors.teal],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Relajamiento', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
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
  final String imagePath;
  final List<Color> gradientColors;
  final VoidCallback? onTap;

  MenuOption({
    required this.title,
    required this.imagePath,
    required this.gradientColors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
