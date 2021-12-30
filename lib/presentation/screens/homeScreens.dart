// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_element, prefer_const_literals_to_create_immutables, unused_field, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:tumbler/date/datafake/userInfo.dart';

import 'package:tumbler/presentation/screens/message.dart';
import 'package:tumbler/presentation/screens/postsHome.dart';
import 'package:tumbler/presentation/screens/profile.dart';
import 'package:tumbler/presentation/screens/search.dart';

import 'logInScreens/whatShouldWeCall.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// class design home screen(navbar in tumblr) and change between four screen
class _HomeScreenState extends State<HomeScreen> {
  /// variable for index four screen any active now
  int _selectedIndex = 0;
  static const Widget _pageSignUp = SignUpScreen();

  /// four screen
  static const List<Widget> _pages = <Widget>[
    Posts(),
    Search(),
    Message(),
    Profile(),
  ];

  /// function to select active screen
  void _onItemTapped(int index) {
    print("onitem");
    setState(() {
     if (!signIn && index > 1) {
        Navigator.of(context).pushNamedAndRemoveUntil(
                                    SignUpScreen.routeName,
                                    (Route<dynamic> route) => false);
                              
     } else
        _selectedIndex = index;
    });
  }

  /// function widget for design screen and make change between screens
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Center(child: _pages.elementAt(_selectedIndex)));
  }
}
