// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields

import 'dart:io';

import 'package:addpost/widgets/icon.dart';
import 'package:addpost/widgets/textFieldPost.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
class checkisdisabled{
  static bool isdisabledfunction(String ?s) {
    bool temp = true;
    if (s == null || s == '') {
      temp = true;
    } else {
      temp = false;
    }
    return temp;
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  List<Widget> contentPost = [
    TextFieldPost(),
  ];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isdisaled = true;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  String txt = '';
  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  

  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () {},
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
                style: TextStyle(color: Colors.grey[600]),
              ),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: isdisaled ? Colors.grey[350] : Colors.blue),
            ),
          ),
          IconWidget(icon: Icons.more_vert, size: 30, functionIcon: () {})
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
                      backgroundImage: AssetImage('lib/Assets/images/p1.png')),
                ),
                Text('hg768')
              ],
            ),
            HtmlEditor(
              controller: controller, //required
              //other options
              callbacks: Callbacks(onChangeContent: (String? s) {
                isdisaled =checkisdisabled.isdisabledfunction(s);
                setState(() {});
              }),
              htmlEditorOptions: HtmlEditorOptions(
                hint: "Add something if you'd like ",
                shouldEnsureVisible: true,
                //initialText: "<p>text content initial, if any</p>",
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
                  InsertButtons(
                      hr: false, table: false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
