class WeatherData {
  final String name; // Ubicación
  final double currentTemperature; // Temperatura actual
  final List<WeatherInfo> weather; // Información del clima

  WeatherData({
    required this.name,
    required this.currentTemperature,
    required this.weather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'], // Nombre de la ubicación
      currentTemperature: (json['main']['temp'] - 273.15), // Convertir Kelvin a Celsius
      weather: List<WeatherInfo>.from(
        json['weather'].map(
          (weather) => WeatherInfo.fromJson(weather),
        ),
      ),
    );
  }
}

class WeatherInfo {
  final String main; // Descripción del clima

  WeatherInfo({
    required this.main,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      main: json['main'], // Descripción del clima
    );
  }
}
