// lib/features/weather/data/models/weather_model.dart

import 'package:weather_clean_architecture/features/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required String cityName,
    required String description,
    required double temperature,
  }) : super(
          cityName: cityName,
          description: description,
          temperature: temperature,
        );

  // Chuyển từ JSON của API thành WeatherModel
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
    );
  }
}
