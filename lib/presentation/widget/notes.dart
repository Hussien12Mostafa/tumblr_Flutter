// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/presentation/widget/listView.dart';

class Notes extends StatelessWidget {
  List<Post> p = postsData;
  Notes({Key? key}) : super(key: key);
  static const String routeName = "notes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${p[0].numOfNotes} notes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${p[0].numOfLikes} likes',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                Text(
                  '${p[0].numOfReblog} reblog',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          Expanded(child: ListViewGeneral(),),
        ],
      ),
    );
  }
}
