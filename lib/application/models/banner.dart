class Banners {
  final int id;
  final String image;
  final String url;
  final String createdAt;

  Banners.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        url = jsonMap['url'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "";
}
