import 'package:ecommerce_application/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  // temparary list 
  final List list = [
      'https://images.unsplash.com/photo-1507072757289-c7de1a8c075e?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://unsplash.com/photos/person-using-macbook-pro-67l-QujB14w',
      'https://unsplash.com/photos/a-couple-of-cars-parked-in-front-of-a-building-mwJBOWcAN6U',
      'https://unsplash.com/photos/person-using-macbook-pro-67l-QujB14w',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: const Text(
                'See all',
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
            )
          ],
        ),
        Container(
          height: 180,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SingleProduct(image: 'https://images.unsplash.com/photo-1507072757289-c7de1a8c075e?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            },
          ),
        )
      ],
    );
  }
}
