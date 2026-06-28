import '../../domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.title,
    required super.content,
    required super.date,
    required super.link,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title']?['rendered'] ?? 'No Title',
      content: json['excerpt']?['rendered'] ?? 'No Content',
      date: json['date'] ?? '',
      link: json['link'] ?? '',
    );
  }
}
