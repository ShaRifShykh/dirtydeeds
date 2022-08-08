import 'package:dirtydeeds/application/models/admin.dart';
import 'package:dirtydeeds/application/models/comment.dart';

class Video {
  final int id;
  final String image;
  final String video;
  final String title;
  final String description;
  final int views;
  final String createdAt;
  final int totalVideoLikes;
  final int totalVideoDislikes;
  final Admin? admin;
  final List<Comment> comments;

  Video.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        video = jsonMap['video'] ?? "",
        title = jsonMap['title'] ?? "",
        description = jsonMap['description'] ?? "",
        views = jsonMap['views'] ?? 0,
        createdAt = jsonMap['createdAt'] ?? "",
        totalVideoLikes = jsonMap['totalVideoLikes'] ?? 0,
        totalVideoDislikes = jsonMap['totalVideoDislikes'] ?? 0,
        admin =
            jsonMap['admin'] != null ? Admin.fromJson(jsonMap['admin']) : null,
        comments = _getComments(jsonMap['comments']);

  static _getComments(List<dynamic> comments) {
    if (comments.isEmpty) return <Comment>[];
    return comments.map((comments) => Comment.fromJson(comments)).toList();
  }
}
