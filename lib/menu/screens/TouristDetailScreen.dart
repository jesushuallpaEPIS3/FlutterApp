import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Asegúrate de que esta importación esté presente
import '../models/tourist_spot.dart'; // Importa el modelo TouristSpot
import 'package:url_launcher/url_launcher.dart'; // Importa para poder usar launchUrl

class TouristDetailScreen extends StatelessWidget {
  final TouristSpot spot;

  const TouristDetailScreen({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spot.name),
        backgroundColor: const Color(0xFF3D6B35),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              spot.imageFondo,
              height: 250.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    spot.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 24.0),
                      const SizedBox(width: 4.0),
                      Text(
                        spot.rating.toString(),
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    spot.description,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  // Ubicación
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red),
                      const SizedBox(width: 8.0),
                      Text(
                        spot.location,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Teléfono
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.green),
                      const SizedBox(width: 8.0),
                      Text(
                        spot.phoneNumber,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Página web
                  Row(
                    children: [
                      const Icon(Icons.web, color: Colors.blue),
                      const SizedBox(width: 8.0),
                      InkWell(
                        child: Text(
                          spot.website,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          launchUrl(Uri.parse(spot.website));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Botón para Google Maps
                  ElevatedButton(
                    onPressed: () {
                      launchUrl(Uri.parse(
                          'https://www.google.com/maps/search/?api=1&query=${spot.latitude},${spot.longitude}'));
                    },
                    child: const Text('Ver en Google Maps'),
                  ),
                  const SizedBox(height: 16.0),
                  // Contenedor del mapa
                  Container(
                    height: 300.0,
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(spot.latitude, spot.longitude),
                        initialZoom: 13.0,
                      ),
                      children: [
                        // Cambia 'layers' por 'children'
                        TileLayer(
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(spot.latitude, spot.longitude),
                              child: const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
