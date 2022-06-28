//import 'dart:html';

//import 'dart:html';

//import 'package:fitgo/screens/friendsPage.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:fitgo/screens/gestioneFriendsPage.dart';
import 'package:fitgo/screens/homePage.dart';
import 'package:flutter/material.dart';
//import 'package:fitgo/screens/loginPage.dart';
import 'package:fitgo/screens/loginPage_2.dart';
import 'package:fitgo/screens/profilePage.dart';
import 'package:fitgo/screens/TodayPage.dart';
//import 'package:fitgo/screens/trainingPage.dart';
import 'package:fitgo/screens/shopPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../main.dart';
import '../models/navBar.dart';

// Future<Map<String, dynamic>> getData() async {
//   return Future.delayed(Duration(seconds: 1), () => {'prop1': 'value1'});
// }

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final currentTab = [
    HomePage(),
    ProfilePage(),
    GestioneFriendsPage(),
    ShopPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NavBar>(context);
    return (SalomonBottomBar(
      currentIndex: provider.setIndex(),
      onTap: (index) {
        provider.currentIndex = index;
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Color.fromARGB(255, 0, 105, 140),
        ),

        // Database
        SalomonBottomBarItem(
          icon: Icon(MdiIcons.database),
          title: Text("Database"),
          selectedColor: Color.fromARGB(255, 119, 76, 96),
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
    ));
  }
} //build

