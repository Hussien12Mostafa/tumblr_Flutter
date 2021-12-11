// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/date/models/user.dart';
import 'package:tumbler/presentation/screens/createPost.dart';
import 'package:tumbler/presentation/widget/post.dart';

class Posts extends StatefulWidget {
  static List<User> posts = onlineUsers;

  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

/// class for create posts and design them
class _PostsState extends State<Posts> {
  /// variable for fake data
  static List<Post> p = postsData;

  /// variable for widget
  ScrollController _scrollController = ScrollController();
  @override

  /// function widget for design screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap(
        children: [
          FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(CreatePost.routeName);
              },
              child: Icon(
                FontAwesome5.pen,
              )),
        ],
      ),
      appBar: AppBar(
        title: Text('tumblr'),
      ),
      body: ListView.builder(
          itemCount: p.length,
          itemBuilder: (context, index) {
            return ShowPost(post: p[index]);
          }),
    );
  }
}
