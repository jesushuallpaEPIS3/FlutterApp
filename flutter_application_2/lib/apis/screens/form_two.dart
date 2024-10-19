import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class FormTwo extends StatefulWidget {
  @override
  _FormTwoState createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  String _deviceId = '';

  @override
  void initState() {
    super.initState();
    _getDeviceInfo(); // Load device information
    _getDeviceId(); // Fetch and display the device ID
  }

  Future<void> _getDeviceInfo() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        // Handle iOS data if needed
        deviceData = _readIOSDeviceData(await deviceInfoPlugin.iosInfo);
      }
    } catch (e) {
      deviceData = <String, dynamic>{
        'Error': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Future<void> _getDeviceId() async {
    String deviceId;
    try {
      deviceId = await getDeviceId();
    } catch (e) {
      deviceId = 'Error retrieving device ID';
    }

    setState(() {
      _deviceId = deviceId; // Store the fetched device ID in the state
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.release': build.version.release,
      'brand': build.brand,
      'model': build.model,
      'hardware': build.hardware,
      'id': build.id, // Esta es la propiedad correcta, no androidId
    };
  }

  Map<String, dynamic> _readIOSDeviceData(IosDeviceInfo build) {
    return <String, dynamic>{
      'name': build.name,
      'systemName': build.systemName,
      'systemVersion': build.systemVersion,
      'model': build.model,
      'identifierForVendor': build.identifierForVendor,
    };
  }

  Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    late String deviceId;

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor ?? 'Unknown iOS ID';
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id ?? 'Unknown Android ID';
    } else {
      deviceId = 'Unsupported platform';
    }
    return deviceId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info and ID'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                // Displaying the device ID
                ListTile(
                  title: const Text('Device ID:'),
                  subtitle: Text(_deviceId),
                ),
                const Divider(),
                // Displaying device information
                ..._deviceData.keys.map((String property) {
                  return ListTile(
                    title: Text(property),
                    subtitle: Text('${_deviceData[property]}'),
                  );
                }).toList(),
              ],
            ),
          ),
          // Adding the button at the bottom of the screen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla principal usando la ruta '/'
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Continuar'),
            ),
          ),
        ],
      ),
    );
  }
}
