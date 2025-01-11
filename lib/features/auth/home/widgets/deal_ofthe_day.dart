import 'package:flutter/material.dart';

class DealOftheDay extends StatefulWidget {
  const DealOftheDay({super.key});

  @override
  State<DealOftheDay> createState() => _DealOftheDayState();
}

class _DealOftheDayState extends State<DealOftheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: const Text(
            'Deal of the Day',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS93TE9Iyer3qN0nzMp6bGXMfhW4GqJyNlKYA&s',
          height: 230,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: const Text('\u20B91,29,999', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 0, right: 40),
          child: const Text(
            'Samsung Galaxy S21 Ultra 5G (Phantom Black, 12GB, 256GB Storage)',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ).copyWith(left: 10),
          child: const Text("See All Deals", style: TextStyle(color: Colors.cyan),),
        )

      ],
    );
  }
}
