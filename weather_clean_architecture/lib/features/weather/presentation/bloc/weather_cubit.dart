// lib/features/weather/presentation/bloc/weather_cubit.dart

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture/features/weather/data/models/weather_model.dart';
import 'package:weather_clean_architecture/features/weather/domain/entities/weather.dart';
import 'package:weather_clean_architecture/features/weather/domain/usecases/get_weather.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeather getWeather;

  WeatherCubit(this.getWeather) : super(WeatherLoading());

  Future<void> fetchWeather(String cityName) async {
    final result = await getWeather(cityName);
    result.fold(
      (failure) => emit(WeatherError('Unable to fetch weather data')),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }
}
