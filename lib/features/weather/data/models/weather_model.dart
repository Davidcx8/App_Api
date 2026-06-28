import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.temperature,
    required super.windspeed,
    required super.weathercode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current_weather'] ?? {};
    return WeatherModel(
      temperature: (current['temperature'] as num?)?.toDouble() ?? 0.0,
      windspeed: (current['windspeed'] as num?)?.toDouble() ?? 0.0,
      weathercode: current['weathercode'] ?? 0,
    );
  }
}
