import '../../domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.name,
    required super.height,
    required super.weight,
    required super.imageUrl,
    required super.baseExperience,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      baseExperience: json['base_experience'] ?? 0,
      imageUrl: json['sprites']?['other']?['official-artwork']?['front_default'] ?? '',
    );
  }
}
