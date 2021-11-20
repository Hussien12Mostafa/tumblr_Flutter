// ignore_for_file: deprecated_member_use, non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';
import 'package:tumbler/presentation/screens/logInScreens/whatShouldWeCall.dart';

class Age extends StatefulWidget {


  @override
  _AgeState createState() => _AgeState();
}


class _AgeState extends State<Age> {
  var _onPressed;
  TextEditingController _Age = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(child: Center(



        child: Column(
          children: [

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children : [
            BackButton(

              color: Colors.red,
            ),

            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _Age,
              builder: (context, value, child) {
                return FlatButton(
                  onPressed: value.text.isNotEmpty ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } : null,
                  child: Text('Next',style: TextStyle(color: Colors.white),),
                );
              },
            ),
        ]
           ),







        

            Container(
              width: 500,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              child: TextField(
                controller: _Age,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter your age',

                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,],

              ),

            ),
          ],
        ),
      ),),
    );
  }
}