import 'package:flutter/material.dart';

class Dati extends ChangeNotifier {
  double _passi = 0;
  double _calorie = 0;
  List<dynamic> _devicedata = [];

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
  set deviceData(newdevicedata) {
    _devicedata = newdevicedata;
    notifyListeners();
  }

  String printDeviceId() {
    return _devicedata[0][1].toString();
  }

  String printDeviceVersion() {
    return _devicedata[2].toString();
  }

  String printBatteryLevel() {
    return _devicedata[3].toString();
  }

  String printLastSyncTime() {
    return _devicedata[4].toString();
  }

  String printType() {
    return _devicedata[5].toString();
  }
}
