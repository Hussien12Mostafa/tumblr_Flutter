import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/presentation/screens/searchScreens/BlogScreen.dart';


class TopBlogs extends StatefulWidget {
  List<Blog> resBlogs;
  TopBlogs({Key? key, required this.resBlogs}) : super(key: key);

  @override
  _TopBlogsState createState() => _TopBlogsState();
}

class _TopBlogsState extends State<TopBlogs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Colors.blue,
        height: 400,
        child: Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => Divider(height: 0.5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.resBlogs.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlogScreen(blog:  widget.resBlogs[index],
                            )));
              },
              child: Container(
                width: 250,
                // color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    children: [
                      Container(
                        color: colors[index%colors.length],
                      ),
                      Image.network(
                        (widget.resBlogs[index].background) != null
                            ? (widget.resBlogs[index].background) == 'default'
                                ? 'https://besthqwallpapers.com/Uploads/14-12-2019/115889/thumb2-legend-4k-wallpapers-with-names-horizontal-text-legend-name.jpg'
                                : widget.resBlogs[index].background!
                            : 'https://besthqwallpapers.com/Uploads/14-12-2019/115889/thumb2-legend-4k-wallpapers-with-names-horizontal-text-legend-name.jpg',
                        // width: 400,
                        // height: 300,
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage((widget
                                      .resBlogs[index].avatar) !=
                                  null
                              ? (widget.resBlogs[index].avatar) == 'default'
                                  ? 'https://icon-library.com/images/facebook-user-icon/facebook-user-icon-17.jpg'
                                  : widget.resBlogs[index].avatar!
                              : 'https://icon-library.com/images/facebook-user-icon/facebook-user-icon-17.jpg'),
                          radius: 50,
                        ),
                        top: 110,
                        left: 75,
                      ),
                      Positioned(
                          top: 220,
                          left: 120,
                          child: Text(widget.resBlogs[index].description == null ||
                          widget.resBlogs[index].description == ""
                              ? 'No Description'
                              : widget.resBlogs[index].description!)),
                      // Positioned(
                      //     top: 240, left: 120, child: Text(l1[index]['name'])),
                      Positioned(
                        top: 260,
                        left: 3,
                        child: SizedBox(
                          width: 240,
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
                      // Positioned(
                      //     top: 310,
                      //     left: 10,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(2.0),
                      //       child: Row(
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.all(2.0),
                      //             child: Image.network(
                      //               l1[index]['img'],
                      //               width: 70,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(2.0),
                      //             child: Image.network(
                      //               l1[index]['img'],
                      //               width: 70,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(2.0),
                      //             child: Image.network(
                      //               l1[index]['img'],
                      //               width: 70,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
