import 'package:flutter/material.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entities/age_prediction.dart';
import '../../domain/usecases/predict_age.dart';

class AgeController extends ChangeNotifier {
  final PredictAge _predictAge;
  BaseState<AgePrediction> state = BaseState();

  AgeController({required PredictAge predictAge}) : _predictAge = predictAge;

  Future<void> predict(String name) async {
    if (name.isEmpty) return;
    
    state = state.copyWith(status: Status.loading);
    notifyListeners();

    try {
      final result = await _predictAge(name);
      state = state.copyWith(status: Status.success, data: result);
    } catch (e) {
      state = state.copyWith(status: Status.error, errorMessage: e.toString());
    }
    notifyListeners();
  }
}
