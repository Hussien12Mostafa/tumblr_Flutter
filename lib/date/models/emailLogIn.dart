// ignore_for_file: file_names

import 'dart:convert';

AutoLoginModel autoLoginModelFromJson(String str) =>
    AutoLoginModel.fromJson(json.decode(str));

String autoLoginModelToJson(AutoLoginModel data) => json.encode(data.toJson());

class AutoLoginModel {
  AutoLoginModel({
    required this.email,
    required this.id,
    required this.createdAt,
  });

  String email;
  String id;
  DateTime createdAt;

  factory AutoLoginModel.fromJson(Map<String, dynamic> json) => AutoLoginModel(
        email: json["email"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
