import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/network/api_client.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/gender/data/repositories/gender_repository_impl.dart';
import 'features/gender/domain/usecases/predict_gender.dart';
import 'features/gender/presentation/controllers/gender_controller.dart';
import 'features/age/data/repositories/age_repository_impl.dart';
import 'features/age/domain/usecases/predict_age.dart';
import 'features/age/presentation/controllers/age_controller.dart';
import 'features/universities/data/repositories/universities_repository_impl.dart';
import 'features/universities/domain/usecases/search_universities.dart';
import 'features/universities/presentation/controllers/universities_controller.dart';
import 'features/weather/data/repositories/weather_repository_impl.dart';
import 'features/weather/domain/usecases/get_weather.dart';
import 'features/weather/presentation/controllers/weather_controller.dart';
import 'features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'features/pokemon/domain/usecases/get_pokemon.dart';
import 'features/pokemon/presentation/controllers/pokemon_controller.dart';
import 'features/wordpress/data/repositories/wordpress_repository_impl.dart';
import 'features/wordpress/domain/usecases/get_posts.dart';
import 'features/wordpress/presentation/controllers/wordpress_controller.dart';

void main() {
  final apiClient = ApiClient();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GenderController(
            predictGender: PredictGender(GenderRepositoryImpl(apiClient)),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AgeController(
            predictAge: PredictAge(AgeRepositoryImpl(apiClient)),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => UniversitiesController(
            searchUniversities: SearchUniversities(UniversitiesRepositoryImpl(apiClient)),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => WeatherController(
            getWeather: GetWeather(WeatherRepositoryImpl(apiClient)),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PokemonController(
            getPokemon: GetPokemon(PokemonRepositoryImpl(apiClient)),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => WordpressController(
            getPosts: GetPosts(WordpressRepositoryImpl(apiClient)),
          ),
        ),
      ],
      child: const ToolboxApp(),
    ),
  );
}

class ToolboxApp extends StatelessWidget {
  const ToolboxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Toolbox App',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
