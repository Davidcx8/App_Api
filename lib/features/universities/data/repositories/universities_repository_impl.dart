import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/university.dart';
import '../../domain/repositories/universities_repository.dart';
import '../models/university_model.dart';

class UniversitiesRepositoryImpl implements UniversitiesRepository {
  final ApiClient apiClient;

  UniversitiesRepositoryImpl(this.apiClient);

  @override
  Future<List<University>> searchUniversities(String country) async {
    final response = await apiClient.get('${ApiConstants.universitiesUrl}?country=$country');
    final List<dynamic> jsonList = response;
    return jsonList.map((e) => UniversityModel.fromJson(e)).toList();
  }
}
