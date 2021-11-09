// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tumbler/date/models/user.dart';
import 'package:like_button/like_button.dart';

class ShowPost extends StatelessWidget {
  User post;

  ShowPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .06,
          ),
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
        Container(
          height: 100,
          color: Colors.red,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .03),
              child: FloatingActionButton(
                onPressed: () {},
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
                onPressed: () {},
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
            LikeButton(
              
            ),
          ],
        )
      ],
    );
  }
}
