// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/presentation/widget/post.dart';

import 'package:tumbler/presentation/widget/topBlogs.dart';

class ResultSearchWordsScreen extends StatefulWidget {
  List<Blog> resBlogs;
  String searchString;
  List<Post> posts;
  ResultSearchWordsScreen(
      {Key? key, required this.resBlogs, required this.searchString,required this.posts})
      : super(key: key);

  @override
  _ResultSearchWordsScreenState createState() =>
      _ResultSearchWordsScreenState();
}

class _ResultSearchWordsScreenState extends State<ResultSearchWordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: 
         AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.searchString,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
       
        ),
      
      body: 
      
            SingleChildScrollView(
              child: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Top ' + widget.searchString + ' blogs',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ),
                   TopBlogs(resBlogs: widget.resBlogs),
                   ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(),
                        itemCount:widget.posts.length,
                        itemBuilder: (context, index) {
                          
                          return ShowPost(post: widget.posts[index]);
                        }),
                  
                
                  
                ],
              ),
            ),
        
      
    );
  }
}
