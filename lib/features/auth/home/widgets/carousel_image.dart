import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/constants/global_images.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1.0, 
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: GlobalImages.carouselImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              decoration: const BoxDecoration(color: Colors.amber),
              child: Image.network(
                i,
                fit: BoxFit.cover,
                height: 200,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
