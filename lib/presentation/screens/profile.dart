// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_is_empty, curly_braces_in_flow_control_structures, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/settings/settings.dart';
import 'package:tumbler/presentation/widget/networkImage.dart';
import 'package:tumbler/presentation/widget/post.dart';
import 'package:tumbler/presentation/widget/showNameUser.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
 

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Post> postsUserShow = [];
  List<Post> postsUserShowLike = [];
  List<Blog> followingBlog = [];
  bool load = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
   if (blogUser != null) {
      print("not = null");
      List<String> postsUser = blogUser!.postsIds as List<String>;
      if (postsUser.length != 0) {
        _showPost(postsUser);
      }
    }

    super.initState();
  }

  _followingBlog() async {
    List<Map<String, dynamic>?> blogsFollow = [];

    if (user!.followingBlogs != null) {
      List<String> follow = user!.followingBlogs;
      for (var i = 0; i < follow.length; i++) {
        blogsFollow.add(await getBlog(follow[i]) as Map<String, dynamic>?);
      }
      if (blogsFollow.length != 0)
        for (var i = 0; i < follow.length; i++) {
          if (blogsFollow[i]! != null)
            followingBlog.add(Blog.fromJson(blogsFollow[i]!["res"]["data"]));
        }
    }
    setState(() {
      load = true;
    });
  }

  _showPostLike(List<String> postsUser) async {
    List<Map<String, dynamic>?> postsMap = [];
    for (var i = 0; i < postsUser.length; i++) {
      postsMap.add(await showPosts(postsUser[i]) as Map<String, dynamic>?);
    }
    for (var i = 0; i < postsUser.length; i++) {
      if (postsMap[i] != null)
        postsUserShowLike.add(Post.fromJson(postsMap[i]!["res"]["post"]));
    }
    _followingBlog();
  }

  _showPost(List<String> postsUser) async {
    List<Map<String, dynamic>?> postsMap = [];
    for (var i = 0; i < postsUser.length; i++) {
      postsMap.add(await showPosts(postsUser[i]) as Map<String, dynamic>);
    }
    for (var i = 0; i < postsUser.length; i++) {
      if (postsMap[i] != null)
        postsUserShow.add(Post.fromJson(postsMap[i]!["res"]["post"]));
    }
     if (user != null) {
      List<String> postsUserLike = user!.likesPostsId as List<String>;
      if (postsUserLike.length != 0) {
        _showPostLike(postsUserLike);
      } else
        setState(() {
          load = true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
       
    return !load
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.palette),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SettingsScreen.routeName);
                  },
                  icon: Icon(Icons.settings),
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
                        left: 130,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 100,
                                  color: Colors.amber[50],
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,

                                        //mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Change your avatar'),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('View your avatar'),
                                            ),
                                          )
                                          // ElevatedButton(
                                          //   child: const Text('Close BottomSheet'),
                                          //   onPressed: () => Navigator.pop(context),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://wallpapertops.com/walldb/original/5/9/b/56244.jpg'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Untitled',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.red,
                  tabs: [
                    Tab(
                      text: 'Posts',
                    ),
                    Tab(
                      text: 'Likes',
                    ),
                    Tab(
                      text: 'Following',
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
                            child: postsUserShow.length == 0
                                ? Container()
                                : ListView.builder(
                                    itemCount: postsUserShow.length,
                                    itemBuilder: (context, index) {
                                      return ShowPost(
                                          post: postsUserShow[index]);
                                    })),
                      ),
                    Center(
                        child: postsUserShowLike.length == 0
                            ? Container()
                            : ListView.builder(
                                itemCount: postsUserShowLike.length,
                                itemBuilder: (context, index) {
                                  return ShowPost(
                                      post: postsUserShowLike[index]);
                                }),
                      ),
                    Center(
                        child: followingBlog.length == 0
                            ? Container()
                            : ListView.builder(
                                itemCount: followingBlog.length,
                                itemBuilder: (context, index) {
                                  return TextButton(
                                      onPressed: () {
                                        //go profile
                                      },
                                      child: Row(
                                        children: [
                                          GetNetworkImage(
                                              imageUrl: (followingBlog[index]
                                                          .avatar!) !=
                                                      null
                                                  ? followingBlog[index]
                                                              .avatar! !=
                                                          "default"
                                                      ? followingBlog[index]
                                                          .avatar! as String
                                                      : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"
                                                  : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .03),
                                            child: ShowNameUser(
                                              name: followingBlog[index]
                                                          .title !=
                                                      null
                                                  ? followingBlog[index].title
                                                      as String
                                                  : "error",
                                            ),
                                          )),
                                        ],
                                      ));
                                }),
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
