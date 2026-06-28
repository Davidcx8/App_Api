import 'package:flutter/material.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entities/university.dart';
import '../../domain/usecases/search_universities.dart';

class UniversitiesController extends ChangeNotifier {
  final SearchUniversities _searchUniversities;
  BaseState<List<University>> state = BaseState();

  UniversitiesController({required SearchUniversities searchUniversities}) : _searchUniversities = searchUniversities;

  Future<void> search(String country) async {
    if (country.isEmpty) return;
    
    state = state.copyWith(status: Status.loading);
    notifyListeners();

    try {
      final result = await _searchUniversities(country);
      state = state.copyWith(status: Status.success, data: result);
    } catch (e) {
      state = state.copyWith(status: Status.error, errorMessage: e.toString());
    }
    notifyListeners();
  }
}
