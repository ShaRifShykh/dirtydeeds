class AudioBook {
  final int id;
  final String image;
  final String audio;
  final String title;
  final String artistName;
  final String description;
  final String createdAt;

  AudioBook.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        image = jsonMap['image'] ?? "",
        audio = jsonMap['audio'] ?? "",
        title = jsonMap['title'] ?? "",
        artistName = jsonMap['artistName'] ?? "",
        description = jsonMap['description'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "";
}
