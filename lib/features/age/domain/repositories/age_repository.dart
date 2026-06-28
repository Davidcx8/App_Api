import '../entities/age_prediction.dart';

abstract class AgeRepository {
  Future<AgePrediction> predictAge(String name);
}
