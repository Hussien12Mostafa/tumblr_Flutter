// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/usersEmail.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';

class EnterPassword extends StatefulWidget {
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  TextEditingController _email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void initState() {
    _email.text = UserEmails[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                BackButton(
                  color: Colors.blue,
                ),
                FlatButton(
                    onPressed: () {
                      if (_email.text.isNotEmpty & pass.text.isNotEmpty) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            ModalRoute.withName("/Home"));
                      } else {
                        Text('Email or Password not valid');
                      }
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.blue),
                    ))
              ]),
              Container(
                width: 300,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'email',
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'password',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
