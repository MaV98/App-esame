//import 'dart:html';

//import 'dart:html';

//import 'package:fitgo/screens/friendsPage.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:flutter/material.dart';
import 'package:fitgo/screens/loginPage.dart';
//import 'package:fitgo/screens/ProfilePage.dart';
import 'package:fitgo/screens/homePage.dart';
//import 'package:fitgo/screens/trainingPage.dart';
import 'package:fitgo/screens/shopPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../main.dart';

// Future<Map<String, dynamic>> getData() async {
//   return Future.delayed(Duration(seconds: 1), () => {'prop1': 'value1'});
// }

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  static const route = '/bottombar/';
  static const routename = 'BottomNavBar';

  @override
  State<BottomNavBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomNavBar> {
  Map<String, dynamic>? dati;

  late List<Widget> _pages;
  late Widget _pagina1;
  late Widget _pagina2;
  late Widget _pagina3;
  late Widget _pagina4;
  late int _currentIndex;
  late Widget _currentPage;

  // @override
  // void initState() {
  //   //StartFunc();
  //   super.initState();
  //   getData().then((values) {
  //     setState(() {
  //       dati = values;
  //     });
  //   });
  // }

  // Widget getPage(int index) {
  //   switch (index) {
  //     case 0:
  //       return HomePage(topass: dati);
  //       break;
  //     case 1:
  //       return FriendsPage(data: dati);
  //       break;
  //     default:
  //       return HomePage();
  //       break;
  //   }
  // }

  // int _currentIndex = 0;

  // onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
  @override
  void initState() {
    super.initState();
    _pagina1 = HomePage(topass: dati); //const
    //_pagina2 = const TrainingPage();
    _pagina3 = FriendsPage(data: dati);
    _pagina4 = const ShopPage();
    _pages = [_pagina1, _pagina3, _pagina4]; //, _pagina2, _pagina3, _pagina4];
    _currentIndex = 0;
    _currentPage = _pagina1;
  }

  // void _changeTab(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //     //_currentPage = _pages[index];
  //     _currentPage = IndexedStack(
  //       index: _currentIndex,
  //       children: _pages,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print('${BottomNavBar.routename} built');
    return Scaffold(
      //body: _currentPage,
      body: IndexedStack(index: _currentIndex, children: _pages),
      //getPage(_currentIndex),

      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),

          // Training
          SalomonBottomBarItem(
            icon: Icon(Icons.sports_gymnastics),
            title: Text("Training"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),

          // Friends
          SalomonBottomBarItem(
            icon: Icon(Icons.people),
            title: Text("Friends"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),

          // Shop
          SalomonBottomBarItem(
            icon: Icon(Icons.shop),
            title: Text("Shop"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),
        ],
        //onTap: onTabTapped,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  } //build

  void _toLoginPage(BuildContext context) {
    //Pop the drawer first
    //Navigator.pop(context);
    //Then pop the HomePage
    //Navigator.of(context).pushReplacementNamed(LoginPage.route);
    Navigator.pop(context);
    //Navigator.pushNamed(context, '/');
    //Navigator.pushNamed(context, '/');
  }

  // void _toProfilePage(BuildContext context) {
  //   //Then pop the HomePage
  //   Navigator.of(context).pushReplacementNamed(ProfilePage.route);
  // }
} //HomePage
