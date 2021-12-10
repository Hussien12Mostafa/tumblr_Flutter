// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/logInScreens/logIn.dart';
import 'package:tumbler/presentation/screens/logInScreens/signUpAge.dart';
import 'package:tumbler/presentation/widget/slider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Age()));
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Sign up with Email',
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
                  'Sign up with Google',
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
