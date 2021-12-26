// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';
// import 'package:tumbler/date/datafake/userInfo.dart';

// class Tumblr extends StatelessWidget {
//   final i;
//   const Tumblr({
//     Key? key,
//     required this.i
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           CircleAvatar(
//             radius: 20,
//             backgroundImage: NetworkImage(onlineUsers[i].imageUrl),
//           ),
//           Padding(
//             padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
//             child: Text(onlineUsers[i].name),
//           ),
//         ],
//       ),
//     );
//   }
// }
