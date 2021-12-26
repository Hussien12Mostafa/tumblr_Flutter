class Note {
    Note({
        this.noteType,
        this.isDeleted,
        this.commentingBlogId,
        this.commentingBlogTitle,
        this.text,
        this.id,
        this.rebloggingId,
    });

    String? noteType;
    bool? isDeleted;
    String? commentingBlogId;
    String? commentingBlogTitle;
    String? text;
    String? id;
    String? rebloggingId;

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        noteType: json["noteType"],
        isDeleted: json["isDeleted"],
        commentingBlogId: json["commentingBlogId"],
        commentingBlogTitle: json["commentingBlogTitle"],
        text: json["text"],
        id: json["_id"],
        rebloggingId: json["rebloggingId"],
    );

    Map<String, dynamic> toJson() => {
        "noteType": noteType,
        "isDeleted": isDeleted,
        "commentingBlogId": commentingBlogId,
        "commentingBlogTitle": commentingBlogTitle,
        "text": text,
        "_id": id,
        "rebloggingId": rebloggingId,
    };
}
