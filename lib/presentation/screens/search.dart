// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/searchScreens/autoCompleteScreen.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.height * 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(.9),
              child: ElevatedButton(
                child: Text('           Search Tumbler            ',
                    style: TextStyle(color: Colors.grey[600])),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.white,
                ),
                onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AutoCompleteScreen()));
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .123,
              left: MediaQuery.of(context).size.height * .11,
              child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ]),
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.height * 1,
            color: Colors.blue[900],
          ),
        ]),
      ),
    );
  }
}
