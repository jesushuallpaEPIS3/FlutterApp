import 'package:flutter/material.dart';
import 'tourist_spots_screen.dart'; // Importa la pantalla de puntos turísticos

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
          //Container(
          //  color: Colors.green,
          //  padding: EdgeInsets.all(8),
          //  child: Column(
          //    children: [
          //      Image.asset(
          //        'assets/images/home_image.png', // Imagen local de ejemplo
          //        height: 150,
          //        fit: BoxFit.cover,
          //      ),
          //      SizedBox(height: 10),
          //      Text(
          //        'BIENVENIDO A TARATA GO',
          //        style: TextStyle(
          //          color: Colors.white,
          //          fontSize: 18,
          //          fontWeight: FontWeight.bold,
          //        ),
          //      ),
          //    ],
          //  ),
          //),
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
                          builder: (context) => TouristSpotsScreen()),
                    );
                  },
                ),
                MenuOption(
                  title: 'Ruta Tarata',
                  imagePath: 'assets/images/RutaTarata0.png', // Imagen local
                  gradientColors: [Colors.orange, Colors.deepOrange],
                ),
                //MenuOption(
                //  title: 'Gastronomía',
                //  imagePath: 'assets/images/food.png', // Imagen local
                //  gradientColors: [Colors.pink, Colors.deepPurple],
                //),
                //MenuOption(
                //  title: 'Estadía',
                //  imagePath: 'assets/images/hotel.png', // Imagen local
                //  gradientColors: [Colors.yellow, Colors.amber],
                //),
                MenuOption(
                  title: 'Senderismo',
                  imagePath: 'assets/images/Senderismo0.png', // Imagen local
                  gradientColors: [Colors.blue, Colors.lightBlueAccent],
                ),
                MenuOption(
                  title: 'Relajamiento',
                  imagePath: 'assets/images/Relajamiento0.png', // Imagen local
                  gradientColors: [Colors.green, Colors.teal],
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
  final String imagePath; // Nueva propiedad para la ruta de la imagen local
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
            // Imagen ocupando todo el contenedor con degradado
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover, // La imagen cubre todo el espacio
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
                  color: Colors.white, // Texto en blanco
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
