import 'package:dirtydeeds/application/models/article_tag.dart';
import 'package:dirtydeeds/application/models/category.dart';
import 'package:dirtydeeds/application/models/comment.dart';

class Article {
  final int id;
  final String image;
  final String title;
  final String description;
  final String createdAt;
  final Category? category;
  final List<ArticleTag> tags;
  final List<Comment> comments;

  Article.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        title = jsonMap['title'] ?? "",
        description = jsonMap['description'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "",
        category = jsonMap['category'] != null
            ? Category.fromJson(jsonMap['category'])
            : null,
        tags = _getTags(jsonMap['tags']),
        comments = _getComments(jsonMap['comments']);

  static _getTags(List<dynamic> tags) {
    if (tags.isEmpty) return <ArticleTag>[];
    return tags.map((tags) => ArticleTag.fromJson(tags)).toList();
  }

  static _getComments(List<dynamic> comments) {
    if (comments.isEmpty) return <Comment>[];
    return comments.map((comments) => Comment.fromJson(comments)).toList();
  }
}
