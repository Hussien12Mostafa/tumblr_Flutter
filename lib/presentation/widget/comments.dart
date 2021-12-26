// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, curly_braces_in_flow_control_structures, unused_local_variable, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/notes.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';

class Comments extends StatefulWidget {
  Comments({Key? key, required this.note}) : super(key: key);
  Note note;

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Blog? b;
  bool load = false;
  @override
  void initState() {
    print("inside get blog for comment");
    _getBlog();

    super.initState();
  }

  _getBlog() async {
    if (widget.note.commentingBlogId != null) {
      Map<String, dynamic> bb =
          await getBlog(widget.note.commentingBlogId!) as Map<String, dynamic>;
     
      Map<String, dynamic>? b1 = bb["res"]["data"];

      if (b1 != null && b1 != '') {
        
        b = Blog.fromJson(b1);
        print(b!.id);
        setState(() {
          load = true;
          print("have fun got blog");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return !load
        ?Container()
        : Column(
            children: [
              Row(
                mainAxisAlignment: widget.note.commentingBlogId != userBlodId.id
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  widget.note.commentingBlogId != userBlodId.id
                      ? CircleAvatar(
                          radius: MediaQuery.of(context).size.height * .03,
                          backgroundImage: NetworkImage((b!.avatar!) != null
                            ? b!.avatar! != "default"
                                ? b!.avatar! as String
                                : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"
                            : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                        )
                      : Container(),
                  Container(
                    decoration: BoxDecoration(
                        color: widget.note.commentingBlogId != userBlodId.id
                            ? Colors.white
                            : Color(0xff0c234a),
                        border: Border.all(width: 1, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height *
                                .01) // border color
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * .02),
                      child: Text(
                        widget.note.text!,
                        style: TextStyle(
                            color: widget.note.commentingBlogId != userBlodId.id
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  widget.note.commentingBlogId == userBlodId.id
                      ? CircleAvatar(
                          radius: MediaQuery.of(context).size.height * .03,
                          backgroundImage: NetworkImage(userBlodId.avatar !=
                                  null
                              ? userBlodId.avatar as String
                              : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"))
                      : Container(),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * .03,
              )
            ],
          );
  }
}
