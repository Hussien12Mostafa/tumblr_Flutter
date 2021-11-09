// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/user.dart';
import 'package:tumbler/presentation/widget/post.dart';

class Posts extends StatelessWidget {
  static List<User> posts = onlineUsers;
  const Posts({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("tumblr"),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('tumblr'),
            floating: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ShowPost(post: posts[index]);
            },
            childCount: posts.length,
          ))
        ],
      ),
    );
  }
}
