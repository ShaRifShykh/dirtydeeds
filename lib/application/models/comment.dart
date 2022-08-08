import 'package:dirtydeeds/application/models/comment_reply.dart';
import 'package:dirtydeeds/application/models/user.dart';

class Comment {
  final int id;
  final String comment;
  final String createdAt;
  final int totalCommentLikes;
  final int totalCommentDislikes;
  final User? user;
  final List<CommentReply> replies;

  Comment.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        comment = jsonMap['comment'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "",
        totalCommentLikes = jsonMap['totalCommentLikes'] ?? 0,
        totalCommentDislikes = jsonMap['totalCommentDislikes'] ?? 0,
        user = jsonMap['user'] != null ? User.fromJson(jsonMap['user']) : null,
        replies = _getReplies(jsonMap['replies']);

  static _getReplies(List<dynamic> replies) {
    if (replies.isEmpty) return <CommentReply>[];
    return replies.map((replies) => CommentReply.fromJson(replies)).toList();
  }
}
