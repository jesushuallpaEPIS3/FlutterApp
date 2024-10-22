import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FavoriteService {
  // Obtener el archivo donde se almacenan los favoritos
  Future<File> _getFavoriteFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/favorites.txt');
  }

  // Cargar los favoritos del archivo
  Future<List<String>> loadFavorites() async {
    try {
      final file = await _getFavoriteFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        return contents.split('\n').where((line) => line.isNotEmpty).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // Guardar los favoritos en el archivo
  Future<void> saveFavorites(List<String> favorites) async {
    final file = await _getFavoriteFile();
    await file.writeAsString(favorites.join('\n'));
  }

  // Agregar un lugar turístico a los favoritos
  Future<void> addFavorite(String touristSpotId) async {
    final favorites = await loadFavorites();
    if (!favorites.contains(touristSpotId)) {
      favorites.add(touristSpotId);
      await saveFavorites(favorites);
    }
  }

  // Eliminar un lugar turístico de los favoritos
  Future<void> removeFavorite(String touristSpotId) async {
    final favorites = await loadFavorites();
    if (favorites.contains(touristSpotId)) {
      favorites.remove(touristSpotId);
      await saveFavorites(favorites);
    }
  }

  // Verificar si un lugar está en favoritos
  Future<bool> isFavorite(String touristSpotId) async {
    final favorites = await loadFavorites();
    return favorites.contains(touristSpotId);
  }
}
