import 'package:flutter/material.dart';
import 'mapa_screen.dart'; // Importa la pantalla del mapa

class VistaGeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Image.network(
          'https://via.placeholder.com/400x200', // Imagen del lugar
          height: 200,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          'Teatro Camino Inca Tarata - Santa María',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, color: Colors.yellow),
            Text('4.9', style: TextStyle(fontSize: 16)),
            SizedBox(width: 4),
            Text('(29,127)', style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Famoso teatro renacentista de 1896, en el auge de la época del caucho en la ciudad, con capacidad para conciertos y recorridos.',
          style: TextStyle(fontSize: 16),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.location_on),
          title: GestureDetector(
            onTap: () {
              // Navega a la pantalla del mapa cuando se toca la dirección
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapaScreen()),
              );
            },
            child: Text(
              'Largo de São Sebastião - Centro, Manaus - AM, 69067-080',
              style: TextStyle(
                color: Colors.blue, // Color del texto como un enlace
                decoration:
                    TextDecoration.underline, // Subrayado para parecer enlace
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.link),
          title: Text('https://teatroamazonas.com.br/'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('(92) 3622-1880'),
        ),
      ],
    );
  }
}
