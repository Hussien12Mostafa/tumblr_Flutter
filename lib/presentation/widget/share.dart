// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:tumbler/presentation/widget/tumblr.dart';

// shareSheet(BuildContext context) {
//   showModalBottomSheet<void>(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25), topRight: Radius.circular(25)),
//     ),
//     isScrollControlled: true,
//     context: context,
//     builder: (BuildContext context) {
//       return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.85,
//         child: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   height: MediaQuery.of(context).size.height * 0.005,
//                   color: Colors.grey[800],
//                 ),
//               ),
//               Tumblr(i: 0,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                 onPressed: () => {},
//                 child: Column( 
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
//                       child: Icon(Icons.copy),
//                     ),
//                     Text("Copy")
//                   ],
//                 ),
//               ),
//                      TextButton(
//                 onPressed: () => {},
//                 child: Column( 
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
//                       child: CircleAvatar(
//                         radius: 12,
//                         backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Facebook_Messenger_logo_2020.svg/2048px-Facebook_Messenger_logo_2020.svg.png'),
//                       ),
//                     ),
//                     Text("Chats")
//                   ],
//                 ),
//               ),
//                      TextButton(
//                 onPressed: () => {},
//                 child: Column( 
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
//                       child: CachedNetworkImage(
//                 imageUrl: 'https://cdn-icons-png.flaticon.com/512/124/124021.png',
//                 progressIndicatorBuilder: (context, url, downloadProgress) =>
//                     CircularProgressIndicator(value: downloadProgress.progress),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//                 height: 24,
//                 width: 24,
//               ),
//                     ),
//                     Text("Direct Message")
//                   ],
//                 ),
//               ),
//                      TextButton(
//                 onPressed: () => {},
//                 child: Column( 
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
//                       child: Icon(Icons.share),
//                     ),
//                     Text("Other")
//                   ],
//                 ),
//               ),
//                 ],
//               ),
//               ElevatedButton(
//                 child: const Text('Close BottomSheet'),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

