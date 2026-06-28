import '../../domain/entities/age_prediction.dart';

class AgeModel extends AgePrediction {
  AgeModel({
    required super.name,
    required super.age,
    required super.count,
  });

  factory AgeModel.fromJson(Map<String, dynamic> json) {
    return AgeModel(
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      count: json['count'] ?? 0,
    );
  }
}
