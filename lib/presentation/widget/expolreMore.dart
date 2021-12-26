
import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/presentation/screens/searchScreens/BlogScreen.dart';

class ExploreMore extends StatefulWidget {
  String textFieldString = '';
   ExploreMore({Key? key,required this.textFieldString}) : super(key: key);
  
  @override
  _ExploreMoreState createState() => _ExploreMoreState();
}

class _ExploreMoreState extends State<ExploreMore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (_, __) => Divider(height: 0.5),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlogScreen(
                            img: l1[index]['img'],
                            name: l1[index]['name'],
                            title: l1[index]['title'])));
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  height: 100,
                  color: colors[index],
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '#' + widget.textFieldString,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 25,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.network(
                                l1[index]['img'],
                                width: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.network(
                                l1[index]['img'],
                                width: 70,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 3,
                        child: SizedBox(
                          width: 190,
                          height: 65,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple,
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300)),
                            onPressed: () {},
                            child: Text(
                              'FOLLOW',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
