// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_cast, avoid_print, avoid_init_to_null, unrelated_type_equality_checks, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/notes.dart';

import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';

import 'package:tumbler/presentation/widget/networkImage.dart';


import 'package:tumbler/presentation/widget/report.dart';
import 'package:tumbler/presentation/widget/rowButtonsPost.dart';

import 'package:tumbler/presentation/widget/showNameUser.dart';

class ShowPost extends StatefulWidget {
  Post post;

  bool isLike = false;
  ShowPost({Key? key, required this.post}) : super(key: key);

  @override
  State<ShowPost> createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  Blog? blog = null;
  List<Note> notes = [];
  int counterNotes = 0;
  Map<String, dynamic>? bbb;
  @override
  void initState() {
    _getBlog();

    super.initState();
  }

  _getComment() async {
    
    Map<String, dynamic>? note =
        await getComments(widget.post.id) as Map<String, dynamic>;

    if (note != null) {
      List<dynamic>? n = note["res"]["notes"];
      if (n != null) {
        if (n.length != 0) {
          for (var i = 0; i < n.length; i++) {
            notes.add(Note.fromJson(n[i]["note"]));
            if (notes[i].noteType == "like" || notes[i].noteType == "reblog")
              counterNotes++;
          }
         
        }
        setState(() {});
      }
    }
  }

  _getBlog() async {
    Map<String, dynamic> bb =
        await getBlog(widget.post.blogId) as Map<String, dynamic>;
    
    Map<String, dynamic>? b1 = bb["res"]["data"];

    if (b1 != null && b1 != '') {
      blog = Blog.fromJson(b1);
      print(blog!.avatar);
      _getComment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return blog == null
        ? CircularProgressIndicator()
        : Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    GetNetworkImage(
                        imageUrl: (blog!.avatar!) != null
                            ? blog!.avatar! != "default"
                                ? blog!.avatar! as String
                                : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"
                            : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .03),
                      child: ShowNameUser(
                        name: blog!.title != null
                            ? blog!.title as String
                            : "error",
                      ),
                    )),
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        reportSheet(context);
                      },
                      child: Icon(
                        Icons.more_horiz,
                        color: IconTheme.of(context).color,
                      ),
                    )
                  ],
                ),
              ),
              Html(
                data: widget.post.postHtml,
              ),
              ButtonsPost(post: widget.post,counterNotes: counterNotes,notes: notes,),
              Container(
                height: MediaQuery.of(context).size.height * .02,
                color: Colors.black,
              )
            ],
          );
  }
}
