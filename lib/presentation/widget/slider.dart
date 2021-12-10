import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderImages extends StatelessWidget {
  SliderImages({Key? key}) : super(key: key);

  @override
  final urlImages = [
    'https://cdnb.artstation.com/p/assets/images/images/024/538/827/original/pixel-jeff-clipa-s.gif?1582740711',
    'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
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
      child: Image.network(
        urlImage,
        fit: BoxFit.fill,
      ));
}
