// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/usersEmail.dart';
import 'package:tumbler/presentation/screens/logInScreens/enterPassword.dart';

bool DoesMailExist(String mail) {
  for (int i = 0; i < UserEmails.length; i++)
    if (mail == UserEmails[i]) {
      return true;
    }
  return false;
}

class LoginEmail extends StatefulWidget {
  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  TextEditingController _email = TextEditingController();
  bool Continue = true;
  bool wrongEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Text(
              't',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Raleway', fontSize: 200),
            ),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            if (Continue)
              Container(
                width: 300,
                height: 50,
                color: Colors.blue,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      print("This is the email --->" + _email.text);
                      if (DoesMailExist(_email.text)) {
                        print("Name was found!");
                        Continue = false;
                        wrongEmail = false;
                      } else {
                        wrongEmail = true;
                      }
                    });
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ),
              )
            else ...[
              Container(
                width: 300,
                height: 50,
                color: Colors.blue,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Send Magic Link',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                color: Colors.grey,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterPassword()));
                    });
                  },
                  child: Text(
                    'Enter password',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
            if (wrongEmail) ...[
              Text(
                'That email doesn' + "'" + "t have a Tumblr",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
              Text(
                'account. Sign up now?',
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ]
          ]),
        ),
      ),
    );
  }
}
