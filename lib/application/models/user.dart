class User {
  final int id;
  final String profilePicture;
  final String name;
  final String phoneNumberOrEmail;
  final String gender;
  final String createdAt;

  User.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        profilePicture = jsonMap['profilePicture'] ?? "",
        name = jsonMap['name'] ?? "",
        phoneNumberOrEmail = jsonMap['phoneNumberOrEmail'] ?? "",
        gender = jsonMap['gender'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "";
}
