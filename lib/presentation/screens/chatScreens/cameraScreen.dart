import 'dart:async';

import 'package:flutter/material.dart';


/*
List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameravalue;
  @override
  void initState() {

    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameravalue = _cameraController?.initialize();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
          future: cameravalue
          ,builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              return CameraPreview(_cameraController!);
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            };
          }),

          Positioned(
            top: 2,
            right: 0.5,
            child: Center(
              child: IconButton(onPressed: (){}, icon: Icon(Icons.flash_off),
                color: Colors.white,
              iconSize: 28,
              ),

            ),
          ),

          Positioned(
            right: 0.5,
            child: Center(
              child: IconButton(onPressed: (){}, icon: Icon(Icons.flip_camera_android),
                color: Colors.white,iconSize: 28,),
            ),
          ),

        Positioned(
          bottom: 0.5,
          child: Center(
            child: IconButton(onPressed: (){}, icon: Icon(Icons.panorama_fish_eye),
            color: Colors.white,iconSize: 70,),
          ),
        ),
        ],
      ),
    );
  }
}
*/