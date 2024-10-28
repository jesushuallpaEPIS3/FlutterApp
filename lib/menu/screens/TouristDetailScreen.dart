import 'package:flutter/material.dart';
import '../models/tourist_spot.dart'; // Importa el modelo TouristSpot

class TouristDetailScreen extends StatelessWidget {
  final TouristSpot spot;

  const TouristDetailScreen({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spot.name),
        backgroundColor: Color(0xFF3D6B35), // Color de fondo del AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen grande en la parte superior
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
                      Icon(Icons.star, color: Colors.yellow[700], size: 24.0),
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
                  // Nuevos detalles: ubicación, teléfono y página web
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red[700]),
                      const SizedBox(width: 8.0),
                      Text(
                        spot.location,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.green[700]),
                      const SizedBox(width: 8.0),
                      Text(
                        spot.phoneNumber,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.web, color: Colors.blue[700]),
                      const SizedBox(width: 8.0),
                      Text(
                        spot.website,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
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
