import 'package:flutter/material.dart';
import 'masinfo.dart'; // Importa la pantalla de detalles de puntos turísticos

class TouristSpotsScreen extends StatelessWidget {
  const TouristSpotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Vuelve a la pantalla anterior
          },
        ),
        title: const Text('Puntos Turísticos'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            child: ListView(
              children: [
                TouristSpotCard(
                  imageUrl:
                      'https://example.com/image1.jpg', // Reemplaza con la URL de la imagen
                  title: 'Camino Inca Tarata - Santa María',
                  description:
                      'A 15 km de Tarata, 15 min en auto, con recorrido libre.',
                  rating: 4.9,
                  onTap: () {
                    // Redirige a la pantalla de información detallada
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetallesScreen(),
                        settings: RouteSettings(
                          arguments:
                              'Camino Inca Tarata - Santa María', // El título o datos que deseas pasar
                        ),
                      ),
                    );
                  },
                ),
                TouristSpotCard(
                  imageUrl: 'https://example.com/image2.jpg',
                  title: 'Nombre del local',
                  description: 'Localización del local.',
                  rating: 4.9,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetallesScreen(),
                        settings: RouteSettings(
                          arguments:
                              'Camino Inca Tarata - Santa María', // El título o datos que deseas pasar
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
    required this.onTap, // Añade el callback para la navegación
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Llama al callback cuando se hace clic en la tarjeta
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            // Imagen de la tarjeta
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
            // Botón de favorito
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
