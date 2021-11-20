// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:tumbler/date/models/post.dart';



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
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              GetNetworkImage(imageUrl: widget.post.ownerPost.imageUrl),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .03),
                  child: ShowNameUser(name: widget.post.ownerPost.name),
                ),
              ),
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
        Html(data: widget.post.data,),
        ButtonsPost(post: widget.post),
        Container(
          height: MediaQuery.of(context).size.height * .02,
          color: Colors.black,
        )
      ],
    );
  }
}
