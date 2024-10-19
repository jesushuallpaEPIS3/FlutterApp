import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';
import 'package:flutter/foundation.dart'; // Importa para usar debugPrint

class WeatherServices {
  Future<WeatherData?> fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=-18.0146500&lon=-70.2536200&appid=9f6b05637c7338ea7222984f5bcaf184"),
    );

    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      debugPrint(e.toString()); // Cambiado a debugPrint
      return null; // Retorna null en caso de error
    }
  }
}
