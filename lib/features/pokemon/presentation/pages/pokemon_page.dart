import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/state/base_state.dart';
import '../controllers/pokemon_controller.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PokemonController>().state;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Pokémon Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter Pokémon name (e.g., pikachu)'),
              onSubmitted: (val) => context.read<PokemonController>().fetchPokemon(val),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<PokemonController>().fetchPokemon(_controller.text),
              child: const Text('Search'),
            ),
            const SizedBox(height: 32),
            if (state.status == Status.loading)
              const CircularProgressIndicator()
            else if (state.status == Status.error)
              Text(state.errorMessage ?? 'Error', style: const TextStyle(color: Colors.red))
            else if (state.status == Status.success && state.data != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      if (state.data!.imageUrl.isNotEmpty)
                        Image.network(state.data!.imageUrl, height: 150),
                      const SizedBox(height: 16),
                      Text(
                        state.data!.name.toUpperCase(),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Text('Base Experience: ${state.data!.baseExperience}'),
                      Text('Height: ${state.data!.height}'),
                      Text('Weight: ${state.data!.weight}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
