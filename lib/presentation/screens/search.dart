// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/searchScreens/autoCompleteScreen.dart';
import 'package:tumbler/presentation/widget/tagsYouFollowScreen.dart';


List<dynamic> str = [];

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> b1 = [];
  List<dynamic> b2 = [];
  bool load = true;
  @override
  void initState() {
    _getDashBoard();
    super.initState();
  }

  _getDashBoard() async {
    Map<String, dynamic>? l =
        await autoCompleteSearchForMainScreen() as Map<String, dynamic>;
    print("--------------------------------------------------------------");

    if (l != null) {
      b1 = l["resultFollowedTag"];
      b2 = l["resultPostHashTag"];
      print(b1);
      setState(() {
        load = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !load
        ? CircularProgressIndicator()
        : Scaffold(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AutoCompleteScreen()));
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '#Tags you follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: b1.length,
                          separatorBuilder: (_, __) => Divider(height: 0.5),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TagsYouFollow(
                                      tagfollowed: b1[index],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  color: colors[index],
                                  child: Center(
                                    child: Text(
                                      '#' + b1[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
  }
}
