import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemon {
  final PokemonRepository repository;

  GetPokemon(this.repository);

  Future<Pokemon> call(String name) {
    if (name.isEmpty) throw ArgumentError('Name cannot be empty');
    return repository.getPokemon(name);
  }
}
