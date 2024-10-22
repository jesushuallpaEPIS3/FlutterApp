// /lib/screens/tourist_spots_screen.dart
import 'package:flutter/material.dart';
import '../models/tourist_spot.dart'; // Importa la clase TouristSpot
import '../services/tourist_spot_storage.dart'; // Importa la función de carga

class TouristSpotsScreen extends StatefulWidget {
  @override
  _TouristSpotsScreenState createState() => _TouristSpotsScreenState();
}

class _TouristSpotsScreenState extends State<TouristSpotsScreen> {
  late Future<List<TouristSpot>> _touristSpotsFuture;

  @override
  void initState() {
    super.initState();
    _touristSpotsFuture =
        loadTouristSpotsFromFile(); // Cargar los datos del archivo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Puntos Turísticos'),
      ),
      body: FutureBuilder<List<TouristSpot>>(
        future: _touristSpotsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay puntos turísticos disponibles'));
          } else {
            // Mostrar la lista de puntos turísticos
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                TouristSpot spot = snapshot.data![index];
                return TouristSpotCard(
                  imageUrl: spot.imageUrl,
                  title: spot.name,
                  description: spot.description,
                  rating: spot.rating,
                  onTap: () {
                    // Aquí puedes redirigir a una página de detalles
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// El código de TouristSpotCard sigue igual como antes
class TouristSpotCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double rating;
  final VoidCallback onTap;

  const TouristSpotCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              child: Image.network(
                imageUrl,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700], size: 16.0),
                        Text(
                          rating.toString(),
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                // Acción para marcar o desmarcar favorito
              },
            ),
          ],
        ),
      ),
    );
  }
}
