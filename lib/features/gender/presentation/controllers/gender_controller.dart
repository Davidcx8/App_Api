import 'package:flutter/material.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entities/gender_prediction.dart';
import '../../domain/usecases/predict_gender.dart';

class GenderController extends ChangeNotifier {
  final PredictGender _predictGender;
  BaseState<GenderPrediction> state = BaseState();

  GenderController({required PredictGender predictGender}) : _predictGender = predictGender;

  Future<void> predict(String name) async {
    if (name.isEmpty) return;
    
    state = state.copyWith(status: Status.loading);
    notifyListeners();

    try {
      final result = await _predictGender(name);
      state = state.copyWith(status: Status.success, data: result);
    } catch (e) {
      state = state.copyWith(status: Status.error, errorMessage: e.toString());
    }
    notifyListeners();
  }
}
