import 'package:flutter/material.dart';

class EvaluacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    for (int i = 5; i >= 1; i--)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Row(
                          children: [
                            Text('$i'),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Expanded(
                              child: LinearProgressIndicator(
                                value: i == 5 ? 0.8 : (i == 4 ? 0.15 : 0.05),
                                backgroundColor: Colors.grey[300],
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    '4.9',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star_half, color: Colors.yellow, size: 24),
                    ],
                  ),
                  Text('29,127 comentarios'),
                ],
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/50'),
            ),
            title: Text('Zé Carlos Maia'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10 Meses atrás'),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star_half, color: Colors.yellow, size: 16),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Hice el recorrido oficial. Se paga algo por ello, pero vale la pena...',
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.network('https://via.placeholder.com/100x100',
                          width: 100),
                      SizedBox(width: 8),
                      Image.network('https://via.placeholder.com/100x100',
                          width: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
