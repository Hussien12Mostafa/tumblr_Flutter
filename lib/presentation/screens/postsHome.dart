// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields, unused_field, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/date/models/user.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';

import 'package:tumbler/presentation/screens/createPost.dart';
import 'package:tumbler/presentation/widget/post.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

/// class for create posts and design them
class _PostsState extends State<Posts> {
  /// variable for fake data
  dynamic posts = null;
  List<Post> p = [];
  bool load = false;

  /// variable for widget
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _dashboard();
    if (posts != null) setState(() {});
    super.initState();
  }

  _dashboard() async {
    Map<String, dynamic> l = await dashboard(token) as Map<String, dynamic>;
    if (l != null) {
      print("posts=$l");
      posts = l["res"]["postsToShow"];

      blogUser = Blog.fromJson(l["res"]["blog"]);

      user = User.fromJson(l["res"]["user"]);

      for (var i = 0; i < posts!.length; i++) {
        p.add(Post.fromJson(posts![i]));
      }

      setState(() {
        load = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !load && p.length == 0
        ? CircularProgressIndicator()
        : Scaffold(
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
                  print("len=${p.length}");
                  return ShowPost(post: p[index]);
                }),
          );
  }
}
