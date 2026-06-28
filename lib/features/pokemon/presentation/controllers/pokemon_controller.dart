import 'package:flutter/material.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemon.dart';

class PokemonController extends ChangeNotifier {
  final GetPokemon _getPokemon;
  BaseState<Pokemon> state = BaseState();

  PokemonController({required GetPokemon getPokemon}) : _getPokemon = getPokemon;

  Future<void> fetchPokemon(String name) async {
    if (name.isEmpty) return;

    state = state.copyWith(status: Status.loading);
    notifyListeners();

    try {
      final result = await _getPokemon(name);
      state = state.copyWith(status: Status.success, data: result);
    } catch (e) {
      state = state.copyWith(status: Status.error, errorMessage: e.toString());
    }
    notifyListeners();
  }
}
