import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Weather> call(double lat, double lon) {
    return repository.getWeather(lat, lon);
  }
}
