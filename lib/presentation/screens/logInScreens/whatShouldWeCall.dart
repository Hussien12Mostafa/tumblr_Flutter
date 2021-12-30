// ignore_for_file: annotate_overrides, deprecated_member_use, avoid_print, non_constant_identifier_names, curly_braces_in_flow_control_structures, file_names, prefer_const_constructors



import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/userSignUp.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';

import 'package:tumbler/logic/functions/isNameValid.dart';
import 'package:tumbler/logic/functions/isPasswordValid.dart';

import 'package:tumbler/presentation/screens/logInScreens/logIn.dart';

import 'package:url_launcher/url_launcher.dart';

import '../homeScreens.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  UserSignUp? _user;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool visable = false;
  Future<void> Send(String email, String password, String name) async {
    print("inside it");
    bool test = await signUp(email, password, name);
    print("test=$test");
    if (test) {
      print("here");
      signIn = true;
       Navigator.of(context).pushNamedAndRemoveUntil(
                                    HomeScreen.routeName,
                                    (Route<dynamic> route) => false);
                              
    } else {
      setState(() {
        visable = true;
      });
    }
  }

  void initState() {
    super.initState();

    _email = TextEditingController();
    _email.addListener(() {});
    _pass = TextEditingController();
    _pass.addListener(() {});

    _name = TextEditingController();
    _name.addListener(() {});
  }

  bool _isObscure = true;
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Center(
          child: Form(
            key: formGlobalKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(color: Colors.white),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .6,
                        ),
                        FlatButton(
                          onPressed: () async {
                            final String email = _email.text;
                            final String password = _pass.text;
                            final String name = _name.text;
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();

                              await Send(email, password, name);
                            }
                          },
                          child: Text('Done',
                              style: TextStyle(color: Colors.blue)),
                        )
                      ]),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * .1,
                  // ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "What should we call\n",
                        style: TextStyle(
                            color: Colors.white.withOpacity(1), fontSize: 25),
                      ),
                      TextSpan(
                        text: " you?\n",
                        style: TextStyle(
                            color: Colors.white.withOpacity(1), fontSize: 25),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "You'll need a name to make\n",
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      ),
                      TextSpan(
                        text: "your own posts, customize your\n",
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      ),
                      TextSpan(
                        text: "blog,and message people\n",
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      )
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .05,
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                    child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Email',
                        ),
                        validator: isEmailValid),
                  ),
                  Visibility(
                      visible: visable,
                      child: Text(
                        "Email already exist",
                        style: TextStyle(color: Colors.red),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .1,
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                    child: TextFormField(
                      obscureText: _isObscure,
                      controller: _pass,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                      ),
                      validator: isPasswordCompliant,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .1,
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                    child: TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Name',
                        ),
                        validator: isNameValid),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .25,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Already have an account?\n",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                          text: "Log in\n",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  Login.routeName,
                                  (Route<dynamic> route) => false);
                            }),
                      TextSpan(
                          text: "Privacy dashboard\n",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.tumblr.com/privacy/redirect?redirect_url=https%3A%2F%2Fwww.tumblr.com%2Fsettings%2Fprivacy&token=lTSYYaeI9L-G-rNsND8.FiW5VtRrYQwRlztR43RvYavRzE-im0ApLr5pGDKtVbTvxl3U9L7JliscnUTh-7rSwhUKOftzXJZ1YZaJbSgprA.1');
                            })
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
