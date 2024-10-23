import 'dart:async'; // Importa la librería para el Timer
import 'package:flutter/material.dart';

class FormTwo extends StatefulWidget {
  const FormTwo({super.key});

  @override
  State<FormTwo> createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  // Lista de mensajes en diferentes idiomas
  final List<String> messages = [
    'Bienvenido a Tarata Go ',  // Español
    'Welcome to Tarata Go',  // Inglés
    'Aka Tarata Go jiwasa kipkaña sartasa',       // Aimara
  ];

  final List<String> buttonMessages = [
    '¿estas listo?',  // Español
    '¿Are you ready?',      // Inglés
    '¿Jumataki sartañataki?',         // Aimara
  ];

  int currentMessageIndex = 0;  // Índice del mensaje actual
  Timer? messageTimer;          // Timer para el cambio de mensajes

  @override
  void initState() {
    super.initState();
    // Iniciar el temporizador para cambiar el mensaje cada 3 segundos
    messageTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        currentMessageIndex = (currentMessageIndex + 1) % messages.length;
      });
    });
  }

  @override
  void dispose() {
    messageTimer?.cancel();  // Cancelar el temporizador al salir de la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo de imagen
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/PT22.png'), // Imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Texto de bienvenida que cambia de idioma, estilo encabezado
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  messages[currentMessageIndex],
                  style: const TextStyle(
                    fontSize: 40,  // Tamaño grande para estilo encabezado
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              // Texto "Listo para empezar" o similar debajo del encabezado
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  buttonMessages[currentMessageIndex],
                  style: const TextStyle(
                    fontSize: 24,  // Tamaño más pequeño debajo del encabezado
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              // Botón que navega a la pantalla principal
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar a la pantalla principal usando la ruta '/'
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),  // Tamaño del botón
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Botón redondeado
                    ),
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 22, color: Colors.white),
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
