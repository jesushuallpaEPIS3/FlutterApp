import 'package:flutter/material.dart';
import '../services/favorite_service.dart'; // Importa el servicio de favoritos
import '../models/tourist_spot.dart';
import '../services/tourist_spot_storage.dart'; // Importa la función de carga

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoriteService _favoriteService = FavoriteService();
  late Future<List<TouristSpot>> _touristSpotsFuture;

  @override
  void initState() {
    super.initState();
    _touristSpotsFuture =
        loadTouristSpotsFromFile(); // Cargar los puntos turísticos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
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
            return FutureBuilder<List<String>>(
              future: _favoriteService.loadFavorites(),
              builder: (context, favoriteSnapshot) {
                if (!favoriteSnapshot.hasData ||
                    favoriteSnapshot.data!.isEmpty) {
                  return Center(child: Text('No tienes favoritos aún.'));
                }

                final favoriteNames = favoriteSnapshot.data!;
                final favoriteSpots = snapshot.data!
                    .where((spot) => favoriteNames.contains(spot.name))
                    .toList();

                return ListView.builder(
                  itemCount: favoriteSpots.length,
                  itemBuilder: (context, index) {
                    final spot = favoriteSpots[index];
                    return ListTile(
                      leading: Image.asset(spot.image,
                          fit: BoxFit.cover, width: 100, height: 100),
                      title: Text(spot.name),
                      subtitle: Text(spot.description),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () async {
                          await _favoriteService.removeFavorite(spot.name);
                          setState(() {}); // Refresca la lista de favoritos
                        },
                      ),
                    );
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
