import 'package:flutter/material.dart';
import 'tourist_spots_screen.dart';
import 'package:flutter_application_2/apis/services/weather_service.dart'; // Servicio de clima
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final WeatherServices weatherService = WeatherServices();

  // Método para obtener el clima
  Future<Map<String, String>> fetchWeather() async {
    final weatherData = await weatherService.fetchWeather();

    // Si weatherData es null, devuelve un valor por defecto
    if (weatherData == null) {
      return {'temperature': 'N/A', 'condition': 'Desconocido'};
    }

    // Accede a los valores de la clase WeatherData
    String temperature = weatherData.currentTemperature
        .toStringAsFixed(1); // Redondeo a 1 decimal
    String condition = weatherData.weather.isNotEmpty
        ? weatherData.weather[0].main
        : 'Desconocido';

    return {'temperature': temperature, 'condition': condition};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          FutureBuilder<Map<String, String>>(
            future: fetchWeather(), // Llama a la función para obtener los datos
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Estado de carga
              } else if (snapshot.hasData) {
                // Si tiene datos
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Clima: ${snapshot.data!['condition']} - ${snapshot.data!['temperature']}°C",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Consejo: Disfruta del clima mientras exploras!",
                        style: TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                // Si hay un error
                return Text("Error al cargar el clima: ${snapshot.error}");
              } else {
                // Si no tiene datos
                return Text("Error al cargar el clima");
              }
            },
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                MenuOption(
                  title: 'Puntos Turísticos',
                  imagePath: 'assets/images/PuntosTuristicos0.png',
                  gradientColors: [Colors.orange, Colors.deepOrange],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Puntos_Turísticos', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
                MenuOption(
                  title: 'Ruta Tarata',
                  imagePath: 'assets/images/RutaTarata0.png', // Imagen local
                  gradientColors: [Colors.orange, Colors.deepOrange],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Ruta_Tarata', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
                MenuOption(
                  title: 'Senderismo',
                  imagePath: 'assets/images/Senderismo0.png', // Imagen local
                  gradientColors: [Colors.blue, Colors.lightBlueAccent],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Senderismo', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
                MenuOption(
                  title: 'Relajamiento',
                  imagePath: 'assets/images/Relajamiento0.png', // Imagen local
                  gradientColors: [Colors.green, Colors.teal],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristSpotsScreen(
                          category: 'Relajamiento', // Pasar la categoría
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<Color> gradientColors;
  final VoidCallback? onTap;

  MenuOption({
    required this.title,
    required this.imagePath,
    required this.gradientColors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
