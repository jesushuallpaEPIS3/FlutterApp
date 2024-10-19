import 'package:flutter/material.dart';

class MapaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de la Ubicación'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Vuelve a la pantalla anterior
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Muestra una imagen como el ejemplo del mapa
            Image.network(
              'https://via.placeholder.com/300x400', // Imagen del mapa o ubicación
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volver a la pantalla anterior
              },
              child: Text('Salir'),
            ),
          ],
        ),
      ),
    );
  }
}
