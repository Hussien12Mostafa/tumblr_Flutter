// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/widget/networkImage.dart';
import 'package:tumbler/presentation/widget/showNameUser.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({Key? key}) : super(key: key);

  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  List<Blog> followersBlog = [];
  bool load = false;

  _followingBlog() async {
    List<Map<String, dynamic>?> blogsFollow = [];
    if (user!.followingBlogs != null) {
      print("inside firt if");
      List<String>? follow = blogUser!.followers;
      if (follow != null)
        for (var i = 0; i < follow.length; i++) {
         
        Map<String, dynamic>?f = await getBlog(follow[i]) as Map<String, dynamic>?;
        if(f!=null)
          blogsFollow.add(f);
         
        }
      if (blogsFollow.length != 0) {
        print("inside sec if");
        for (var i = 0; i < blogsFollow.length; i++) {
         
            followersBlog.add(Blog.fromJson(blogsFollow[i]!["res"]["data"]));
        }
      }
    }
    setState(() {
      load = true;
    });
  }

  @override
  void initState() {
    _followingBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !load
        ? Center(child: CircularProgressIndicator(),)
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: Colors.black,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                ],
              ),
            ),
            body: followersBlog.length == 0
                ? Center(child: Text("No Folllowers"),)
                : ListView.builder(
                    itemCount: followersBlog.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                          onPressed: () {
                            //go profile
                          },
                          child: Row(
                            children: [
                              GetNetworkImage(
                                  imageUrl: (followersBlog[index].avatar!) !=
                                          null
                                      ? followersBlog[index].avatar! !=
                                              "default"
                                          ? followersBlog[index].avatar!
                                              as String
                                          : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"
                                      : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        .03),
                                child: ShowNameUser(
                                  name: followersBlog[index].title != null
                                      ? followersBlog[index].title as String
                                      : "error",
                                ),
                              )),
                            ],
                          ));
                    }),
          );
  }
}
