import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/gender_prediction.dart';
import '../../domain/repositories/gender_repository.dart';
import '../models/gender_model.dart';

class GenderRepositoryImpl implements GenderRepository {
  final ApiClient apiClient;

  GenderRepositoryImpl(this.apiClient);

  @override
  Future<GenderPrediction> predictGender(String name) async {
    final response = await apiClient.get('${ApiConstants.genderizeUrl}?name=$name');
    return GenderModel.fromJson(response);
  }
}
