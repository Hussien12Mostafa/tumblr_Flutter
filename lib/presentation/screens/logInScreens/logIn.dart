// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/logInScreens/emailLogin1.dart';
import 'package:tumbler/presentation/widget/slider.dart';

class Login extends StatefulWidget {
  static const String routeName = "Login";
  @override
  _LoginState createState() => _LoginState();
}

/// class for login screen and design it
class _LoginState extends State<Login> {
  /// function return widget for design screen and check any validate
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        SliderImages(),
        Center(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginEmailContinue()));
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Login with Email',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Login with Google',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
