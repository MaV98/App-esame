import 'package:flutter/material.dart';

class IndicePag extends ChangeNotifier{
  int _index = 0;

  int setIndex(){
    return _index;
  }

  set currentIndex(int index) {
      _index = index;
      notifyListeners();
  }
}
