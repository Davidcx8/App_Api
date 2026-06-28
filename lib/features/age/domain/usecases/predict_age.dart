import '../entities/age_prediction.dart';
import '../repositories/age_repository.dart';

class PredictAge {
  final AgeRepository repository;

  PredictAge(this.repository);

  Future<AgePrediction> call(String name) {
    if (name.isEmpty) throw ArgumentError('Name cannot be empty');
    return repository.predictAge(name);
  }
}
