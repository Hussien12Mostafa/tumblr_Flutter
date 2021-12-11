import 'dart:convert';

EmailPasswordSend emailPasswordSendFromJson(String str) =>
    EmailPasswordSend.fromJson(json.decode(str));

String emailPasswordSendToJson(EmailPasswordSend data) =>
    json.encode(data.toJson());

class EmailPasswordSend {
  EmailPasswordSend({
    required this.email,
    required this.password,
    required this.id,
    required this.createdAt,
  });

  String email;
  String password;
  String id;
  DateTime createdAt;

  factory EmailPasswordSend.fromJson(Map<String, dynamic> json) =>
      EmailPasswordSend(
        email: json["email"],
        password: json["password"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}