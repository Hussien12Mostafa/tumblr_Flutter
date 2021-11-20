// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/likesAndReblog.dart';
import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/presentation/widget/networkImage.dart';
import 'package:tumbler/presentation/widget/showNameUser.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class LikesPost extends StatelessWidget {
  static const String routeName = "LikesPost";
  LikesPost({Key? key}) : super(key: key);
  
  int numOfNotes = postsData[0].numOfLikes+postsData[0].numOfReblog;
  
  @override
  Widget build(BuildContext context) {
    Post p = ModalRoute.of(context)!.settings.arguments as Post;
    List<LikesAndReblog> likesAndReblogList = toListLike(p.likesThisPost);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$numOfNotes notes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
          // controller: _scrollController,
          //itemExtent: 20,
          itemCount:likesAndReblogList.length,
          itemBuilder: (context, index) {
            return TextButton(
                onPressed: () {},
                child: Stack(
                  children: [
                    Row(
                      children: [
                        GetNetworkImage(imageUrl: likesAndReblogList[index].s.imageUrl),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03),
                            child: ShowNameUser(name: likesAndReblogList[index].s.name),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .065,
                      left: MediaQuery.of(context).size.width * .08,
                      child: CircleAvatar(
                        backgroundColor: likesAndReblogList[index].likeOrReblog == 'like'
                            ? Colors.red
                            : Colors.green,
                        radius: 10,
                        child: Icon(
                          likesAndReblogList[index].likeOrReblog == 'like'
                              ? FontAwesome5.heart
                              : FontAwesome5.share,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ));
          }),
    );
  }
}
