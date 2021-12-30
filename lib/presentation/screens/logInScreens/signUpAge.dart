// ignore_for_file: deprecated_member_use, non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';
import 'package:tumbler/presentation/screens/logInScreens/interestedPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tumbler/logic/functions/checkAge.dart';

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  var _onPressed;
  TextEditingController _Age = TextEditingController();
  bool UnderAge = false;
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                BackButton(
                  color: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _Age,
                  builder: (context, value, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width * .2,
                      child: FlatButton(
                        onPressed: value.text.isNotEmpty
                            ? () {
                                if (formGlobalKey.currentState!.validate()) {
                                  formGlobalKey.currentState!.save();
                                  ageInScreen = _Age.text;
                                  Navigator.of(context)
                                      .pushNamed(InterestedPage.routeName);
                                }
                              }
                            : null,
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                    );
                  },
                ),
              ]),
              Form(
                key: formGlobalKey,
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .1,
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  child: TextFormField(
                    controller: _Age,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'How old are you?',
                    ),
                    validator: (String? a) {
                      return checkAge(a);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "You're almost done. Enter your age\n",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "then tap the Next button to indicate that\n",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "you've read the ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch("https://www.tumblr.com/policy/privacy");
                        }),
                  TextSpan(
                    text: " and agree\n",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "to the  ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch(
                              "https://www.tumblr.com/policy/en/terms-of-service");
                        }),
                ]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
