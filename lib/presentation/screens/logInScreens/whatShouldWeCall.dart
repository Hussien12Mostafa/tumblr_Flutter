// ignore_for_file: annotate_overrides, deprecated_member_use, avoid_print, non_constant_identifier_names, curly_braces_in_flow_control_structures, file_names, prefer_const_constructors

import 'package:flutter/material.dart';



bool EmailNotEmpty(String email){
  if(email != ''){
    print("Passed the email");
    return true;
  }
  else return false;
}

bool PasswordNotEmpty(String pass){
  if(pass != ''){
    print("passed the Passwor");
    return true;
  }
  else return false;
}
bool NameNotEmpty(String name){
  if(name != ''){
    print("Passed the name");
    return true;
  }
  else return false;
}



class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _name = TextEditingController();
 var _onPressed;

 bool EmailBoxFilled = false;
 bool passfilled = false;
 bool namefilled =false;

void initState() {
  super.initState();

  _email = TextEditingController();
  _email.addListener(() {
    EmailBoxFilled=true;
  }
  );
  _pass = TextEditingController();
  _pass.addListener(() {
    passfilled=true;
  }
  );

  _name = TextEditingController();
  _name.addListener(() {
    namefilled=true;
  }
  );

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body:SafeArea(
      child: Center(
        child: Column(
          children: [

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [
                  BackButton(

                    color: Colors.red,
                  ),


                   FlatButton(onPressed: (EmailBoxFilled) ? () {
                       print("We've passed it");
                   } : null, child: Text('Done'),)
                 
                 



                ]
            ),


            Container(
              height: 75,
              width: MediaQuery.of(context).size.width*.5,
              child: Text('What Should We Call You?',style: TextStyle(fontSize: 25,),
              ),
            ),

            Text('you'+"'"+"ll need a name to make"),
            Text("your own posts, customize your"),
            Text("blog, and message people"),


            Container(
              width: 500,
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
              width: 500,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              child: TextField(
                controller: _pass,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Password',

                  ),

              ),
            ),
            Container(
              width: 500,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              child: TextField(
                controller: _name,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'name',

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
