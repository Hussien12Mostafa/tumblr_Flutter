// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/comments.dart';
import 'package:tumbler/date/models/likesAndReblog.dart';
import 'package:tumbler/date/models/post.dart';
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
    Post p = ModalRoute.of(context)!.settings.arguments as Post;
    List<CommentsData> commentsData = toList(p.m);
    List<LikesAndReblog> listOfLikesAndReblog = toListLike(p.likesThisPost);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${p.numOfLikes + p.numOfReblog} notes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          ButtonsLikesAndReblog(p: p),
          Expanded(
            child: ListView.builder(
              itemCount: commentsData.length,
              itemBuilder: (Context, index) {
                return Comments(c: commentsData[index]);
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
                onPressed: () {
                  if (controller.text == '') {
                  } else {
                    commentsData.add(
                        CommentsData(s: currentUser, comment: controller.text));
                    p.m.addAll({
                      p.m.length: {currentUser: controller.text}
                    });
                    controller.clear();
                    focusNode.unfocus();

                    setState(() {});
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
