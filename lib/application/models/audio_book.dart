import 'package:dirtydeeds/application/models/category.dart';

class AudioBook {
  final int id;
  final String image;
  final String audio;
  final String title;
  final String artistName;
  final String description;
  final Category? category;
  final String createdAt;

  AudioBook.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        audio = jsonMap['audio'] ?? "",
        title = jsonMap['title'] ?? "",
        artistName = jsonMap['artistName'] ?? "",
        description = jsonMap['description'] ?? "",
        category = jsonMap['category'] != null
            ? Category.fromJson(jsonMap['category'])
            : null,
        createdAt = jsonMap['createdAt'] ?? "";
}
