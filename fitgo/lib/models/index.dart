import 'package:flutter/material.dart';

class IndicePag extends ChangeNotifier{
  int _index = 0;
  int _creation = 0;

  int setIndex(){
    return _index;
  }

  int setCreation(){
    return _creation;
  }

  set currentIndex(int index) {
      _index = index;
      notifyListeners();
  }

  set currentCreation(int creation){
    _creation = creation;
    notifyListeners();
  }
}
