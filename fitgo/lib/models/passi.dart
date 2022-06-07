import 'package:flutter/material.dart';

class Dati extends ChangeNotifier {
  double _passi = 0;
  double _calorie = 0;
  List<dynamic> _devicedata = [];
  List<dynamic> _accountdata = [];

  // void update(double newpassi){
  //   _passi = newpassi;
  //   notifyListeners();
  // }

  double setPassi() {
    return _passi;
  }

  set passi(double newpassi) {
    _passi = newpassi;
    notifyListeners();
  }

  set calorie(double newcal) {
    _calorie = newcal;
    notifyListeners();
  }

  //double get passi_fatti => _passi;
  String printPassi() {
    return _passi.toString();
  }

  String printCalorie() {
    return _calorie.toString();
  }

  //metodi per device data
  set deviceData(List<dynamic> newdevicedata) {
    _devicedata = newdevicedata;
    notifyListeners();
  }

  String printDeviceId() {
    int endIndex = _devicedata[3].toString().length - 1;
    return _devicedata[3].substring(0, endIndex).toString();
  }

  String printDeviceVersion() {
    int endIndex6 = _devicedata[6].toString().length - 1;
    dynamic version = _devicedata[5].toString() + ' ';
    return version + _devicedata[6].substring(0, endIndex6).toString();
  }

  String printBatteryLevel() {
    int endIndex = _devicedata[8].toString().length - 1;
    return _devicedata[8].substring(0, endIndex).toString();
  }

  String printLastSyncTime() {
    int endIndex11 = _devicedata[11].toString().length - 1;
    dynamic version = _devicedata[10].toString() + ' ';
    return version + _devicedata[11].substring(0, endIndex11).toString();
  }

  String printType() {
    int endIndex = _devicedata[13].toString().length - 1;
    return _devicedata[13].substring(0, endIndex).toString();
  }

  bool isEmpty() {
    if (_devicedata.isEmpty) {
      return true;
    } else {
      return false;
    }
    //return _devicedata.isEmpty;
  }

  //metodi per account data
  set accountData(List<dynamic> newaccountdata) {
    _devicedata = newaccountdata;
    notifyListeners();
  }

  String printName() {
    int endIndex = _accountdata[28].toString().length - 1;
    return _accountdata[28].substring(0, endIndex).toString();
  }
}
