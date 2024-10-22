import 'package:flutter/material.dart';

class SobreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Text(
          'Famoso teatro renacentista de 1896, auge de la época del caucho en la ciudad, con capacidad para conciertos y recorridos.',
          style: TextStyle(fontSize: 16),
        ),
        Divider(),
        Text('Accesibilidad',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Icon(Icons.accessible, color: Colors.green),
            SizedBox(width: 8),
            Icon(Icons.wheelchair_pickup, color: Colors.blue),
            SizedBox(width: 8),
            Icon(Icons.elevator, color: Colors.blue),
          ],
        ),
        SizedBox(height: 16),
        Text('Comodidades',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Icon(Icons.check, color: Colors.green),
            SizedBox(width: 8),
            Text('Baño'),
            SizedBox(width: 16),
            Icon(Icons.check, color: Colors.green),
            SizedBox(width: 8),
            Text('Restaurante'),
          ],
        ),
      ],
    );
  }
}
