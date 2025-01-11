import 'package:ecommerce_application/constants/global_images.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 85,
          itemCount: GlobalImages.categoryImages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        GlobalImages.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      )),
                ),
                Text(GlobalImages.categoryImages[index]['title']!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),)
              ],
            );
          }),
    );
  }
}
