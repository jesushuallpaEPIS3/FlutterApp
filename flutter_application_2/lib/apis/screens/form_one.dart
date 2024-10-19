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
            FormTwo(), // Cambiar por la nueva pantalla
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 184, 97),
      body: Padding(
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
            // Mostrar el mensaje de cuenta regresiva
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Ya estamos listos para entrar a la aventura en $countdown segundos',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.name,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${weather.currentTemperature.toStringAsFixed(2)}°C",
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (weather.weather.isNotEmpty)
          Text(
            weather.weather[0].main,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 30),
        Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formattedTime,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/clima.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
