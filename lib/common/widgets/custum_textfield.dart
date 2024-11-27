import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  const CustomTextFormField({super.key,
   required this.controller,
   required this.hintText
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText, 
        border: OutlineInputBorder(
          borderSide: BorderSide (
            color: Colors.black54
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54
          )
        ),
      ),
      validator: (val){
        if(val == null || val.isEmpty){
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}