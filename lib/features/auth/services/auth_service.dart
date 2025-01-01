import 'dart:convert';
import 'package:ecommerce_application/constants/const.dart';
import 'package:ecommerce_application/constants/error_handling.dart';
import 'package:ecommerce_application/constants/utils.dart';
import 'package:ecommerce_application/features/auth/home/screens/home_screen.dart';
import 'package:ecommerce_application/models/user.dart';
import 'package:ecommerce_application/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
          },
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

  // signin user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async{
    try{
        http.Response res = await http.post(
          Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password' : password
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        httpErrorHandle(
          response: res, 
          context: context, 
          onSuccess: () async {
            // showSnackBar(context, 'Account has been Created!, Please Login');
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route)=> false);

          },);

    }catch(err){
      showSnackBar(context, err.toString());
    }
  }


  // get user data 
  void getUserData(
    BuildContext context,
  ) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token == null){
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);
      if(response == true){
        // get user data 
        
      }
        // http.Response res = await http.post(
        //   Uri.parse('$uri/api/signin'),
        //   body: jsonEncode({
        //     'email': email,
        //     'password' : password
        //   }),
        //   headers: <String, String>{
        //     'Content-Type': 'application/json; charset=UTF-8',
        //   },
        // );

        // print(res.body);

        // httpErrorHandle(
        //   response: res, 
        //   context: context, 
        //   onSuccess: () async {
        //     // showSnackBar(context, 'Account has been Created!, Please Login');
        //     SharedPreferences prefs = await SharedPreferences.getInstance();
        //     Provider.of<UserProvider>(context, listen: false).setUser(res.body);
        //     await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        //     Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route)=> false);

        //   },);

    }catch(err){
      showSnackBar(context, err.toString());
    }
  }



}