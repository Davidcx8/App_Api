import '../entities/post.dart';

abstract class WordpressRepository {
  Future<List<Post>> getPosts(String siteUrl);
}
