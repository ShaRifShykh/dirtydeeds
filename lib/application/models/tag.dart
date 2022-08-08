class Tag {
  final int id;
  final String name;

  Tag.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        name = jsonMap['name'] ?? "";
}
