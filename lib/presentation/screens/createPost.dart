// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields, unnecessary_cast

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/logic/functions/checkIsDisablePost.dart';

class CreatePost extends StatefulWidget {
  static const String routeName = "CreatePost";

  CreatePost({
    Key? key,
  }) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool isdisaled = true;

  String txt = '';

  Uint8List base64Decode(String source) => base64.decode(source);

  List<String> getbase64ofimg(List<String> txt) {
    List<String> listofimgsbase64 = [];

    String txt2;
    for (final e in txt) {
      txt2 = '';
      if (e.contains("img")) {
        const start = "src=";
        const end = "data-filename";
        final startIndex = e.indexOf(start);
        final endIndex = e.indexOf(end, startIndex + start.length);
        txt2 = e.substring(startIndex + start.length, endIndex);
        txt2 = txt2.replaceAll('"', "");
        txt2 = txt2.substring(0, txt2.length - 1);

        listofimgsbase64.add(txt2);

        // log("\n```````````````````````````````````````````````````````````````````````````````````````````````````");

      }
    }

    return listofimgsbase64;
  }

  List<String> getbase64ofvideo(List<String> txt) {
    List<String> listofvideosbase64 = [];

    String txt2;
    for (final e in txt) {
      txt2 = '';
      if (e.contains("video ")) {
        const start = "src=";
        const end = "data-filename";
        final startIndex = e.indexOf(start);
        final endIndex = e.indexOf(end, startIndex + start.length);
        txt2 = e.substring(startIndex + start.length, endIndex);
        txt2 = txt2.replaceAll('"', "");
        txt2 = txt2.substring(0, txt2.length - 1);
        listofvideosbase64.add(txt2);

        // log("\n```````````````");

      }
    }
    return listofvideosbase64;
  }
List<String> getbase64ofaudio(List<String> txt) {
    List<String> listofaudiosbase64 = [];

    String txt2;
    for (final e in txt) {
      txt2 = '';
      if (e.contains("audio ")) {
        print('inside if');
        const start = "src=";
        const end = "data-filename";
        final startIndex = e.indexOf(start);
        final endIndex = e.indexOf(end, startIndex + start.length);
        txt2 = e.substring(startIndex + start.length, endIndex);
        txt2 = txt2.replaceAll('"', "");
        txt2 = txt2.substring(0, txt2.length - 1);
        listofaudiosbase64.add(txt2);

        // log("\n```````````````");

      }
    }
    return listofaudiosbase64;
  }
String inserturlsintohtml(
      String html,
      List<dynamic> imgsurls,
      List<dynamic> videosurls,
      List<dynamic> audiosurls,
      List<String> base64ofimgs,
      List<String> base64ofvideos,
      List<String> base64ofaudios) {
    String finalhtml = html;
    for (var i = 0; i < base64ofimgs.length; i++) {
      finalhtml = finalhtml.replaceAll(base64ofimgs[i], imgsurls[i]);
    }
    for (var i = 0; i < base64ofaudios.length; i++) {
      finalhtml = finalhtml.replaceAll(base64ofaudios[i], audiosurls[i]);
    }
    for (var i = 0; i < base64ofvideos.length; i++) {
      finalhtml = finalhtml.replaceAll(base64ofvideos[i], videosurls[i]);
    }

    List<String> splitedfinal = finalhtml.split('>');
    List<String> splitedfinal2 = [];
    int imgc = 0;
    int audioc = 0;
    int videoc = 0;
    for (var e in splitedfinal) {
      if (e.contains("<img")) {
        e = e.replaceAll(e, '<img src="' + imgsurls[imgc] + '"');
        splitedfinal2.add(e);
        imgc++;
      } else if (e.contains("<audio")) {
        e = e.replaceAll(
            e, '<audio controls="" src="' + audiosurls[audioc] + '"');
        splitedfinal2.add(e);
        audioc++;
      } else if (e.contains("<video")) {
        e = e.replaceAll(
            e, '<video controls="" src="' + videosurls[videoc] + '"');
        splitedfinal2.add(e);
        videoc++;
      } else
        splitedfinal2.add(e);
    }
    String finalhtml2 = '';
 
    for (var e in splitedfinal2) {
      finalhtml2 = finalhtml2 + e + '>';
    }

    return finalhtml2.substring(0, finalhtml2.length - 1);
  }
  

  HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    List<dynamic> l =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.close,
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
            child: TextButton(
              onPressed: isdisaled
                  ? null
                  : () async {
                      String postHTML = await controller.getText();

                      List<String> splithtml = postHTML.split('<');

                      Map<String, dynamic>? backEndRes;
                      Map<String, dynamic>? backEndResVideo;
                      Map<String, dynamic>? backEndResaudio;
                      List<String> imagesUpload = getbase64ofimg(splithtml);
                      List<String> vidoeUpload = getbase64ofvideo(splithtml);
                      List<String> audioUpload = getbase64ofaudio(splithtml);
                      if (imagesUpload.length != 0) {
                        print(imagesUpload[0]);
                        backEndRes = await uploadImages(imagesUpload);
                      }
                      if (vidoeUpload.length != 0) {
                        print(vidoeUpload[0]);
                        backEndResVideo = await uploadImages(vidoeUpload);
                      }
                      if (audioUpload.length != 0) {
                        print(audioUpload[0]);
                        backEndResaudio= await uploadImages(audioUpload);
                      }
                      List<dynamic> imageUrls=[];
                      List<dynamic> audioUrls=[];
                      List<dynamic> videoUrl=[];
                      if (backEndRes != null) {
                        imageUrls = backEndRes["images"];
                      }
                      if(backEndResVideo != null){
                        videoUrl = backEndResVideo["images"];
                      }
                       if(backEndResaudio != null){
                        audioUrls = backEndResaudio["images"];
                      }
                      postHTML = inserturlsintohtml(postHTML, imageUrls,
                          videoUrl, audioUrls,imagesUpload, vidoeUpload,audioUpload);
                      log(postHTML);
                      
                      if (l[0] == '') {
                        String? res = await createPosts(blogUser!.id, postHTML)
                            as String?;
                        print("create $res");
                      } else if (l[0] == 'edit') {
                        String? res =
                            await editPosts((l[1] as Post).id, postHTML)
                                as String?;
                        print("create $res");
                      } else {
                        String? res = await createPostsWithTag(
                            blogUser!.id, postHTML, l[1]) as String?;
                        print("create $res");
                      }

                      Navigator.of(context).pop();
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
          l[0] == "edit"
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      controller.insertHtml((l[1] as Post).postHtml);
                    });
                  },
                  child: Text(
                    'show your post',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Colors.blue))
              : Container(),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 30,
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
                    backgroundImage: NetworkImage((blogUser!.avatar!) != null
                        ? blogUser!.avatar! != "default"
                            ? blogUser!.avatar! as String
                            : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"
                        : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                  ),
                ),
                Text(blogUser!.title! != null ? (blogUser!.title!) : "defult")
              ],
            ),
            l[0] == "tag"
                ? Text(
                    "Tag :#${l[1]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : Container(),
            HtmlEditor(
              controller: controller, //required
              //other options
              callbacks: Callbacks(onChangeContent: (String? s) {
                isdisaled = isDisAbleFunction(s);
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
