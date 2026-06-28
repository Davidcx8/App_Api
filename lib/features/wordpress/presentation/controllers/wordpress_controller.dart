import 'package:flutter/material.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts.dart';

class WordpressController extends ChangeNotifier {
  final GetPosts _getPosts;
  BaseState<List<Post>> state = BaseState();

  WordpressController({required GetPosts getPosts}) : _getPosts = getPosts;

  Future<void> fetchPosts(String siteUrl) async {
    if (siteUrl.isEmpty) return;

    state = state.copyWith(status: Status.loading);
    notifyListeners();

    try {
      final result = await _getPosts(siteUrl);
      state = state.copyWith(status: Status.success, data: result);
    } catch (e) {
      state = state.copyWith(status: Status.error, errorMessage: e.toString());
    }
    notifyListeners();
  }
}
