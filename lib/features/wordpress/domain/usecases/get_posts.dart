import '../entities/post.dart';
import '../repositories/wordpress_repository.dart';

class GetPosts {
  final WordpressRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call(String siteUrl) {
    if (siteUrl.isEmpty) throw ArgumentError('Site URL cannot be empty');
    return repository.getPosts(siteUrl);
  }
}
