import '../../domain/entities/gender_prediction.dart';

class GenderModel extends GenderPrediction {
  GenderModel({
    required super.name,
    required super.gender,
    required super.probability,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) {
    return GenderModel(
      name: json['name'] ?? '',
      gender: json['gender'] ?? 'unknown',
      probability: (json['probability'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
