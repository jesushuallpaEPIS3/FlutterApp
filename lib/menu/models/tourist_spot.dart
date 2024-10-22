// /lib/models/tourist_spot.dart
import 'dart:convert';

class TouristSpot {
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final double rating;

  TouristSpot({
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  // Convertir un objeto TouristSpot a JSON
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'category': category,
        'imageUrl': imageUrl,
        'rating': rating,
      };

  // Crear un objeto TouristSpot a partir de JSON
  factory TouristSpot.fromJson(Map<String, dynamic> json) {
    return TouristSpot(
      name: json['name'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
    );
  }
}
