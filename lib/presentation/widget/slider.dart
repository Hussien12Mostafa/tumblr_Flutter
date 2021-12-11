import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderImages extends StatelessWidget {
  SliderImages({Key? key}) : super(key: key);

  @override
  final urlImages = [
    "assets/images/1 .jpg",
    "assets/images/2.png",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CarouselSlider.builder(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          autoPlay: true,
        ),
        itemCount: urlImages.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = urlImages[index];

          return buildImage(urlImage, index);
        },
      )),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
      color: Colors.grey,
      child: Image.asset(
        urlImage,
        fit: BoxFit.fill,
      ));
}
