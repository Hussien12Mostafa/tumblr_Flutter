// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors, non_constant_identifier_names, unnecessary_new

//import 'package:dicee/date/models/usersEmail.dart';

import 'package:flutter/material.dart';


import 'package:tumbler/date/models/emailLogIn.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';
import 'package:tumbler/presentation/screens/logInScreens/enterPassword.dart';
import 'package:tumbler/presentation/widget/slider.dart';



String? _Sendemail;
bool display = true;

AutoLoginModel? _user;



class LoginEmail extends StatefulWidget {
  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  TextEditingController _email = TextEditingController();
  GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SliderImages(),
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formGlobalKey,
                child: Column(children: [
                  Text(
                    't',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 200),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .78,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Email',
                      ),
                      validator: isEmailValid,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  if (display) ...[
                    Container(
                      width: MediaQuery.of(context).size.width * .78,
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.blue,
                      child: FlatButton(
                        onPressed: () async {
                          if (_formGlobalKey.currentState!.validate()) {
                            
                            _formGlobalKey.currentState!.save();
                            final AutoLoginModel? user =
                                await emailSignIn(_email.text);
                            setState(() {
                              
                              _user = user;
                              _Sendemail = _email.text;
                              display = false;
                            });
                          }
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ] else ...[
                    Container(
                      width: MediaQuery.of(context).size.width * .78,
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.blue,
                      child: FlatButton(
                        onPressed: () {
                          if (_formGlobalKey.currentState!.validate()) {
                            //Add the  here
                            _formGlobalKey.currentState!.save();
                            emailSignIn(_email.text);
                            setState(() {
                              //Check if the email exists, after posting of course.
                              _Sendemail = _email.text;
                              display = true;
                            });
                          }
                        },
                        child: Text(
                          'Send Magic Link',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .78,
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.grey,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EnterPassword()));
                          });
                        },
                        child: Text(
                          'Enter password',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .3,
                  ),
                  _user == null
                      ? Container(child: Text("Not working?"))
                      : Text(
                          "Info: Email ${_user!.email} is created sucessfully ${_user!.createdAt.toIso8601String()}",
                          style: TextStyle(color: Colors.black),
                        )
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
