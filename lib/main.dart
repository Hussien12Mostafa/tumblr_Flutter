// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/userTest.dart';
import 'package:tumbler/presentation/screens/createPost.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';
import 'package:tumbler/presentation/screens/logInScreens/logIn.dart';
import 'package:tumbler/presentation/screens/logInScreens/logInSignUp.dart';
import 'package:tumbler/presentation/screens/logInScreens/signUp.dart';
import 'package:tumbler/presentation/screens/logInScreens/whatShouldWeCall.dart';
import 'package:tumbler/presentation/screens/postsHome/likesPost.dart';
import 'package:tumbler/presentation/themes/appTheme.dart';
import 'package:tumbler/presentation/widget/notes.dart';
import 'package:http/http.dart' as http;
import 'package:tumbler/presentation/widget/slider.dart';

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
        '/': (_) => SignUpIn(),
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

// class fff extends StatelessWidget {
//   const fff({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 30,
//               color: Colors.amber,
//             ),
//             TextButton(
//                 onPressed: () async {
//                   print("inside");
//                   UserTest? u = await getUser();
//                   print("get");
//                   print(u!.name);
//                   if (u != null && u.name != null && u.email != null) {
//                     Text(u.name! + ' ' + u.email!);
//                     print("inside again");
//                   }
//                 },
//                 child: Text(
//                   "click",
//                   style: TextStyle(color: Colors.black),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<UserTest?> getUser() async {
//   final String apiUrl =
//       "https://dd839c69-b7f2-411a-8182-9dce818037d1.mock.pstmn.io/";

//   final response = await http.get(Uri.parse(apiUrl));

//   if (response.statusCode == 200) {
//     print("fun data got");
//     print(response.body);
//     var body = jsonDecode(response.body);
//     UserTest u = UserTest.fromJson(body);
//     return u;
//   } else {
//     return null;
//   }
// }
