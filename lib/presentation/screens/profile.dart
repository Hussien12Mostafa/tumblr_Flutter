// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/tabBarScreens/Post.dart';
import 'package:tumbler/presentation/screens/tabBarScreens/following.dart';
import 'package:tumbler/presentation/screens/tabBarScreens/likes.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 200,
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Posts')),
              Tab(child: Text('Likes')),
              Tab(child: Text('Following')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Post(),
            Likes(),
            Following(),
          ],
        ),
      ),
    );
  }
}
