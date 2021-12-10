// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_const_constructors

//import 'package:dicee/date/models/usersEmail.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tumbler/date/models/password.dart';
import 'package:tumbler/date/models/userSignUp.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';
import 'package:tumbler/logic/functions/isPasswordValid.dart';
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

  @override
  void initState() {
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
                            final bool? user =
                                await checkSignInUser(_email.text, _pass.text);
                            setState(() {
                              _user = EmailPasswordSend(
                                  email: "dshgsdfhsdfh",
                                  password: "dfhdfhdh",
                                  id: "5",
                                  createdAt: DateTime.now());
                            });

                            //  Navigator.push(context,
                            //    MaterialPageRoute(builder: (context) => Homescreen())); //Navigate to home screen.
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
                _user == null
                    ? Container()
                    : Text(
                        "Info: Email ${_user!.email}  Password: ${_user!.password}  is created sucessfully ${_user!.createdAt.toIso8601String()}",
                        style: TextStyle(color: Colors.black),
                      )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
