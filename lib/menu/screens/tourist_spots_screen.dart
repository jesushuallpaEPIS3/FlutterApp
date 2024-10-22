import 'package:flutter/material.dart';
import '../models/tourist_spot.dart'; // Importa la clase TouristSpot
import '../services/tourist_spot_storage.dart'; // Importa la función de carga
import '../favorites_screen.dart'; // Importa la pantalla de Favoritos.
import '../home.dart'; // Importa la pantalla Home.
import '../settings_screen.dart'; // Importa la pantalla de Configuración.

class TouristSpotsScreen extends StatefulWidget {
  @override
  _TouristSpotsScreenState createState() => _TouristSpotsScreenState();
}

class _TouristSpotsScreenState extends State<TouristSpotsScreen> {
  late Future<List<TouristSpot>> _touristSpotsFuture;
  int _selectedIndex =
      1; // Establece la pantalla de Puntos Turísticos como seleccionada

  @override
  void initState() {
    super.initState();
    _touristSpotsFuture =
        loadTouristSpotsFromFile(); // Cargar los datos del archivo
  }

  // Función para cambiar la pantalla seleccionada en el BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegación a las diferentes pantallas
    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => FavoritesScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
        break;
      case 3:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3D6B35), // Verde Andino
        title: const Text('Puntos Turísticos'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),

          // Lista de puntos turísticos
          Expanded(
            child: FutureBuilder<List<TouristSpot>>(
              future: _touristSpotsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error al cargar los datos'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text('No hay puntos turísticos disponibles'));
                } else {
                  // Mostrar la lista de puntos turísticos
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      TouristSpot spot = snapshot.data![index];

                      // Ahora todas las tarjetas tendrán un fondo similar
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: FeaturedTouristSpotCard(
                          imageUrl: spot.image,
                          imageFondo: spot.imageFondo, // Fondo para todas
                          title: spot.name,
                          description: spot.description,
                          rating: spot.rating,
                          onTap: () {
                            // Aquí puedes redirigir a una página de detalles
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      // Agregar el BottomNavigationBar
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

// Tarjeta destacada con fondo de imagen grande y superposición de contenido
class FeaturedTouristSpotCard extends StatelessWidget {
  final String imageUrl;
  final String imageFondo; // Imagen de fondo adicional
  final String title;
  final String description;
  final double rating;
  final VoidCallback onTap;

  const FeaturedTouristSpotCard({
    super.key,
    required this.imageUrl,
    required this.imageFondo, // Recibe la imagen de fondo
    required this.title,
    required this.description,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Imagen de fondo
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              imageFondo, // Mostrar imagen de fondo
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Imagen superpuesta en la parte inferior izquierda
          Positioned(
            left: 10.0,
            bottom: 20.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imageUrl, // Imagen principal superpuesta
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Texto y calificación superpuestos
          Positioned(
            left: 120.0,
            bottom: 20.0,
            right: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700], size: 18.0),
                      SizedBox(width: 4.0),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(Icons.favorite, color: Colors.red, size: 24.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
