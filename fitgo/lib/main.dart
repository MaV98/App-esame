import 'package:fitgo/database/database.dart';
import 'package:fitgo/database/entities/profile.dart';
import 'package:fitgo/models/index.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitgo/models/profileCheck.dart';
import 'package:fitgo/repository%20copy/databaseRepository.dart';
import 'package:fitgo/screens/activityDataPage.dart';
import 'package:fitgo/screens/cartPage.dart';
import 'package:fitgo/screens/devicePage.dart';
import 'package:fitgo/screens/gestioneFriendsPage.dart';
import 'package:fitgo/screens/Fpage_1.dart';
import 'package:fitgo/screens/Fpage_2.dart';
import 'package:fitgo/screens/heartDataPage.dart';
import 'package:fitgo/screens/heartdatapages/heartPage2.dart';
import 'package:fitgo/screens/heartdatapages/heartPage3.dart';
import 'package:fitgo/screens/heartdatapages/heartPage4.dart';
import 'package:fitgo/screens/heartdatapages/heartPage5.dart';
import 'package:fitgo/screens/heartdatapages/heartPage6.dart';
import 'package:fitgo/screens/heartdatapages/heartPage7.dart';
import 'package:fitgo/screens/homepage.dart';
import 'package:fitgo/screens/profilePage.dart'; // as prefix;
import 'package:fitgo/screens/scores.dart';
import 'package:fitgo/screens/signin.dart';
import 'package:fitgo/screens/sleepDataPage.dart';
import 'package:fitgo/screens/sleepdatapages/sleepPage2.dart';
import 'package:fitgo/screens/sleepdatapages/sleepPage3.dart';
import 'package:fitgo/screens/sleepdatapages/sleepPage4.dart';
import 'package:fitgo/screens/sleepdatapages/sleepPage5.dart';
import 'package:fitgo/screens/sleepdatapages/sleepPage6.dart';
import 'package:fitgo/screens/sleepdatapages/sleepPage7.dart';
import 'package:fitgo/screens/successPage.dart';
//import 'package:fitgo/screens/loginPage.dart';
import 'package:fitgo/screens/loginPage_2.dart';
//import 'package:fitgo/screens/ProfilePage.dart';
import 'package:fitgo/screens/cryptoPage.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:fitgo/screens/shopPage.dart';
import 'package:fitgo/screens/TodayPage.dart';
import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:fitgo/screens/storePage.dart';
import 'package:fitgo/screens/timeseriesPage.dart';
import 'package:fitgo/screens/timeseriespage/timeseriesPage2.dart';
import 'package:fitgo/screens/timeseriespage/timeseriesPage3.dart';
import 'package:fitgo/screens/timeseriespage/timeseriesPage4.dart';
import 'package:fitgo/screens/timeseriespage/timeseriesPage5.dart';
import 'package:fitgo/screens/timeseriespage/timeseriesPage6.dart';
import 'package:fitgo/screens/timeseriespage/timeseriesPage7.dart';
import 'package:fitgo/screens/weatherPage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'dart:html';

//cryptoAPI
import 'package:fitgo/cryptoAPI/screens/favoriteCryptopage.dart';

//storeAPI
import 'package:fitgo/storeAPI/screens/favoriteStorepage.dart';

//import 'dart:html';

import 'models/navBar.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('fitgo.db').build();
  //This creates a new DatabaseRepository from the AppDatabase instance just initialized
  final databaseRepository = DatabaseRepository(database: database);

  //Here, we run the app and we provide to the whole widget tree the instance of the DatabaseRepository.
  //That instance will be then shared through the platform and will be unique.
  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main

Future<Map<String, dynamic>> getData() async {
  return Future.delayed(Duration(seconds: 1), () => {'prop1': 'value1'});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dati>(
          create: (context) => Dati(),
        ),
        ChangeNotifierProvider<Favorites>(
          create: (context) => Favorites(),
        ),
        ChangeNotifierProvider<NavBar>(
          //This specifies the app entrypoint
          create: (context) => NavBar(),
        ),
        ChangeNotifierProvider<IndicePag>(create: (context) => IndicePag()),
        ChangeNotifierProvider<ProfileCheck>(
            create: (context) => ProfileCheck())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.route,
        routes: {
          LoginPage.route: (context) => LoginPage(),
          SigninPage.route: (context) => SigninPage(),
          HomePage.route: (context) => HomePage(),
          TodayPage.route: (context) => TodayPage(),
          ScoresPage.route: (context) => ScoresPage(),
          GestioneFriendsPage.route: (context) => GestioneFriendsPage(),
          Fpage1.route: (context) => Fpage1(),
          Fpage2.route: (context) => Fpage2(),
          FriendsPage.route: (context) => FriendsPage(),
          ShopPage.route: (context) => ShopPage(),
          CryptoPage.route: (context) => CryptoPage(),
          StorePage.route: (context) => StorePage(),
          FavoriteCryptoPage.route: (context) => FavoriteCryptoPage(),
          FavoriteStorePage.route: (context) => FavoriteStorePage(),
          CartPage.route: (context) => CartPage(),
          SuccessPage.route: (context) => SuccessPage(),
          WeatherPage.route: (context) => WeatherPage(),
          DevicePage.route: (context) => DevicePage(),
          ProfilePage.route: (context) => ProfilePage(),
          HeartDataPage.route: (context) => HeartDataPage(),
          HeartDataPage2.route: (context) => HeartDataPage2(),
          HeartDataPage3.route: (context) => HeartDataPage3(),
          HeartDataPage4.route: (context) => HeartDataPage4(),
          HeartDataPage5.route: (context) => HeartDataPage5(),
          HeartDataPage6.route: (context) => HeartDataPage6(),
          HeartDataPage7.route: (context) => HeartDataPage7(),
          SleepDataPage.route: (context) => SleepDataPage(),
          SleepDataPage2.route: (context) => SleepDataPage2(),
          SleepDataPage3.route: (context) => SleepDataPage3(),
          SleepDataPage4.route: (context) => SleepDataPage4(),
          SleepDataPage5.route: (context) => SleepDataPage5(),
          SleepDataPage6.route: (context) => SleepDataPage6(),
          SleepDataPage7.route: (context) => SleepDataPage7(),
          ActivityDataPage.route: (context) => ActivityDataPage(),
          TimeseriesPage.route: (context) => TimeseriesPage(),
          TimeseriesPage2.route: (context) => TimeseriesPage2(),
          TimeseriesPage3.route: (context) => TimeseriesPage3(),
          TimeseriesPage4.route: (context) => TimeseriesPage4(),
          TimeseriesPage5.route: (context) => TimeseriesPage5(),
          TimeseriesPage6.route: (context) => TimeseriesPage6(),
          TimeseriesPage7.route: (context) => TimeseriesPage7(),
        },
      ),
    );
  } //build
} //MyApp
