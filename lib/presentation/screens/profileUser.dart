// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_is_empty, curly_braces_in_flow_control_structures, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';

import 'package:tumbler/presentation/widget/post.dart';

class ProfileUser extends StatefulWidget {
   ProfileUser({Key? key,required this.b }) : super(key: key);
  static const String routeName = "profile";
  Blog b;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileUser>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Post> postsUserShow = [];

  bool load = false;

  @override
  void initState() {
    print("inside init");
    _tabController = TabController(length: 3, vsync: this);

    //_showPost();

    super.initState();
  }

  // _showPost() async {
  //   List<Map<String, dynamic>?> postsMap = [];
  //   for (var i = 0; i < postsUser.length; i++) {
  //     postsMap.add(await showPosts(postsUser[i]) as Map<String, dynamic>);
  //   }
  //   for (var i = 0; i < postsUser.length; i++) {
  //     if (postsMap[i] != null)
  //       postsUserShow.add(Post.fromJson(postsMap[i]!["res"]["post"]));
  //   }

  //   setState(() {
  //     load = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<dynamic> l =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    print(l[1]);
    Blog b = l[1] as Blog;
    return !load
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
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
                            backgroundImage: NetworkImage((b.avatar) != null
                                ? b.avatar!
                                : 'https://wallpapertops.com/walldb/original/5/9/b/56244.jpg'),
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
                      Center(child: Text("Not Allow")),
                      Center(child: Text("Not Allow")),
                    ],
                    controller: _tabController,
                  ),
                ),
              ],
            ),
          );
  }
}
