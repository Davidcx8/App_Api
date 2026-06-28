import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../models/pokemon_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final ApiClient apiClient;

  PokemonRepositoryImpl(this.apiClient);

  @override
  Future<Pokemon> getPokemon(String name) async {
    final response = await apiClient.get('${ApiConstants.pokeApiUrl}${name.toLowerCase()}');
    return PokemonModel.fromJson(response);
  }
}
