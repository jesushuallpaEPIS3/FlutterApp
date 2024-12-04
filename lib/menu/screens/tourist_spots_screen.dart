import 'package:flutter/material.dart';
import 'TouristDetailScreen.dart';
import '../models/tourist_spot.dart'; // Importa la lista touristSpots directamente.
import 'home.dart'; // Importa la pantalla Home.
import 'settings_screen.dart'; // Importa la pantalla de Configuración.

class TouristSpotsScreen extends StatefulWidget {
  final String category;

  const TouristSpotsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  _TouristSpotsScreenState createState() => _TouristSpotsScreenState();
}

class _TouristSpotsScreenState extends State<TouristSpotsScreen> {
  int _selectedIndex = 1; // Índice inicial para la pantalla Home.
  List<TouristSpot> filteredSpots = [];
  String searchText = "";

  @override
  void initState() {
    super.initState();
    _filterTouristSpots();
  }

  void _filterTouristSpots() {
    // Actualiza la lista de puntos turísticos según el texto ingresado y la categoría.
    setState(() {
      filteredSpots = touristSpots
          .where((spot) =>
              (widget.category == "Puntos_Turísticos" ||
                  spot.category == widget.category) &&
              spot.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void _onItemTapped(int index) {
    // Cambiar la pantalla seleccionada en el BottomNavigationBar.
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });

      // Navegar a la pantalla correspondiente.
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
          break;
      }
    }
  }

  String _getTitleByCategory() {
    // Determinar el título según la categoría seleccionada.
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D6B35), // Verde Andino.
        title: Text(_getTitleByCategory()),
      ),
      body: Column(
        children: [
          // Barra de búsqueda.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  searchText = text;
                  _filterTouristSpots();
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search),
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

          // Lista de puntos turísticos.
          Expanded(
            child: filteredSpots.isEmpty
                ? const Center(
                    child: Text(
                      'No hay puntos turísticos para la categoría seleccionada.',
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredSpots.length,
                    itemBuilder: (context, index) {
                      final spot = filteredSpots[index];
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

      // BottomNavigationBar.
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
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

class FeaturedTouristSpotCard extends StatelessWidget {
  final String imageUrl;
  final String imageFondo;
  final String title;
  final String description;
  final double rating;
  final VoidCallback onTap;

  const FeaturedTouristSpotCard({
    Key? key,
    required this.imageUrl,
    required this.imageFondo,
    required this.title,
    required this.description,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Imagen de fondo.
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              imageFondo,
              height: 200.0,
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ),

          // Imagen superpuesta.
          Positioned(
            left: 10.0,
            bottom: 20.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imageUrl,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Texto superpuesto.
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
