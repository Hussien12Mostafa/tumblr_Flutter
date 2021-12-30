// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields, curly_braces_in_flow_control_structures, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/searchScreens/BlogScreen.dart';
import 'package:tumbler/presentation/screens/searchScreens/resultSearchWordsScreen.dart';
import 'package:tumbler/presentation/widget/followButtonForBlog.dart';

class AutoCompleteScreen extends StatefulWidget {
  const AutoCompleteScreen({Key? key}) : super(key: key);

  @override
  _AutoCompleteScreenState createState() => _AutoCompleteScreenState();
}

class _AutoCompleteScreenState extends State<AutoCompleteScreen> {
  TextEditingController textsearch = TextEditingController();
  Map<String, dynamic>? l;
  List<dynamic>? resultHashTag;
  List<dynamic>? resultPostHashTag;
  List<dynamic>? resultBlogs;
  List<Blog> resBlogs = [];
  List<Post> resPosts = [];
  bool load = false;

  _autoCompleteSearch() async {
    l = await autoCompleteSearch(textsearch.text) as Map<String, dynamic>;

    if (l != null) {
      resultHashTag = l!["resultHashTag"];

      resultPostHashTag = l!["resultPostHashTag"];

      resultBlogs = l!["resultBlogs"];

      for (var i = 0; i < resultBlogs!.length; i++) {
        resBlogs.add(Blog.fromJson(resultBlogs![i]));
      }

      for (var i = 0; i < resultPostHashTag!.length; i++) {
        resPosts.add(Post.fromJson(resultPostHashTag![i]));
      }

   
      setState(() {
        load = true;
      });
    }
  }

  _completeSearchForChoose(String input) async {
    l = await autoCompleteSearch(input) as Map<String, dynamic>;

    if (l != null) {
      resultHashTag = l!["resultHashTag"];

      resultPostHashTag = l!["resultPostHashTag"];

      resultBlogs = l!["resultBlogs"];

      for (var i = 0; i < resultBlogs!.length; i++) {
        resBlogs.add(Blog.fromJson(resultBlogs![i]));
      }

      for (var i = 0; i < resultPostHashTag!.length; i++) {
        resPosts.add(Post.fromJson(resultPostHashTag![i]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Row(
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * .05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.height * .3,
                child: TextField(
                  controller: textsearch,
                  onSubmitted: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultSearchWordsScreen(
                          posts: resPosts,
                          resBlogs: resBlogs,
                          searchString: value,
                        ),
                      ),
                    );
                  },
                  onChanged: (value) {
                    resBlogs = [];
                    resPosts = [];
                    setState(() {
                      print("in setstate");
                      if (value != "") _autoCompleteSearch();
                    });
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Search in Tumbler',
                  ),
                ),
              )
            ],
          ),
          if (textsearch.text != "" && load && resultHashTag!.length != 0)
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount:
                    resultHashTag!.length < 3 ? resultHashTag!.length : 3,
                separatorBuilder: (_, __) => Divider(height: 0.5),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: Text(
                        resultHashTag![index],
                        textScaleFactor: 1,
                      ),
                      onTap: () async {
                        //backend
                       await  _completeSearchForChoose(resultHashTag![index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultSearchWordsScreen(
                              posts: resPosts,
                              resBlogs: resBlogs,
                              searchString: resultHashTag![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          if (textsearch.text != "" && load && resBlogs.length != 0)
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: resBlogs.length < 5 ? resBlogs.length : 5,
                separatorBuilder: (_, __) => Divider(height: 0.5),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                      leading: Image.network((resBlogs[index].avatar) != null
                          ? (resBlogs[index].avatar) == 'default'
                              ? 'https://icon-library.com/images/facebook-user-icon/facebook-user-icon-17.jpg'
                              : resBlogs[index].avatar!
                          : 'https://icon-library.com/images/facebook-user-icon/facebook-user-icon-17.jpg'),
                      title: Text(
                        resBlogs[index].name,
                        textScaleFactor: 1,
                      ),
                      subtitle: Text(
                        resBlogs[index].title == null
                            ? 'NO TITLE'
                            : resBlogs[index].title!,
                        textScaleFactor: 1,
                      ),
                      trailing:FollowButtonForBlog(b: resBlogs[index],)
                       
                      ,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogScreen(
                                      blog: resBlogs[index],
                                    )));
                      },
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
