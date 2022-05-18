//import 'dart:html';

//import 'dart:html';

//import 'package:fitgo/screens/friendsPage.dart';
import 'package:flutter/material.dart';
import 'package:fitgo/screens/loginPage.dart';
//import 'package:fitgo/screens/ProfilePage.dart';
import 'package:fitgo/screens/homePage.dart';
//import 'package:fitgo/screens/trainingPage.dart';
//import 'package:fitgo/screens/shopPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  static const route = '/bottombar/';
  static const routename = 'BottomNavBar';
  @override
  State<BottomNavBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomNavBar> {
  late List<Widget> _pages;
  late Widget _pagina1;
  late Widget _pagina2;
  late Widget _pagina3;
  late Widget _pagina4;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _pagina1 = HomePage(); //const
    //_pagina2 = const TrainingPage();
    //_pagina3 = const FriendsPage();
    //_pagina4 = const ShopPage();
    _pages = [_pagina1]; //, _pagina2, _pagina3, _pagina4];
    _currentIndex = 0;
    _currentPage = _pagina1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('${BottomBar.routename} built');
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: SalomonBottomBar(
        onTap: (index) {
          _changeTab(index);
        },
        currentIndex: _currentIndex,
        items: [
          // bottom navigation bar stile classico
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.home),
          //     label: 'Home',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.sports_gymnastics),
          //     label: 'Training',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.people),
          //     label: 'Friends',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.shop),
          //     label: 'Shop',
          //   ),
          // ],

          // bottom navigation bar stile diverso
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.sports_gymnastics),
            title: Text("Training"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.people),
            title: Text("Friends"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.shop),
            title: Text("Shop"),
            selectedColor: Color.fromARGB(255, 33, 150, 243),
          ),
        ],
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

  void _toProfilePage(BuildContext context) {
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed(ProfilePage.route);
  }
} //HomePage
