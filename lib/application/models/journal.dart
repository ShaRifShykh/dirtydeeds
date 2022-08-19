import 'package:dirtydeeds/application/models/category.dart';

class Journal {
  final int id;
  final String image;
  final String title;
  final String description;
  final Category? category;
  final String createdAt;

  Journal.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        title = jsonMap['title'] ?? "",
        description = jsonMap['description'] ?? "",
        category = jsonMap['category'] != null
            ? Category.fromJson(jsonMap['category'])
            : null,
        createdAt = jsonMap['createdAt'] ?? "";
}
