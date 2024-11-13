import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
          },
        ),
        title: const Text('Favoritos'),
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

          // Lista de favoritos
          Expanded(
            child: ListView(
              children: const [
                FavoriteCard(
                  imageUrl: 'assets/images/RutaTarata0.png', // Usando imagen desde assets
                  title: 'Camino Inca Tarata - Santa María',
                  description: 'A 15 km de Tarata, 15 min en auto, con recorrido libre.',
                  rating: 4.9,
                ),
                FavoriteCard(
                  imageUrl: 'assets/images/PuntosTuristicos0.png', // Usando imagen desde assets
                  title: 'Puntos Turístico',
                  description: 'Descripción del lugar.',
                  rating: 4.9,
                ),
                FavoriteCard(
                  imageUrl: 'assets/images/RutaTarata0.png', // Usando imagen desde assets
                  title: 'Senderismo',
                  description: 'Otra descripción.',
                  rating: 4.9,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double rating;

  const FavoriteCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          // Imagen de la tarjeta desde assets
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            ),
            child: Image.asset(
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
    );
  }
}
