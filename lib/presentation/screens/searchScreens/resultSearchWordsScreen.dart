// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/widget/expolreMore.dart';
import 'package:tumbler/presentation/widget/topBlogs.dart';

class ResultSearchWordsScreen extends StatefulWidget {
  String img = '';
  String title = '';
  String name = '';
  String textFieldString = '';
  ResultSearchWordsScreen(
      {Key? key,
      required this.textFieldString,
      required this.img,
      required this.name,
      required this.title})
      : super(key: key);

  @override
  _ResultSearchWordsScreenState createState() =>
      _ResultSearchWordsScreenState();
}

class _ResultSearchWordsScreenState extends State<ResultSearchWordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.textFieldString,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('FOLLOW'),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Explore more #' + widget.textFieldString,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  )),
            ),
            ExploreMore(
              textFieldString: widget.textFieldString,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top ' + widget.textFieldString + ' blogs',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
            TopBlogs(),
          ],
        ),
      ),
    );
  }
}
