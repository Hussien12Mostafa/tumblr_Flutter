// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/logInScreens/logIn.dart';
import 'package:tumbler/presentation/screens/logInScreens/signUp.dart';

class SignUpIn extends StatefulWidget {
  @override
  _SignUpInState createState() => _SignUpInState();
}

class _SignUpInState extends State<SignUpIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/OIP.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .6,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Sign up'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Log in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
