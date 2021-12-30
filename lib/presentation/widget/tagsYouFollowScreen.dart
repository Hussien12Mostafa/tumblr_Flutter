// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/createPost.dart';
import 'package:tumbler/presentation/widget/followUnFollowButton.dart';
import 'package:tumbler/presentation/widget/post.dart';

class TagsYouFollow extends StatefulWidget {
  String tagfollowed;

  TagsYouFollow({Key? key, required this.tagfollowed}) : super(key: key);

  @override
  _TagsYouFollowState createState() => _TagsYouFollowState();
}

class _TagsYouFollowState extends State<TagsYouFollow>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool load = false;
  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    _getPosts();
    super.initState();
  }

  Map<String, dynamic>? l;
  List<dynamic>? resultHashTag;
  List<dynamic>? resultPostHashTag;
  List<dynamic>? resultBlogs;
  List<Blog> resBlogs = [];
  List<Post> resPosts = [];

  _getPosts() async {
    l = await autoCompleteSearch(widget.tagfollowed) as Map<String, dynamic>;

    if (l != null) {
      resultHashTag = l!["resultHashTag"];

      resultPostHashTag = l!["resultPostHashTag"];

      resultBlogs = l!["resultBlogs"];

      for (var i = 0; i < resultBlogs!.length; i++) {
        resBlogs.add(Blog.fromJson(resultBlogs![i]));
      }

      for (var i = 0; i < resultPostHashTag!.length; i++) {
        resPosts.add(Post.fromJson(resultPostHashTag![i]));
      }
      setState(() {
        load = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !load
        ? CircularProgressIndicator()
        : Scaffold(
            floatingActionButton: Wrap(
              children: [
                FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, CreatePost.routeName,
                          arguments: ["tag", widget.tagfollowed]);
                    },
                    child: Icon(
                      FontAwesome5.pen,
                    )),
              ],
            ),
            appBar: AppBar(
              backgroundColor: Colors.grey,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
              elevation: 0,
            ),
            body: Column(
              children: [
                Container(
                  height: 200,
                  width: 500,
                  color: Colors.grey,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 75,
                        left: 20,
                        child: Text(
                          '#' + widget.tagfollowed,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        left: 20,
                        child: FollowUnFollow(),
                      ),
                      Positioned(
                        top: 130,
                        left: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey),
                          onPressed: () {
                            Navigator.pushNamed(context, CreatePost.routeName,
                                arguments: ["tag", widget.tagfollowed]);
                          },
                          child: Text('New Post'),
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.red,
                  tabs: [
                    Tab(
                      text: 'Posts',
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        child: Center(
                          child: ListView.builder(
                              itemCount: resPosts.length,
                              itemBuilder: (context, index) {
                                print("len=${resPosts.length}");
                                return ShowPost(post: resPosts[index]);
                              }),
                        ),
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
              ],
            ),
          );
  }
}
