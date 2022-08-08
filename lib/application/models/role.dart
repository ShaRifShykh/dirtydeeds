class Role {
  final int id;
  final String name;

  Role.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        name = jsonMap['name'] ?? "";
}
