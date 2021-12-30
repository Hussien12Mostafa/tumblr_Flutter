class Note {
  Note({
    this.noteType,
    this.isDeleted,
    this.text,
    this.blogId,
     this.id,
  });

  String? noteType;
  bool? isDeleted;
  String? text;
  String? id;
  String? blogId;
//id must be require
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        noteType: json["noteType"],
        isDeleted: json["isDeleted"],
        text: json["text"],
        blogId: json["blogId"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "noteType": noteType,
        "isDeleted": isDeleted,
        "text": text,
        "blogId": blogId,
        "_id":id,
      };
}
