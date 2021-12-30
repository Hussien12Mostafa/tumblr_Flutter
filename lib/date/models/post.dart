

Post postFromJson(Map<String, dynamic> str) => Post.fromJson(str);

class Post {
  Post({
    required this.id,
    required this.blogId,
    required this.postHtml,
    required this.type,
    required this.state,
    this.tags,
    this.notesId,
    this.isDeleted,
     this.v,
  });

  String id;
  String blogId;
  String postHtml;
  String type;
  String state;
  List<String>? tags;
  String? notesId;
  bool? isDeleted;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        blogId: json["blogId"],
        postHtml: json["postHtml"],
        type: json["type"],
        state: json["state"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        notesId: json["notesId"],
        isDeleted: json["isDeleted"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "blogId": blogId,
        "postHtml": postHtml,
        "type": type,
        "state": state,
        "tags": tags!!=null?List<dynamic>.from(tags!.map((x) => x)):null,
        "notesId": notesId,
        "isDeleted":isDeleted,
        "__v": v,
      };
}
