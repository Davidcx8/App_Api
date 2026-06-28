import 'package:flutter/material.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather.dart';

class WeatherController extends ChangeNotifier {
  final GetWeather _getWeather;
  BaseState<Weather> state = BaseState();

  WeatherController({required GetWeather getWeather}) : _getWeather = getWeather;

  Future<void> fetchWeather() async {
    state = state.copyWith(status: Status.loading);
    notifyListeners();

    try {
      // Defaulting to Santo Domingo, Dominican Republic for simplicity
      final result = await _getWeather(18.4861, -69.9312);
      state = state.copyWith(status: Status.success, data: result);
    } catch (e) {
      state = state.copyWith(status: Status.error, errorMessage: e.toString());
    }
    notifyListeners();
  }
}
