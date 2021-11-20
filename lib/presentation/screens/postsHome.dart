// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/date/models/user.dart';
import 'package:tumbler/presentation/widget/post.dart';

class Posts extends StatefulWidget {
  static List<User> posts = onlineUsers;

  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  static List<Post> p = postsData;
  ScrollController _scrollController = ScrollController();
  @override
  // void initState() {
  //   super.initState();
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent) {
  //     _getMoreData();
  //   }
  // }

  // _getMoreData() {
  //   print("get more data");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tumblr'),
      ),
      body: ListView.builder(
          // controller: _scrollController,
          //itemExtent: 20,
          itemCount: p.length,
          itemBuilder: (context, index) {
            return ShowPost(post: p[index]);
          }),
    );
  }
}
