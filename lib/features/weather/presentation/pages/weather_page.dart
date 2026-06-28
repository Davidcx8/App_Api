import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/state/base_state.dart';
import '../controllers/weather_controller.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherController>().fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WeatherController>().state;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Weather in Santo Domingo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.status == Status.loading)
                const CircularProgressIndicator()
              else if (state.status == Status.error)
                Text(state.errorMessage ?? 'Error', style: const TextStyle(color: Colors.red))
              else if (state.status == Status.success && state.data != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
                        const SizedBox(height: 16),
                        Text(
                          '${state.data!.temperature}°C',
                          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Wind Speed: ${state.data!.windspeed} km/h'),
                        Text('Condition Code: ${state.data!.weathercode}'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
