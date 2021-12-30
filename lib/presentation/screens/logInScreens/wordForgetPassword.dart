// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_const_constructors

//import 'package:dicee/date/models/usersEmail.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tumbler/date/models/emailLogIn.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/logInScreens/logIn.dart';
import 'package:url_launcher/url_launcher.dart';

class wordForgetPassword extends StatefulWidget {
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

class _EnterPasswordState extends State<wordForgetPassword> {
  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();
  AutoLoginModel? _user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formGlobalKey,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                BackButton(color: Colors.white),
                FlatButton(
                  onPressed: () async {
                  
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                )
              ]),
              SizedBox(
                height: 100,
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Okay, we just sent you a password\n",
                    style: TextStyle(
                        color: Colors.white.withOpacity(1), fontSize: 15),
                  ),
                  TextSpan(
                    text: "reset email\n",
                    style: TextStyle(
                        color: Colors.white.withOpacity(1), fontSize: 15),
                  ),
                  TextSpan(
                    text: "Didn't get it? Check your spam folder. If it's\n",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 15),
                  ),
                  TextSpan(
                    text: "not there, follow the tips in ",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 15),
                  ),
                  TextSpan(
                      text: "our help docs.\n",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://tumblr.zendesk.com/hc/en-us');
                        })
                ]),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
              ),
              _user == null
                  ? Container()
                  : Text(
                      "Info: Email ${_user!.email}    is created sucessfully ${_user!.createdAt.toIso8601String()}",
                      style: TextStyle(color: Colors.black),
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
