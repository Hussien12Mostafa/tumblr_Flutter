// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/widget/post.dart';

class BlogScreen extends StatefulWidget {
  Blog blog;
  BlogScreen({Key? key, required this.blog}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Post> postsUserShow = [];
  bool load = false;
  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    if (widget.blog.postsIds != null) {
      print("has posts");
      print(widget.blog.postsIds!.length);
      _showPost(widget.blog.postsIds!);
    } else {
      print("no posts");
      setState(() {
        load = true;
      });
    }
    super.initState();
  }

  _showPost(List<String> postsUser) async {
    print("in func");
    List<Map<String, dynamic>?> postsMap = [];
    print(postsUser.length);
    for (var i = 0; i < postsUser.length; i++) {
      
      postsMap.add(await showPosts(postsUser[i]) as Map<String, dynamic>);
      
    }
    for (var i = 0; i < postsUser.length; i++) {
      if (postsMap[i] != null)
        postsUserShow.add(Post.fromJson(postsMap[i]!["res"]["post"]));
    }

    setState(() {
      load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !load
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: Colors.blueGrey,
              ),
            ),
            body: Column(children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.height * 1,
                    child: Image.network((widget.blog.background) != null
                        ? (widget.blog.background) == 'default'
                            ? 'https://besthqwallpapers.com/Uploads/14-12-2019/115889/thumb2-legend-4k-wallpapers-with-names-horizontal-text-legend-name.jpg'
                            : widget.blog.background!
                        : 'https://besthqwallpapers.com/Uploads/14-12-2019/115889/thumb2-legend-4k-wallpapers-with-names-horizontal-text-legend-name.jpg'),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage((widget.blog.avatar) != null
                          ? (widget.blog.avatar) == 'default'
                              ? 'https://icon-library.com/images/facebook-user-icon/facebook-user-icon-17.jpg'
                              : widget.blog.avatar!
                          : 'https://icon-library.com/images/facebook-user-icon/facebook-user-icon-17.jpg'),
                      radius: 50,
                    ),
                    top: 140,
                    left: 140,
                  )
                ],
              ),
              Text(widget.blog.name),
              Text(widget.blog.title!),
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
                      child: postsUserShow.length == 0
                          ? Container()
                          : ListView.builder(
                              itemCount:  postsUserShow.length,
                              itemBuilder: (context, index) {
                                return ShowPost(post: postsUserShow[index]);
                              }),
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ]),
          );
  }
}
