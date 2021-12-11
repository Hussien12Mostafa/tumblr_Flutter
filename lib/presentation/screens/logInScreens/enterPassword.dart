// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_const_constructors, curly_braces_in_flow_control_structures

//import 'package:dicee/date/models/usersEmail.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/password.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';
import 'package:tumbler/logic/functions/isPasswordValid.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';
import 'package:tumbler/presentation/screens/logInScreens/emailLogin1.dart';
import 'package:tumbler/presentation/screens/logInScreens/forgetPassword.dart';


class EnterPassword extends StatefulWidget {
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

class _EnterPasswordState extends State<EnterPassword> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  EmailPasswordSend? _user;
  bool visiableEmail = false;
  bool visiablePassword = false;
  @override
  void initState() {
    _email.text = Sendemail!;
    super.initState();
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formGlobalKey,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(color: Colors.white),
                      FlatButton(
                        onPressed: () async {
                          if (_formGlobalKey.currentState!.validate()) {
                            _formGlobalKey.currentState!.save();
                            final String result =
                                await checkSignInUser(_email.text, _pass.text);
                            if (result == "LogIn Successfully (<:>)")
                              setState(() {
                                signIn = true;
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    HomeScreen.routeName,
                                    (Route<dynamic> route) => false);
                              });
                            else if (result == "Email Is Not Found (<:>)") {
                              setState(() {
                                visiableEmail = true;
                                visiablePassword = false;
                              });
                            } else if (result == "InCorrect Password (<:>)") {
                              setState(() {
                                visiableEmail = false;
                                visiablePassword = true;
                              });
                            }
                            //Navigate to home screen.
                          }
                        },
                        child: Text('Log in',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .1,
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
                    visible: visiableEmail,
                    child: Text(
                      "Email not found",
                      style: TextStyle(color: Colors.red),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
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
                    validator: isPasswordValid,
                  ),

                  //validator: isPasswordValid,
                ),
                Visibility(
                    visible: visiablePassword,
                    child: Text(
                      "incorrect password ",
                      style: TextStyle(color: Colors.red),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                ),
                RichText(
                  text: TextSpan(
                      text: "Forgot password?\n",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (ForgetPassword())));
                        }),
                ),
              
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
