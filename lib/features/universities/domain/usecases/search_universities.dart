import '../entities/university.dart';
import '../repositories/universities_repository.dart';

class SearchUniversities {
  final UniversitiesRepository repository;

  SearchUniversities(this.repository);

  Future<List<University>> call(String country) {
    if (country.isEmpty) throw ArgumentError('Country cannot be empty');
    return repository.searchUniversities(country);
  }
}
