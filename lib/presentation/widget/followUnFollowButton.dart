// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';

class FollowUnFollow extends StatefulWidget {
  FollowUnFollow({Key? key}) : super(key: key);
  String? x = 'Unfollow';
  @override
  _FollowUnFollowState createState() => _FollowUnFollowState();
}

class _FollowUnFollowState extends State<FollowUnFollow> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
      onPressed: () {
        if (widget.x == 'Follow')
          widget.x = 'Unfollow';
        else
          widget.x = 'Follow';
        setState(() {});
      },
      child: Text(widget.x!,style: TextStyle(color: Colors.white),),
    );
  }
}
