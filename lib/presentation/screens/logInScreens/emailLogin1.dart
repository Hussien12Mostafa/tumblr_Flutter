// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors

//import 'package:dicee/date/models/usersEmail.dart';

import 'package:flutter/material.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';

import 'package:tumbler/presentation/widget/slider.dart';

import 'emailLogIn.dart';

String? Sendemail;
bool display = true;

class LoginEmailContinue extends StatefulWidget {
  @override
  _LoginEmailStateContinue createState() => _LoginEmailStateContinue();
}

TextEditingController Textfieldemail = TextEditingController();

class _LoginEmailStateContinue extends State<LoginEmailContinue> {
  TextEditingController _email = TextEditingController();

  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SliderImages(),
          Center(
            child: Form(
              key: formGlobalKey,
              child: Column(children: [
                Text(
                  't',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 200),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Email',
                      ),
                      validator: isEmailValid),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .1,
                  color: Colors.blue,
                  child: FlatButton(
                    onPressed: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        //Add the  here
                        {
                          formGlobalKey.currentState!.save();

                          setState(() {
                            //Check if the email exists, after posting of course.
                            Sendemail = _email.text;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (LoginEmail())));
                          });
                        }
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
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
