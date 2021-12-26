// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  String img = '';
  String title = '';
  String name = '';
  BlogScreen(
      {Key? key, required this.img, required this.name, required this.title})
      : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Image.network(
                  "https://besthqwallpapers.com/Uploads/14-12-2019/115889/thumb2-legend-4k-wallpapers-with-names-horizontal-text-legend-name.jpg"),
            ),
            Positioned(
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.img),
                radius: 50,
              ),
              top: 140,
              left: 140,
            )
          ],
        ),
        Text(widget.name),
        Text(widget.title),
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.red,
          tabs: [
            Tab(
              text: 'Posts',
            ),
            Tab(
              text: 'Likes',
            )
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        Expanded(
          child: TabBarView(
            children: [
              Container(child: Center(child: Text('posts'))),
              Center(child: Text('Likes'))
            ],
            controller: _tabController,
          ),
        ),
      ]),
    );
  }
}
