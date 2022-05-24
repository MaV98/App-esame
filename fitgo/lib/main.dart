import 'package:fitgo/screens/cartPage.dart';
import 'package:fitgo/screens/loginPage.dart';
//import 'package:app_demo/screens/ProfilePage.dart';
import 'package:fitgo/screens/cryptoPage.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:fitgo/screens/shopPage.dart';
import 'package:fitgo/screens/homePage.dart';
import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/repository/favorites.dart';
//import 'package:app_demo/screens/settingsPage.dart';
import 'package:fitgo/screens/storePage.dart';
//import 'package:app_demo/screens/walking1.dart';
//import 'package:app_demo/screens/trainingPage.dart';
//import 'package:app_demo/screens/walkingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'dart:html';

//cryptoAPI
import 'package:fitgo/cryptoAPI/screens/favoriteCryptopage.dart';

//storeAPI
import 'package:fitgo/storeAPI/screens/favoriteStorepage.dart';

//weatherAPI
//import 'dart:html';
//import 'package:app_demo/weatherAPI/data_service.dart';
//import 'package:app_demo/weatherAPI/models.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} //main

Future<Map<String, dynamic>> getData() async {
  return Future.delayed(Duration(seconds: 1), () => {'prop1': 'value1'});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.route,
        routes: {
          LoginPage.route: (context) => LoginPage(),
          BottomNavBar.route: (context) => BottomNavBar(),
          //ProfilePage.route: (context) => ProfilePage(),
          HomePage.route: (context) => HomePage(),
          //SettingsPage.route: (context) => SettingsPage(),
          //TrainingPage.route: (context) => TrainingPage(),
          FriendsPage.route: (context) => FriendsPage(),
          ShopPage.route: (context) => ShopPage(),
          //WalkingPage.route: (context) => WalkingPage(),
          //WalkingPage1.route: (context) => WalkingPage1(),
          CryptoPage.route: (context) => CryptoPage(),
          StorePage.route: (context) => StorePage(),
          FavoriteCryptoPage.route: (context) => FavoriteCryptoPage(),
          FavoriteStorePage.route: (context) => FavoriteStorePage(),
          CartPage.route: (context) => CartPage(),
        },
      ),
    );
  } //build
}//MyApp