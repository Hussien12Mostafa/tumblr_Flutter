// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:html_editor_enhanced/html_editor.dart';

class CheckIsDisabled {
  static bool isdisabledfunction(String? s) {
    bool temp = true;
    if (s == null || s == '') {
      temp = true;
    } else {
      temp = false;
    }
    return temp;
  }
}

class CreatePost extends StatefulWidget {
  CreatePost({Key? key}) : super(key: key);
  static const String routeName = "createPost";
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool isdisaled = true;

  String txt = '';

  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: isdisaled
                  ? null
                  : () async {
                      txt = await controller.getText();
                      print(txt);
                    },
              child: Text(
                'Post',
                style: TextStyle(
                    color: isdisaled ? Colors.grey[600] : Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: isdisaled ? Colors.grey[350] : Colors.blue),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/p1.png')),
                ),
                Text('hg768')
              ],
            ),
            HtmlEditor(
              controller: controller, //required
              //other options
              callbacks: Callbacks(onChangeContent: (String? s) {
                isdisaled = CheckIsDisabled.isdisabledfunction(s);
                setState(() {});
              }),
              htmlEditorOptions: HtmlEditorOptions(
                hint: "Add something if you'd like ",
                shouldEnsureVisible: true,
              ),
              otherOptions: OtherOptions(
                  height: MediaQuery.of(context).size.height * .75),
              htmlToolbarOptions: HtmlToolbarOptions(
                toolbarPosition: ToolbarPosition.belowEditor,
                defaultToolbarButtons: [
                  StyleButtons(),
                  FontSettingButtons(),
                  FontButtons(
                      clearAll: false,
                      strikethrough: false,
                      subscript: false,
                      superscript: false),
                  ColorButtons(),
                  ListButtons(listStyles: false),
                  ParagraphButtons(textDirection: false),
                  InsertButtons(hr: false, table: false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
