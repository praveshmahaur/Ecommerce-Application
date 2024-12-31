import 'package:ecommerce_application/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    email: '', 
    name: '', 
    password: '', 
    address: '', 
    type: '', 
    phone: '', 
    token: '',
    );

    User get user => _user;

    void setUser(String user){
      _user = User.fromJson(user);
      notifyListeners();
    }

    



}