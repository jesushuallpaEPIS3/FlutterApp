import 'package:flutter/material.dart';
import 'package:flutter_application_2/menu/screens/TouristDetailScreen.dart';
import '../models/tourist_spot.dart'; // Importa la lista touristSpots directamente
import '../favorites_screen.dart'; // Importa la pantalla de Favoritos.
import '../home.dart'; // Importa la pantalla Home.
import '../settings_screen.dart'; // Importa la pantalla de Configuración.

class TouristSpotsScreen extends StatefulWidget {
  final String category; // Recibe la categoría

  TouristSpotsScreen({required this.category});

  @override
  _TouristSpotsScreenState createState() => _TouristSpotsScreenState();
}

class _TouristSpotsScreenState extends State<TouristSpotsScreen> {
  int _selectedIndex = 2; // Establece Home como la pantalla inicial

  // Función para cambiar la pantalla seleccionada en el BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegación a las diferentes pantallas
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FavoritesScreen()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
        break;
    }
  }

  // Función para obtener el título de la pantalla según la categoría
  String _getTitleByCategory() {
    switch (widget.category) {
      case 'Ruta_Tarata':
        return 'Ruta Tarata';
      case 'Senderismo':
        return 'Senderismo';
      case 'Relajamiento':
        return 'Relajamiento';
      case 'Puntos_Turísticos':
        return 'Todos los Puntos Turísticos';
      default:
        return 'Puntos Turísticos';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar los puntos turísticos por la categoría seleccionada
    List<TouristSpot> filteredSpots;
    if (widget.category == "Puntos_Turísticos") {
      filteredSpots = touristSpots; // Mostrar todos los puntos
    } else {
      filteredSpots = touristSpots
          .where((spot) => spot.category == widget.category)
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3D6B35), // Verde Andino
        title: Text(_getTitleByCategory()), // Título dinámico
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  // Filtra los puntos turísticos según el texto ingresado
                  filteredSpots = touristSpots
                      .where((spot) =>
                          spot.name.toLowerCase().contains(text.toLowerCase()))
                      .toList();
                });
              },
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
            child: filteredSpots.isEmpty
                ? Center(
                    child: Text(
                        'No hay puntos turísticos para la categoría seleccionada.'))
                : ListView.builder(
                    itemCount: filteredSpots.length,
                    itemBuilder: (context, index) {
                      TouristSpot spot = filteredSpots[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: FeaturedTouristSpotCard(
                          imageUrl: spot.image,
                          imageFondo: spot.imageFondo,
                          title: spot.name,
                          description: spot.description,
                          rating: spot.rating,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TouristDetailScreen(spot: spot),
                              ),
                            );
                          },
                        ),
                      );
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
  final String imageFondo;
  final String title;
  final String description;
  final double rating;
  final VoidCallback onTap;

  const FeaturedTouristSpotCard({
    super.key,
    required this.imageUrl,
    required this.imageFondo,
    required this.title,
    required this.description,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width; // Ancho de la pantalla

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Imagen de fondo
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              imageFondo,
              height: 200.0,
              width: screenWidth, // Usa el ancho de la pantalla
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
                imageUrl,
                height: 100.0,
                width: 100.0, // Ajusta según el tamaño que prefieras
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
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
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
