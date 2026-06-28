import '../entities/university.dart';

abstract class UniversitiesRepository {
  Future<List<University>> searchUniversities(String country);
}
