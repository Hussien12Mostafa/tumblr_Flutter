// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tumbler/date/models/user.dart';
import 'package:like_button/like_button.dart';
import 'package:tumbler/presentation/widget/notes.dart';
import 'package:tumbler/presentation/widget/share.dart';

class ShowPost extends StatelessWidget {
  User post;

  ShowPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: post.imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width * .1,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .03),
                  child: Text(
                    post.name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.more_horiz,
                  color: IconTheme.of(context).color,
                ),
              )
            ],
          ),
        ),
        Html(
            data:
                """post text <span style="color:red;">is here</span> <br> <img src="https://www.vbetnews.com/wp-content/uploads/2020/08/P2020-08-25-Salsburg_Liverpool-83.jpg.jpg" /> 
"""),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .03),
              child: FloatingActionButton(
                onPressed: () async {
                  await Navigator.of(context).pushNamed(Notes.routeName);
                },
                child: Text(
                  '10 notes',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .29),
              child: FloatingActionButton(
                onPressed: () {
                  shareSheet(context);
                },
                child: Icon(
                  Icons.share,
                  color: IconTheme.of(context).color,
                ),
              ),
            ),
            FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.chat,
                  color: IconTheme.of(context).color,
                )),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.ac_unit_sharp,
                color: IconTheme.of(context).color,
              ),
            ),
            LikeButton(),
          ],
        )
      ],
    );
  }
}
