// /lib/models/tourist_spot.dart
class TouristSpot {
  final String name;
  final String description;
  final String category;
  final String image;
  final String imageFondo;
  final double rating;
  final String location;
  final String phoneNumber;
  final String website;

  TouristSpot({
    required this.name,
    required this.description,
    required this.category,
    required this.image,
    required this.imageFondo,
    required this.rating,
    required this.location,
    required this.phoneNumber,
    required this.website,
  });

  // Convertir un objeto TouristSpot a JSON
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'category': category,
        'image': image,
        'imageFondo': imageFondo,
        'rating': rating,
        'location': location,
        'phoneNumber': phoneNumber,
        'website': website,
      };

  // Crear un objeto TouristSpot a partir de JSON
  factory TouristSpot.fromJson(Map<String, dynamic> json) {
    return TouristSpot(
      name: json['name'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      imageFondo: json['imageFondo'],
      rating: json['rating'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      website: json['website'],
    );
  }
}

// Lista de objetos TouristSpot con datos ya embebidos
final List<TouristSpot> touristSpots = [
  TouristSpot(
    name: "Plaza Coronel Gregorio Albarracín (Plaza Principal de Tarata)",
    description:
        "Centro de la ciudad, la plaza de Tarata está a 3070 msnm. Inaugurada en 1956...",
    category: "Ruta_Tarata",
    image:
        "assets/images/1 RUTA DE ACCESO A TARATA/20240420054308_IMG_6412 (1).jpg",
    imageFondo:
        "assets/images/1 RUTA DE ACCESO A TARATA/20240420054308_IMG_6412 (1).jpg",
    rating: 4.8,
    location: "Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 934",
    website: "https://plazatarata.com.pe",
  ),
  TouristSpot(
    name: "Mercado Central de Abastos Tarata",
    description:
        "El Mercado Central de Abastos de Tarata, ubicado en la calle 28 de Julio...",
    category: "Ruta_Tarata",
    image:
        "assets/images/1 RUTA DE ACCESO A TARATA/Captura de pantalla 2024-09-30 094247.png",
    imageFondo:
        "assets/images/1 RUTA DE ACCESO A TARATA/Captura de pantalla 2024-09-30 094247.png",
    rating: 4.5,
    location: "Calle 28 de Julio, Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 935",
    website: "https://mercadotarata.com.pe",
  ),
  TouristSpot(
    name: "Templo San Benedicto",
    description:
        "El templo San Benedicto, de origen colonial, es uno de los más antiguos de Tacna...",
    category: "Ruta_Tarata",
    image:
        "assets/images/1 RUTA DE ACCESO A TARATA/20240420055036_IMG_6421 (1).jpg",
    imageFondo:
        "assets/images/1 RUTA DE ACCESO A TARATA/20240420055036_IMG_6421 (1).jpg",
    rating: 4.9,
    location: "Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 936",
    website: "https://templosanbenedicto.com.pe",
  ),
  TouristSpot(
    name: "Municipalidad Provincial de Tarata",
    description:
        "La municipalidad provincial de Tarata, ubicada frente a la plaza principal...",
    category: "Ruta_Tarata",
    image:
        "assets/images/1 RUTA DE ACCESO A TARATA/WhatsApp Image 2024-09-30 at 15.09.40.jpeg",
    imageFondo:
        "assets/images/1 RUTA DE ACCESO A TARATA/WhatsApp Image 2024-09-30 at 15.09.40.jpeg",
    rating: 4.3,
    location: "Plaza Principal, Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 937",
    website: "https://municipalidadtarata.gob.pe",
  ),
  TouristSpot(
    name: "Camino Inca",
    description:
        "El Camino Inca es una ruta andina a 3200 msnm, que conecta Tarata con Ticaco...",
    category: "Senderismo",
    image: "assets/images/2 SENDERISMO/[000789] (2).jpg",
    imageFondo: "assets/images/2 SENDERISMO/[000789] (2).jpg",
    rating: 4.9,
    location: "Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 938",
    website: "https://caminoinca.com.pe",
  ),
  TouristSpot(
    name: "Cueva de Qala Qala",
    description:
        "La Cueva de Qala Qala es una estructura prehispánica ubicada a 3066 msnm...",
    category: "Senderismo",
    image: "assets/images/2 SENDERISMO/Cuevas de Quala Quala.png",
    imageFondo: "assets/images/2 SENDERISMO/Cuevas de Quala Quala.png",
    rating: 4.7,
    location: "Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 939",
    website: "https://cuevasqalqala.com.pe",
  ),
  TouristSpot(
    name: "Centro Arqueológico Santa María",
    description:
        "El Centro Arqueológico Santa María, a 3082 msnm, es un asentamiento inca...",
    category: "Senderismo",
    image: "assets/images/2 SENDERISMO/20240315105831_IMG_2472.jpg",
    imageFondo: "assets/images/2 SENDERISMO/20240315105831_IMG_2472.jpg",
    rating: 4.8,
    location: "Santa María, Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 940",
    website: "https://arqueologiasantamaria.com.pe",
  ),
  TouristSpot(
    name: "Baños Termales de Putina - Ticaco",
    description:
        "Baños termales ubicados a más de 3200 msnm, con pozas y una piscina de aguas termales...",
    category: "Relajamiento",
    image: "assets/images/3 RELAJAMIENTO/20240219162533_IMG_0855.jpg",
    imageFondo: "assets/images/3 RELAJAMIENTO/20240219162533_IMG_0855.jpg",
    rating: 4.8,
    location: "Ticaco, Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 941",
    website: "https://banosputina.com.pe",
  ),
  TouristSpot(
    name: "Taller de Cerámica",
    description:
        "El taller de cerámica de Ticaco, a 3277 msnm, ofrece actividades para locales...",
    category: "Relajamiento",
    image:
        "assets/images/3 RELAJAMIENTO/458972257_919413446892029_6951314521824928962_n.jpg",
    imageFondo:
        "assets/images/3 RELAJAMIENTO/458972257_919413446892029_6951314521824928962_n.jpg",
    rating: 4.6,
    location: "Ticaco, Tarata, Tacna, Perú",
    phoneNumber: "+51 952 603 942",
    website: "https://tallerdeceramicaticaco.com.pe",
  ),
];
