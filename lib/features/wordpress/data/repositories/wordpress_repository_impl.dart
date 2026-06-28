import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/wordpress_repository.dart';
import '../models/post_model.dart';

class WordpressRepositoryImpl implements WordpressRepository {
  final ApiClient apiClient;

  WordpressRepositoryImpl(this.apiClient);

  @override
  Future<List<Post>> getPosts(String siteUrl) async {
    final response = await apiClient.get(ApiConstants.wpPostsUrl(siteUrl));
    final List<dynamic> jsonList = response;
    return jsonList.map((e) => PostModel.fromJson(e)).toList();
  }
}
