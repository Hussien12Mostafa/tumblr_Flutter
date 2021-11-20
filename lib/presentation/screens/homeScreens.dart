// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tumbler/presentation/screens/createPost.dart';
import 'package:tumbler/presentation/screens/message.dart';
import 'package:tumbler/presentation/screens/postsHome.dart';
import 'package:tumbler/presentation/screens/profile.dart';
import 'package:tumbler/presentation/screens/search.dart';





class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
static const String routeName = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Posts(),
    Search(),
    Message(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'person',
            ),
          ],
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ));
  }
}
