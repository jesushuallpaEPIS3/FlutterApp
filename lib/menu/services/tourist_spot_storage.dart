// /lib/services/tourist_spot_storage.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/tourist_spot.dart'; // Asegúrate de que la clase TouristSpot esté importada

// Cargar la lista de puntos turísticos desde un archivo de assets
Future<List<TouristSpot>> loadTouristSpotsFromFile() async {
  // Cargar el archivo desde los assets
  String fileContent =
      await rootBundle.loadString('assets/data/puntos_turisticos.txt');

  // Decodificar el contenido del archivo (JSON)
  List<dynamic> jsonList = jsonDecode(fileContent);

  // Convertir la lista de mapas JSON a una lista de objetos TouristSpot
  List<TouristSpot> spots =
      jsonList.map((json) => TouristSpot.fromJson(json)).toList();

  return spots;
}
