import 'package:dirtydeeds/application/models/role.dart';

class Admin {
  final int id;
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String website;
  final String createdAt;
  final Role? role;

  Admin.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        profilePicture = jsonMap['profilePicture'] ?? "",
        firstName = jsonMap['firstName'] ?? "",
        lastName = jsonMap['lastName'] ?? "",
        username = jsonMap['username'] ?? "",
        email = jsonMap['email'] ?? "",
        website = jsonMap['website'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "",
        role = jsonMap['role'] != null ? Role.fromJson(jsonMap['role']) : null;
}
