class WeatherEntity {
  final String cityName;
  final String description;
  final double temperature;

  WeatherEntity({
    required this.cityName,
    required this.description,
    required this.temperature,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    // Chuyển từ Kelvin sang Celsius
    double kelvinTemperature = json['main']['temp'];
    double temperatureInCelsius = kelvinTemperature - 273.15;

    return WeatherEntity(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temperature: temperatureInCelsius, // Trả về nhiệt độ tính theo Celsius
    );
  }
}
