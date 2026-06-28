import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon> getPokemon(String name);
}
