import '../../domain/entities/university.dart';

class UniversityModel extends University {
  UniversityModel({
    required super.country,
    required super.name,
    required super.domains,
    required super.webPages,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      country: json['country'] ?? '',
      name: json['name'] ?? '',
      domains: List<String>.from(json['domains'] ?? []),
      webPages: List<String>.from(json['web_pages'] ?? []),
    );
  }
}
