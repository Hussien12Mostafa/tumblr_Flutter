// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:tumbler/presentation/screens/createPost.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';
import 'package:tumbler/presentation/screens/logInScreens/logIn.dart';
import 'package:tumbler/presentation/screens/logInScreens/logInSignUp.dart';

import 'package:tumbler/presentation/screens/logInScreens/whatShouldWeCall.dart';
import 'package:tumbler/presentation/screens/postsHome/likesPost.dart';
import 'package:tumbler/presentation/themes/appTheme.dart';
import 'package:tumbler/presentation/widget/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      //home: SliderImages(),
      routes: {
        '/':(_)=>HomeScreen(),
      //  '/': (_) => SignUpIn(),
        HomeScreen.routeName: (context) => HomeScreen(),
        Notes.routeName: (context) => Notes(),
        LikesPost.routeName: (context) => LikesPost(),
        CreatePost.routeName: (context) => CreatePost(),
        SignUpIn.routeName: (context) => SignUpIn(),
        Login.routeName: (context) => Login(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
    );
  }
}

