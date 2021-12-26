// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, unused_field, prefer_final_fields

import 'dart:convert';
import 'dart:developer';

import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/logic/functions/checkIsDisablePost.dart';

class CreatePost extends StatefulWidget {
  CreatePost({Key? key}) : super(key: key);
  static const String routeName = "CreatePost";
  Blog userInfo = userBlodId;
  @override
  _CreatePost createState() => _CreatePost();
}

class _CreatePost extends State<CreatePost> {
  bool isdisaled = true;

  String txt = '';

  Uint8List base64Decode(String source) => base64.decode(source);

  List<String> getbase64ofimg(List<String> txt) {
    List<String> listofimgsbase64 = [];

    String txt2;
    for (final e in txt) {
      txt2 = '';
      if (e.contains("<img")) {
        const start = "base64,";
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
      if (e.contains("<video")) {
        const start = "base64,";
        const end = "data-filename";
        final startIndex = e.indexOf(start);
        final endIndex = e.indexOf(end, startIndex + start.length);
        txt2 = e.substring(startIndex + start.length, endIndex);
        txt2 = txt2.replaceAll('"', "");
        txt2 = txt2.substring(0, txt2.length - 1);
        listofvideosbase64.add(txt2);

        // log("\n```````````````````````````````````````````````````````````````````````````````````````````````````");

      }
    }
    return listofvideosbase64;
  }

  List<String> getbase64ofaudio(List<String> txt) {
    List<String> listofaudiosbase64 = [];

    String txt2;
    for (final e in txt) {
      txt2 = '';
      if (e.contains("<audio")) {
        const start = "base64,";
        const end = "data-filename";
        final startIndex = e.indexOf(start);
        final endIndex = e.indexOf(end, startIndex + start.length);
        txt2 = e.substring(startIndex + start.length, endIndex);
        txt2 = txt2.replaceAll('"', "");
        txt2 = txt2.substring(0, txt2.length - 1);
        listofaudiosbase64.add(txt2);

        // log("\n```````````````````````````````````````````````````````````````````````````````````````````````````");

      }
    }
    return listofaudiosbase64;
  }

  String inserturlsintohtml(
      String html,
      List<String> imgsurls,
      List<String> videosurls,
      List<String> audiosurls,
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
    // for (var e in splitedfinal2) {
    //   log(e);
    //   log('\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    // }
    for (var e in splitedfinal2) {
      finalhtml2 = finalhtml2 + e + '>';
    }

    return finalhtml2.substring(0, finalhtml2.length - 1);
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
                      List<String> splithtml = txt.split("<");

                      log("*********************************************************************");
                      log(inserturlsintohtml(
                          txt,
                          [
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                            'https://i.pinimg.com/originals/a7/3d/6e/a73d6e4ac85c6a822841e449b24c78e1.jpg'
                          ],
                          [
                            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
                          ],
                          [
                            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3"
                          ],
                          getbase64ofimg(splithtml),
                          getbase64ofvideo(splithtml),
                          getbase64ofaudio(splithtml)));
                          //send post to backend
                          //popscreen
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
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 30))
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
                      backgroundImage: NetworkImage(widget.userInfo.avatar!=null?widget.userInfo.avatar as String:"https://www.bing.com/images/search?view=detailV2&ccid=PE6Gywnh&id=C44A4DED5828D540F9DF40993F5000232337DBD0&thid=OIP.PE6Gywnh99762kleGcaCygHaEo&mediaurl=https%3a%2f%2fhddesktopwallpapers.in%2fwp-content%2fuploads%2f2015%2f09%2fperfect-background-680x425.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.3c4e86cb09e1f7defada495e19c682ca%3frik%3d0Ns3IyMAUD%252bZQA%26pid%3dImgRaw%26r%3d0%26sres%3d1%26sresct%3d1%26srh%3d800%26srw%3d1280&exph=425&expw=680&q=background&simid=608028306860299676&FORM=IRPRST&ck=6F6896CB6C9D6EE7946485C19B072384&selectedIndex=3&ajaxhist=0&ajaxserp=0")),
                ),
                Text(widget.userInfo.title!=null?widget.userInfo.title as String:"error data")
              ],
            ),
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
