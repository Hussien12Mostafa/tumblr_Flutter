// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_final_fields, prefer_const_constructors, use_key_in_widget_constructors

//import 'package:dicee/date/models/usersEmail.dart';

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/emailLogIn.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';
import 'package:tumbler/presentation/screens/logInScreens/emailLogin1.dart';
import 'package:tumbler/presentation/screens/logInScreens/wordForgetPassword.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

class _EnterPasswordState extends State<ForgetPassword> {
  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();
  AutoLoginModel? _user;

  @override
  void initState() {
    _email.text = Sendemail!;
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
                    if (isEmailValid(_email.text) == null) {
                       await forgotPass(_email.text);
                      
                        
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => wordForgetPassword()));
                        
                      
                    }
                  },
                  child: Text('Submit',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                )
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Forgot your password? it happens\n",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 15),
                  ),
                  TextSpan(
                    text: "We'll send you a link to reset it\n",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 15),
                  ),
                ]),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
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
             
            ]),
          ),
        ),
      ),
    );
  }
}
