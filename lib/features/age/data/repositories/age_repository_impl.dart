import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/age_prediction.dart';
import '../../domain/repositories/age_repository.dart';
import '../models/age_model.dart';

class AgeRepositoryImpl implements AgeRepository {
  final ApiClient apiClient;

  AgeRepositoryImpl(this.apiClient);

  @override
  Future<AgePrediction> predictAge(String name) async {
    final response = await apiClient.get('${ApiConstants.agifyUrl}?name=$name');
    return AgeModel.fromJson(response);
  }
}
