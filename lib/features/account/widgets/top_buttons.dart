import 'package:ecommerce_application/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTap: (){}),
            AccountButton(text: 'Turn Seller', onTap: (){})
          ],
        ),
        Row(
          children: [
            AccountButton(text: 'Your Wishlist', onTap: (){}),
            AccountButton(text: 'Log Out', onTap: (){})
          ],
        )
      ],
    );
  }
}