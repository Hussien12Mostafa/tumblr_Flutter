// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/logInScreens/logIn.dart';
import 'package:tumbler/presentation/screens/logInScreens/signUp.dart';
import 'package:tumbler/presentation/widget/slider.dart';

class SignUpIn extends StatefulWidget {
  static const String routeName = "SignUpIn";
  @override
  _SignUpInState createState() => _SignUpInState();
}

class _SignUpInState extends State<SignUpIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        SliderImages(),
        Center(
          child: Column(
            children: [
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
                          MaterialPageRoute(builder: (context) => SignUp()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Sign up',
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
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
