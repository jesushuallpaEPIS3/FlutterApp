import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps - Marcadores Animados',
      home: MapWithPopup(),
    );
  }
}

class MapWithPopup extends StatefulWidget {
  @override
  _MapWithPopupState createState() => _MapWithPopupState();
}

class _MapWithPopupState extends State<MapWithPopup> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};

  // Lugares y datos
  final List<Map<String, dynamic>> _locations = [
    {
      'name': 'Universidad Privada de Tacna (FAING)',
      'latLng': LatLng(-18.00665770688474, -70.2271077561213),
      'address': 'Av. Pinto 123, Tacna',
      'logo':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Logo_UPT.png/800px-Logo_UPT.png',
    },
    {
      'name': 'Restaurant Doña Rina',
      'latLng': LatLng(-17.994067646913727, -70.21931819230848),
      'address': 'Av. Celestino Vargas 1250',
      'logo': 'https://i.ibb.co/wMwHzdH/thumbnail.jpg',
    },
    {
      'name': 'Parque Perú',
      'latLng': LatLng(-17.995851874501138, -70.21260625719489),
      'address': 'Cerca de Av. Augusto B. Leguía, Tacna',
      'logo': 'https://i.ibb.co/pL32nfF/2-CRATRHMA5-BLZCR2-JFDUYE2-APE.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    for (var location in _locations) {
      _markers.add(
        Marker(
          markerId: MarkerId(location['name']),
          position: location['latLng'],
          infoWindow: InfoWindow(
            title: location['name'],
            snippet: location['address'],
            onTap: () => _showPopup(
              location['name'],
              location['address'],
              location['logo'],
            ),
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
  }

  void _showPopup(String name, String address, String logoUrl) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 200,
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      logoUrl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          address,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Cerrar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa - Múltiples Marcadores'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _locations[0]['latLng'], // Posición inicial (UPT)
          zoom: 14,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
