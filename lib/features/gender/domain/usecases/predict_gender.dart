import '../entities/gender_prediction.dart';
import '../repositories/gender_repository.dart';

class PredictGender {
  final GenderRepository repository;

  PredictGender(this.repository);

  Future<GenderPrediction> call(String name) {
    if (name.isEmpty) throw ArgumentError('Name cannot be empty');
    return repository.predictGender(name);
  }
}
