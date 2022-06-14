import 'package:flutter/material.dart';

class ProfileCheck extends ChangeNotifier{
  String _username = '';
  String _password = '';

  set currentUsername(String username){
    _username = username;
    notifyListeners();
  }

  set currentPassword(String password){
    _password = password;
    notifyListeners();
  }

  String retUsername(){
    return _username;
  }

  String retPassword(){
    return _password;
  }
}