// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';

class FollowButtonForBlog extends StatefulWidget {
  FollowButtonForBlog({Key? key, required this.b}) : super(key: key);
  Blog b;
  @override
  _FollowButtonForBlogState createState() => _FollowButtonForBlogState();
}

class _FollowButtonForBlogState extends State<FollowButtonForBlog> {
  @override
  Widget build(BuildContext context) {
    return widget.b.followers!.contains(blogUser!.id)
        ? TextButton(
            onPressed: () {},
            child: Text('UNFOLLOW'),
          )
        : TextButton(
            onPressed: () {},
            child: Text('FOLLOW'),
          );
  }
}
