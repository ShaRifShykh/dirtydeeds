class Category {
  final int id;
  final String image;
  final String name;
  final String description;
  final String categoryId;
  final String createdAt;

  Category.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        name = jsonMap['name'] ?? "",
        description = jsonMap['description'] ?? "",
        categoryId = jsonMap['categoryId'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "";
}
