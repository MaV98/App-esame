import 'package:flutter/material.dart';

class Dati extends ChangeNotifier{
  double _passi = 0;
  double _calorie = 0;
  // void update(double newpassi){
  //   _passi = newpassi;
  //   notifyListeners();
  // }

  double setPassi(){
    return _passi;
  }
  set passi(double newpassi){
    _passi = newpassi;
    notifyListeners();
  }

  set calorie(double newcal){
    _calorie = newcal;
    notifyListeners();
  }
  //double get passi_fatti => _passi;
  String printPassi(){
    return _passi.toString();
  }

  String printCalorie(){
    return _calorie.toString();
  }
  
}