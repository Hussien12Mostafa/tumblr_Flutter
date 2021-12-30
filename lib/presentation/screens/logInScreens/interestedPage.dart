import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';

bool _Positivity = false;
bool? Trending = false;
bool _Library = false;
bool _Writing = false;
bool _Streaming = false;
bool _Television = false;
List<String> Interests = [];
bool _Sports = false;
int _picked = 5;

class InterestedPage extends StatefulWidget {
  const InterestedPage({Key? key}) : super(key: key);
  static const String routeName = "Interested";
  @override
  _InterestedPageState createState() => _InterestedPageState();
}

class _InterestedPageState extends State<InterestedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.deepPurple,
          child: CustomScrollView(primary: false, slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //BackButton(),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "What do you like?\n",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        TextSpan(
                          text: "Whatever you're into, you'll find here.\n",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ])),

                      TextButton(
                        onPressed: () async {
                          if (_picked <= 0) {
                            interestedUser = Interests;
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName,
                                (Route<dynamic> route) => false);
                          }
                        },
                        child: Text("Pick ${_picked}"),
                      )
                    ],
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Trending = !Trending!;
                          if (Trending == true) {
                            if (_picked != 0) {
                              _picked--;
                            }
                            Interests.add("Trending");
                          } else {
                            _picked++;
                            Interests.remove("Trending");
                          }
                        });
                      },
                      icon: Visibility(
                        child: Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        visible: Trending!,
                      ),
                      label: Text(
                        "Trending",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _Library = !_Library;
                          if (_Library == true) {
                            if (_picked != 0) {
                              _picked--;
                            }
                            Interests.add("Library");
                          } else {
                            _picked++;
                            Interests.remove("Library");
                          }
                        });
                      },
                      icon: Visibility(
                        child: Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        visible: _Library,
                      ),
                      label: Text(
                        "Library",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.brown),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _Writing = !_Writing;
                          if (_Writing == true) {
                            _picked--;
                            Interests.add("Writing");
                          } else {
                            _picked++;
                            Interests.remove("Writing");
                          }
                        });
                      },
                      icon: Visibility(
                        child: Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        visible: _Writing,
                      ),
                      label: Text("Writing"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purpleAccent),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _Streaming = !_Streaming;
                          if (_Streaming == true) {
                            _picked--;
                            Interests.add("Streaming");
                          } else {
                            _picked++;
                            Interests.remove("Streaming");
                          }
                        });
                      },
                      icon: Visibility(
                        child: Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        visible: _Streaming,
                      ),
                      label: Text(
                        "Streaming",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _Positivity = !_Positivity;
                          if (_Positivity == true) {
                            if (_picked != 0) {
                              _picked--;
                            }
                            Interests.add("Positivity");
                          } else {
                            _picked++;
                            Interests.remove("Positivity");
                          }
                        });
                      },
                      icon: Visibility(
                        child: Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        visible: _Positivity,
                      ),
                      label: Text(
                        "Positivty",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellowAccent),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _Sports = !_Sports;
                          if (_Sports == true) {
                            if (_picked != 0) {
                              _picked--;
                            }
                            Interests.add("Sports");
                          } else {
                            _picked++;
                            Interests.remove("Sports");
                          }
                        });
                      },
                      icon: Visibility(
                        child: Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        visible: _Sports,
                      ),
                      label: Text("Sports"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _Television = !_Television;
                          if (_Television == true) {
                            if (_picked != 0) {
                              _picked--;
                            }
                            Interests.add("Television");
                          } else {
                            _picked++;
                            Interests.remove("Television");
                          }
                        });
                      },
                      icon: Visibility(
                        child: Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        visible: _Television,
                      ),
                      label: Text(
                        "Television",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
