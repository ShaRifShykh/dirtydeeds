import 'package:dirtydeeds/application/models/tag.dart';

class ArticleTag {
  final int id;
  final Tag? tag;

  ArticleTag.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        tag = jsonMap['tag'] != null ? Tag.fromJson(jsonMap['tag']) : null;
}
