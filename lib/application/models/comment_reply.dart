import 'package:dirtydeeds/application/models/admin.dart';

class CommentReply {
  final int id;
  final String reply;
  final String createdAt;
  final Admin? admin;

  CommentReply.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        reply = jsonMap['reply'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "",
        admin =
            jsonMap['admin'] != null ? Admin.fromJson(jsonMap['admin']) : null;
}
