import 'dart:convert';

Blog blogFromJson(Map<String, dynamic> str) => Blog.fromJson(str);

String blogToJson(Blog data) => json.encode(data.toJson());

class Blog {
  Blog({
    required this.id,
    this.title,
    this.avatar,
    this.accent,
    this.headerImage,
    this.background,
    this.blockedBlogs,
    this.followers,
    this.privacy,
    required this.name,
    this.updated,
    this.description,
    required this.password,
    this.isBlockedFromPrimary,
    this.isPrimary,
    this.blogVisitor,
    this.followedTags,
    this.postsIds,
    this.isDeleted,
    this.v,
  });

  String id;
  String? title;
  String? avatar;
  String? accent;
  String? headerImage;
  String? background;
  List<dynamic>? blockedBlogs;
  List<String>? followers;
  bool? privacy;
  String name;
  int? updated;
  String? description;
  String password;
  bool? isBlockedFromPrimary;
  bool? isPrimary;
  int? blogVisitor;
  List<dynamic>? followedTags;
  List<String>? postsIds;
  bool? isDeleted;
  int? v;

  factory Blog.fromJson(Map<String, dynamic> json) {
    print(json);
    return Blog(
      id: json["_id"],
      title: json["title"],
      avatar: json["avatar"],
      accent: json["accent"],
      headerImage: json["headerImage"],
      background: json["background"],
      blockedBlogs: List<dynamic>.from(json["blockedBlogs"].map((x) => x)),
      followers: List<String>.from(json["followers"].map((x) => x)),
      privacy: json["privacy"],
      name: json["name"],
      updated: json["updated"],
      description: json["description"],
      password: json["password"],
      isBlockedFromPrimary: json["isBlockedFromPrimary"],
      isPrimary: json["isPrimary"],
      blogVisitor: json["blogVisitor"],
      followedTags: json["followedTags"] != null
          ? List<dynamic>.from(json["followedTags"].map((x) => x))
          : null,
      postsIds: json["postsIds"] != null
          ? List<String>.from(json["postsIds"].map((x) => x))
          : null,
      isDeleted: json["isDeleted"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "avatar": avatar,
        "accent": accent,
        "headerImage": headerImage,
        "background": background,
        "blockedBlogs": blockedBlogs != null
            ? List<dynamic>.from(blockedBlogs!.map((x) => x))
            : null,
        "followers": followers != null
            ? List<dynamic>.from(followers!.map((x) => x))
            : null,
        "privacy": privacy,
        "name": name,
        "updated": updated,
        "description": description,
        "password": password,
        "isBlockedFromPrimary": isBlockedFromPrimary,
        "isPrimary": isPrimary,
        "blogVisitor": blogVisitor,
        "followedTags": followedTags != null
            ? List<dynamic>.from(followedTags!.map((x) => x))
            : null,
        "postsIds": postsIds != null
            ? List<dynamic>.from(postsIds!.map((x) => x))
            : null,
        "isDeleted": isDeleted,
        "__v": v,
      };
}
