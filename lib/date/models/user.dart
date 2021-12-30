// To parse this JSON data, do
//
//     final User = UserFromJson(jsonString);

import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    required this.blogsId,
    required this.favoriteBlogs,
    required this.followingBlogs,
    required this.likesPostsId,
    required this.role,
    required this.isDeleted,
    required this.isVerified,
    required this.isActivated,
    required this.isBlocked,
    required this.v,
    required this.followedTags,
  });

  String id;
  String name;
  String email;
  String password;
  int age;
  List<String> blogsId;
  List<dynamic> favoriteBlogs;
  List<String> followingBlogs;
  List<String> likesPostsId;
  String role;
  bool isDeleted;
  bool isVerified;
  bool isActivated;
  bool isBlocked;
  int v;
  List<String> followedTags;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      age: json["age"],
      blogsId: List<String>.from(json["blogsId"].map((x) => x)),
      favoriteBlogs: List<dynamic>.from(json["favoriteBlogs"].map((x) => x)),
      followingBlogs: List<String>.from(json["following_blogs"].map((x) => x)),
      likesPostsId: List<String>.from(json["likes_posts_id"].map((x) => x)),
      role: json["role"],
      isDeleted: json["isDeleted"],
      isVerified: json["isVerified"],
      isActivated: json["isActivated"],
      isBlocked: json["isBlocked"],
      v: json["__v"],
      followedTags: List<String>.from(json["followedTags"].map((x) => x)),
    );
  
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "age": age,
        "blogsId": List<dynamic>.from(blogsId.map((x) => x)),
        "favoriteBlogs": List<dynamic>.from(favoriteBlogs.map((x) => x)),
        "following_blogs": List<dynamic>.from(followingBlogs.map((x) => x)),
        "likes_posts_id": List<dynamic>.from(likesPostsId.map((x) => x)),
        "role": role,
        "isDeleted": isDeleted,
        "isVerified": isVerified,
        "isActivated": isActivated,
        "isBlocked": isBlocked,
        "__v": v,
        "followedTags": List<dynamic>.from(followedTags.map((x) => x)),
      };
}
