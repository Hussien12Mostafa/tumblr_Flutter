// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/logInScreens/signUpAge.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/OIP.jpg'), fit: BoxFit.fill)),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Age()));
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Sign up with Email'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Sign up with Google'),
            ),
          ),
        ]),
      ),
    );
  }
}