import '../entities/gender_prediction.dart';

abstract class GenderRepository {
  Future<GenderPrediction> predictGender(String name);
}
