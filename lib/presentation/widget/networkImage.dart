// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GetNetworkImage extends StatelessWidget {
  GetNetworkImage({Key? key, required this.imageUrl}) : super(key: key);
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * .1,
    );
  }
}
