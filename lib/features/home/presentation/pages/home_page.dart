import 'package:flutter/material.dart';
import '../../../about/presentation/pages/about_page.dart';
import '../../../gender/presentation/pages/gender_page.dart';
import '../../../age/presentation/pages/age_page.dart';
import '../../../universities/presentation/pages/universities_page.dart';
import '../../../weather/presentation/pages/weather_page.dart';
import '../../../pokemon/presentation/pages/pokemon_page.dart';
import '../../../wordpress/presentation/pages/wordpress_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tools = [
      {'title': 'Gender Predictor', 'icon': Icons.person, 'page': const GenderPage()},
      {'title': 'Age Predictor', 'icon': Icons.cake, 'page': const AgePage()},
      {'title': 'Universities', 'icon': Icons.school, 'page': const UniversitiesPage()},
      {'title': 'Weather', 'icon': Icons.cloud, 'page': const WeatherPage()},
      {'title': 'Pokémon', 'icon': Icons.catching_pokemon, 'page': const PokemonPage()},
      {'title': 'WordPress News', 'icon': Icons.article, 'page': const WordpressPage()},
      {'title': 'About', 'icon': Icons.info, 'page': const AboutPage()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toolbox App'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: tools.length,
        itemBuilder: (context, index) {
          final tool = tools[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tool['page'] as Widget),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(tool['icon'] as IconData, size: 48, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 12),
                  Text(
                    tool['title'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
