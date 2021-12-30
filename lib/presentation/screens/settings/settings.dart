// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/settings/FollowersScreen.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
 static const String routeName = "Setting";
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Account",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
        
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Followers",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FollowersScreen()));
              }),
        ],
      ),
    );
  }
}
