//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fitgo/screens/homepage.dart';
//import 'package:fitgo/screens/scores.dart';

class NavBar with ChangeNotifier {
  int _currentIndex = 0;
  //List<Widget> _screens = [HomePage(), ScoresPage()];
  int setIndex() {
    return _currentIndex;
  }

  //get currenIndex => _currentIndex;
  set currentIndex(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  //get currentIndex => this._currentIndex;
  // int getIndex() {
  //   return _currentIndex;
  // }

  //get currentScreen => _screens[_currentIndex];
}
