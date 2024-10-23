import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/weather_model.dart';
import '../services/weather_service.dart';
import 'form_two.dart';
import 'dart:async'; // Importa la librería para usar Timer

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  WeatherData? weatherInfo;
  bool isLoading = false;
  int countdown = 5; // Inicializa el contador en 5 segundos
  Timer? timer; // Variable para el Timer

  void myWeather() {
    setState(() {
      isLoading = true;
    });
    WeatherServices().fetchWeather().then((value) {
      setState(() {
        weatherInfo = value;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al cargar el clima: $error'),
        ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    myWeather();
    startCountdown(); // Iniciar el contador al cargar la pantalla
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
        navigateToAnotherForm(); // Navegar a FormTwo cuando el contador llegue a 0
      }
    });
  }

  void navigateToAnotherForm() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FormTwo(), // Cambiar por la nueva pantalla
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;

          final tween = Tween<double>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));
          final opacityAnimation = animation.drive(tween);

          return FadeTransition(
            opacity: opacityAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancelar el Timer cuando el widget se elimine
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE d, MMMM yyyy').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

    String backgroundImage;

    if (weatherInfo?.weather.isNotEmpty ?? false) {
      // Cambia la imagen según el clima
      switch (weatherInfo!.weather[0].main.toLowerCase()) {
        case 'clear':
          backgroundImage = 'assets/images/clear.jpg';
          break;
        case 'clouds':
          backgroundImage = 'assets/images/cloudy.jpg';
          break;
        case 'rain':
          backgroundImage = 'assets/images/rain.jpg';
          break;
        default:
          backgroundImage = 'assets/images/default.jpg'; // Imagen por defecto
      }
    } else {
      backgroundImage = 'assets/images/default.jpg'; // Imagen por defecto
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : weatherInfo != null
                        ? WeatherDetail(
                            weather: weatherInfo!,
                            formattedDate: formattedDate,
                            formattedTime: formattedTime,
                          )
                        : const Text(
                            'Error al cargar el clima',
                            style: TextStyle(color: Colors.white),
                          ),
              ),
              const SizedBox(height: 20),
              // Mostrar el mensaje de cuenta regresiva en el pie de la pantalla
              Align(
                alignment: Alignment.bottomCenter, // Ubica el texto en el pie
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 20), // Margen inferior
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Ya estamos listos para empezar la aventura en $countdown tarata',
                    style: const TextStyle(
                      fontSize: 14, // Tamaño de fuente más pequeño
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  final WeatherData weather;
  final String formattedDate;
  final String formattedTime;

  const WeatherDetail({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.formattedTime,
  });

  // Función que retorna la recomendación según el clima
  String getRecommendation(String weatherCondition) {
    switch (weatherCondition.toLowerCase()) {
      case 'clear':
        return '¡Está despejado, es un buen día para salir! No olvides disfrutarlo.';
      case 'clouds':
        return 'Hay nubes, es posible que llueva, así que mejor toma precauciones.';
      case 'rain':
        return 'Está lloviendo. Lleva un paraguas y evita mojarte.';
      default:
        return 'No estoy seguro del clima, así que mantente alerta y toma precauciones.';
    }
  }

  @override
  Widget build(BuildContext context) {
    String recommendation = weather.weather.isNotEmpty
        ? getRecommendation(weather.weather[0].main)
        : '';

    return Card(
      elevation: 5, // Sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              weather.name,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black, // Cambia el color según el fondo
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${weather.currentTemperature.toStringAsFixed(2)}°C",
              style: const TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (weather.weather.isNotEmpty)
              Text(
                weather.weather[0].main,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            Text(
              formattedDate,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              formattedTime,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Añadir la recomendación en aimara
            Text(
              recommendation,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
