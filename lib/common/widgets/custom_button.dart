import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity,50),
        backgroundColor: GlobalColors.secondaryColor,
      ),
      onPressed: onTap,
      child: Text(text,style:TextStyle(color: Colors.black),));
  }
}


