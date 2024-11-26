import 'package:ecommerce_application/constants/const.dart';
import 'package:ecommerce_application/constants/error_handling.dart';
import 'package:ecommerce_application/constants/utils.dart';
import 'package:ecommerce_application/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthService {

  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String phone
  }) async{
    try{
        User user = User(
          id: '', 
          email: email,
          name: name, 
          password: password, 
          address: '', 
          type: '', 
          phone: phone, 
          token: ''
        );

        http.Response res = await http.post(
          Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
        );

        httpErrorHandle(
          response: res, 
          context: context, 
          onSuccess: (){
            showSnackBar(context, 'Account has been Created!, Please Login');
          },);

    }catch(err){
      showSnackBar(context, err.toString());
    }
  }

}