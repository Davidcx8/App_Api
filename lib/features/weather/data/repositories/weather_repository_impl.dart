import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiClient apiClient;

  WeatherRepositoryImpl(this.apiClient);

  @override
  Future<Weather> getWeather(double lat, double lon) async {
    final response = await apiClient.get('${ApiConstants.weatherUrl}?latitude=$lat&longitude=$lon&current_weather=true');
    return WeatherModel.fromJson(response);
  }
}
