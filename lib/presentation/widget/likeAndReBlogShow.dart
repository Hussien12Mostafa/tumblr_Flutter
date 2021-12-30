// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/notes.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/widget/showNameUser.dart';

import 'networkImage.dart';

class LikeAndReBlogShow extends StatefulWidget {
  LikeAndReBlogShow({Key? key, required this.note}) : super(key: key);
  Note note;

  @override
  State<LikeAndReBlogShow> createState() => _LikeAndReBlogShowState();
}

class _LikeAndReBlogShowState extends State<LikeAndReBlogShow> {
  Blog? blogg;
  bool load = false;
  _getBlog() async {
    Map<String, dynamic> bb = await getBlog(widget.note.blogId!) as Map<String, dynamic>;

    Map<String, dynamic>? b1 = bb["res"]["data"];

    if (b1 != null && b1 != '') {
      blogg = Blog.fromJson(b1);
      print(blogg!.avatar);
      setState(() {
        load = true;
      });
    }
  }

  @override
  void initState() {
    _getBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !load?Container():TextButton(
        onPressed: () {},
        child: Stack(
          children: [
            Row(
              children: [
                GetNetworkImage(
                    imageUrl: (blogg!.avatar!) != null
                            ? blogg!.avatar! != "default"
                                ? blogg!.avatar! as String
                                : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"
                            : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .03),
                    child: ShowNameUser(
                      name: blogg!.title != null
                          ? blogg!.title as String
                          : "error",
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .065,
              left: MediaQuery.of(context).size.width * .08,
              child: CircleAvatar(
                backgroundColor:
                    //   likesAndReblogList[index].likeOrReblog == 'like'?
                    Colors.red,
                //   : Colors.green,
                radius: 10,
                child: Icon(
                    widget.note.noteType == 'like'?
                  FontAwesome5.heart:
                      FontAwesome5.share,
                  color: Colors.white,
                  
                  size: 15,
                ),
              ),
            ),
          ],
        ));
  }
}
