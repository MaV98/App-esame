import 'dart:ffi';

import 'package:fitgo/models/index.dart';
import 'package:fitgo/models/navBar.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitgo/screens/TodayPage.dart';
import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:fitgo/screens/gestioneFriendsPage.dart';

import 'package:fitgo/screens/scores.dart';
//import 'package:fitgo/screens/scores.dart';
import 'package:fitgo/screens/shopPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
//import 'package:fitgo/screens/loginPage.dart';
import 'package:fitgo/screens/loginPage_2.dart';

import '../utils/fitbit_data.dart';
import '../utils/fitbit_data_class.dart';

class HomePage extends StatelessWidget {
  int? index;
  String? usern;
  HomePage({Key? key, this.index, this.usern}) : super(key: key);

  static const route = '/homepage';
  static const routename = 'Home';
  final dati = Dati();
  dynamic data = fitbit_data_class();
  dynamic passi_tot = fitbit_data();

  @override
  Widget build(BuildContext context) {
    print('USERN: ' + usern!);
    return ChangeNotifierProvider.value(
      value: dati,
      child: Scaffold(
        body: _getBody(context),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    final page = Provider.of<NavBar>(context).setIndex();
    //final passi = Provider.of<Passi>(context).passi_fatti;
    //final provider = Provider.of<IndicePag>(context);
    //provider.currentCreation = 0;
    if (page == 0) {
      //print(passi.printPassi());
      //Future<List<dynamic>>lista = data.fetchData();
      //passi_tot.copy(lista.steps());
      return TodayPage(
          passi_1: dati.printPassi(),
          cal: dati.printCalorie(),
          index: index,
          usern: usern);
    } else if (page == 1) {
      return ScoresPage(
        calorie: dati.printCalorie(),
        usern: usern,
        stepsCount: dati.returnStepsCount(),
      );
    } else if (page == 2) {
      return GestioneFriendsPage(
        stepsCount: dati.returnStepsCount(),
      );
    } else if (page == 3)
      return ShopPage(
        stepsCount: dati.returnStepsCount(),
      );

    return Container(
      color: Colors.green,
    );
  }
}

class Index {}
