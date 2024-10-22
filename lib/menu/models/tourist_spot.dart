// /lib/models/tourist_spot.dart
import 'dart:convert';

class TouristSpot {
  final String name;
  final String description;
  final String category;
  final String image;
  final String imageFondo;
  final double rating;

  TouristSpot({
    required this.name,
    required this.description,
    required this.category,
    required this.image,
    required this.imageFondo,
    required this.rating,
  });

  // Convertir un objeto TouristSpot a JSON
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'category': category,
        'image': image, // Usar 'image' en lugar de 'imageUrl'
        'imageFondo': imageFondo, // Asegurar que se incluya 'imageFondo'
        'rating': rating,
      };

  // Crear un objeto TouristSpot a partir de JSON
  factory TouristSpot.fromJson(Map<String, dynamic> json) {
    return TouristSpot(
      name: json['name'],
      description: json['description'],
      category: json['category'],
      image: json['image'], // Asignar correctamente 'image'
      imageFondo: json['imageFondo'], // Asignar correctamente 'imageFondo'
      rating: json['rating'],
    );
  }
}
