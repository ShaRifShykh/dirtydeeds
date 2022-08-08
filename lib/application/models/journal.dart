class Journal {
  final int id;
  final String image;
  final String title;
  final String description;
  final String createdAt;

  Journal.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        title = jsonMap['title'] ?? "",
        description = jsonMap['description'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "";
}
