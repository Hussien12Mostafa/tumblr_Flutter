// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:tumbler/date/models/notes.dart';

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
    List<Note> notes = l[1];
    int counterNotes = l[0];

    Future<String?> _makeComment(String a, String b, String c) async {
      return await makeComment(a, b, c);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${counterNotes} notes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // ButtonsLikesAndReblog(
          //     commentsPost: commentsPost,
          //     counts: counts,
          //     likesUsers: likesUsers,
          //     reBlogPost: reBlogPost),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (Context, index) {
                if (notes[index].noteType == "comment") {
                  print(notes[index].text);
                  return Comments(note: notes[index]);
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
                    // String? s = await _makeComment(
                    //     "619957113df6b45019c42d06", post.id, controller.text);
                    //   if (s != null) {
                    print("add comment");
                    // commentsPost.add({
                    //   "commentingBlogId": "619957113df6b45019c42d06",
                    //   "commentingBlogTitle": "Untitled",
                    //   "text": controller.text,
                    //   "_id": "dd"
                    // });
                    print("added comment");
                    controller.clear();
                    focusNode.unfocus();
                    setState(() {});
                    //  }
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
