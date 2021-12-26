// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields, curly_braces_in_flow_control_structures



import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/searchScreens/BlogScreen.dart';
import 'package:tumbler/presentation/screens/searchScreens/resultSearchWordsScreen.dart';

List<String> result1 = [
  "deposit",
  'hhhhhhhhhhhhhh',
  "Wooden",
  "Handmade",
  'knlkn',
  'kkkkkkkkk',
  'mmmmmmmmmmmmmmmmmm',
  'kohi',
  'khjhiu',
  ';kjk',
  'knjh',
  'jkbkkh'
];

class AutoCompleteScreen extends StatefulWidget {
  const AutoCompleteScreen({Key? key}) : super(key: key);

  @override
  _AutoCompleteScreenState createState() => _AutoCompleteScreenState();
}

class _AutoCompleteScreenState extends State<AutoCompleteScreen> {
  TextEditingController textsearch = TextEditingController();
  Map<String, dynamic>? l;
  List<String>? resultHashTag;
  List<Map<String, dynamic>>? resultPostHashTag;
  List<Map<String, dynamic>>? resultBlogs;
  late List<Blog> resBlogs;
  late List<Post> resPosts;
  bool load = false;
  List<String>? postsIds;
  _autoCompleteSearch() async {
    l = await autoCompleteSearch(textsearch.text) as Map<String, dynamic>;

    if (l != null) {
      resultHashTag = l!["resultHashTag"];
      print(resultHashTag!);
      resultPostHashTag = l!["resultPostHashTag"];
      resultBlogs = l!["resultBlogs"];
      postsIds = l!["postsIds"];
      setState(() {
        load = true;
      });
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
                  onChanged: (value) {
                    setState(() {
                      print("in setstate");
                      _autoCompleteSearch();
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
          if (textsearch.text != "" && load)
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (_, __) => Divider(height: 0.5),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: Text(
                        result1[index],
                        textScaleFactor: 1,
                      ),
                      onTap: () {
                        //backend

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultSearchWordsScreen(
                                    textFieldString: resultHashTag![index],
                                    img: resultBlogs![index]["avatar"],
                                    name: resultBlogs![index]['name'],
                                    title: resultBlogs![index]['title'])));
                      },
                    ),
                  );
                },
              ),
            ),
          if (textsearch.text != "" && load)
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (_, __) => Divider(height: 0.5),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                      leading: Image.network(l1[index]['img']),
                      title: Text(
                        l1[index]['title'],
                        textScaleFactor: 1,
                      ),
                      subtitle: Text(
                        l1[index]['name'],
                        textScaleFactor: 1,
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: Text('FOLLOW'),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogScreen(
                                    img: l1[index]['img'],
                                    name: l1[index]['name'],
                                    title: l1[index]['title'])));
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
