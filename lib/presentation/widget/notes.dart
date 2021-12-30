// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/notes.dart';
import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';

import 'package:tumbler/logic/functions/commentFieldCheck.dart';
import 'package:tumbler/presentation/widget/buttonNotesLikesAndReblog.dart';
import 'package:tumbler/presentation/widget/comments.dart';

class Notes extends StatefulWidget {
  Notes({Key? key}) : super(key: key);
  static const String routeName = "notes";

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController controller = TextEditingController();

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool load = false, loadComment = false;
    List<dynamic> l =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    int counterComment = l[4];
    Post post = l[3];
    List<Note> notes = l[2];
    int counterReBlog = l[1];
    int counterLike = l[0];

    Future<bool?> _makeComment(String a, String b, String c) async {
      return await makeComment(a, b, c);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${counterLike + counterReBlog } notes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          counterLike + counterReBlog != 0
              ? ButtonsLikesAndReblog(
                  notes: notes,
                  counterLike: counterLike,
                  counterReBlog: counterReBlog,
                )
              : Container(),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (Context, index) {
                if (notes[notes.length - 1 - index].noteType == "comment" &&
                    notes[notes.length - 1 - index].text != null) {
                  return Comments(note: notes[notes.length - 1 - index],post:post);
                }
                return Container();
              },
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Icon(
                  Iconic.at,
                  color: Colors.grey[900],
                  size: MediaQuery.of(context).size.height * .02,
                ),
              ),
              Expanded(
                  child: TextField(
                focusNode: focusNode,
                maxLength: null,
                controller: controller,
                decoration: InputDecoration(hintText: 'Say something nice'),
              )),
              TextButton(
                onPressed:

                    /// check text field if empty not add comment if text field has text i add comment
                    () async {
                  bool result = commentsCheck(controller.text);
                  if (result) {
                    bool? s = await _makeComment(
                        userBlodId.id, post.id, controller.text);
                    if (s != null) {
                      print("add comment");
                      
                      notes.insert(0,Note(
                        id:"sdasd",
                        noteType: "comment",
                        blogId: userBlodId.id,
                        text: controller.text,
                        isDeleted: false,
                      ));
                      counterComment++;
                      print("added comment");
                      controller.clear();
                      focusNode.unfocus();
                      setState(() {});
                    }
                  }
                },
                child: Text(
                  'Reply',
                  style: Theme.of(context).textTheme.headline2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
