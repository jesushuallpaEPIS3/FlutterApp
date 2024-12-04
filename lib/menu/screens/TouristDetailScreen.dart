import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir URLs

import '../models/tourist_spot.dart'; // Modelo TouristSpot

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
                    children: [],
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
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Abrir Google Maps con las coordenadas
                      final url =
                          'https://www.google.com/maps/dir/?api=1&destination=${spot.latitude},${spot.longitude}';
                      launchUrl(Uri.parse(url));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('Ver Ruta en Google Maps'),
                  ),
                  const SizedBox(height: 16.0),
                  // Contenedor del mapa
                  Container(
                    height: 300.0,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(spot.latitude, spot.longitude),
                        zoom: 14,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId(spot.name),
                          position: LatLng(spot.latitude, spot.longitude),
                          infoWindow: InfoWindow(
                            title: spot.name,
                            snippet: spot.location,
                          ),
                        ),
                      },
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
