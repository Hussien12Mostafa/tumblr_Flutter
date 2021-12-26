// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';

import 'package:tumbler/presentation/widget/networkImage.dart';
import 'package:tumbler/presentation/widget/showNameUser.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

/// class for design screen likes
class LikesPost extends StatefulWidget {
  static const String routeName = "LikesPost";
  LikesPost({Key? key}) : super(key: key);

  @override
  State<LikesPost> createState() => _LikesPostState();
}

class _LikesPostState extends State<LikesPost> {
  /// function widget to design screen and print users like this post
  @override
  Widget build(BuildContext context) {
    bool load = true;
    Blog? blogg;
    List<dynamic> l =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    List<String> likesUsers = l[0];
    List<Map<String, dynamic>> commentsPost = l[1];
    List<Map<String, dynamic>> reBlogPost = l[2];
    List<int> counts = l[3];
    _getBlod(String likesUsers) async {
      Blog? b = getBlog(likesUsers) as Blog;
      if (b != null) {
        setState(() {
          blogg = b;
          load = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${counts[2]} notes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
          // controller: _scrollController,
          //itemExtent: 20,
          itemCount: likesUsers.length,
          itemBuilder: (context, index) {
            return load
                ? Center(child: CircularProgressIndicator())
                : TextButton(
                    onPressed: () {},
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            GetNetworkImage(imageUrl:blogg!.avatar!=null? blogg!.avatar as String:"https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        .03),
                                child: ShowNameUser(
                                  name: blogg!.title!=null?blogg!.title as String :"error",
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
                              //  likesAndReblogList[index].likeOrReblog == 'like'?
                              FontAwesome5.heart,
                              //   : FontAwesome5.share,
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
