// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/notes.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/widget/likeAndReBlogShow.dart';



/// class for design screen likes
class LikesPost extends StatefulWidget {
  static const String routeName = "LikesPost";
  LikesPost({Key? key}) : super(key: key);

  @override
  State<LikesPost> createState() => _LikesPostState();
}

class _LikesPostState extends State<LikesPost> {
  /// function widget to design screen and print users like this post
  @override
  Widget build(BuildContext context) {
    bool load = true;
    Blog? blogg;
    List<dynamic> l =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    List<Note> notes = l[0];
    int counterLike = l[1];
    int counterReBlog = l[2];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${counterLike + counterReBlog} notes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
          // controller: _scrollController,
          //itemExtent: 20,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            if ((notes[index].noteType == "like" &&
                    notes[index].isDeleted == false) ||
                (notes[index].noteType == "reblog" &&
                    notes[index].isDeleted == false))
              return LikeAndReBlogShow(note: notes[index]);
            return Container();
          }),
    );
  }
}
