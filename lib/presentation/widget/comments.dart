// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/comments.dart';

class Comments extends StatelessWidget {
  Comments({Key? key, required this.c}) : super(key: key);
  CommentsData c;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: currentUser != c.s
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            currentUser != c.s
                ? CircleAvatar(
                    radius: MediaQuery.of(context).size.height * .03,
                    backgroundImage: NetworkImage(c.s.imageUrl),
                  )
                : Container(),
            Container(
              decoration: BoxDecoration(
                  color: currentUser != c.s ? Colors.white : Color(0xff0c234a),
                  border: Border.all(width: 1, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * .01) // border color
                  ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * .02),
                child: Text(
                  c.comment,
                  style: TextStyle(
                      color: currentUser != c.s ? Colors.black : Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            currentUser == c.s
                ? CircleAvatar(
                    radius: MediaQuery.of(context).size.height * .03,
                    backgroundImage: NetworkImage(c.s.imageUrl),
                  )
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
