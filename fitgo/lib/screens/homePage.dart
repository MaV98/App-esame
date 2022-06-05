import 'dart:ffi';

import 'package:fitgo/models/navBar.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitgo/screens/TodayPage.dart';
import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/screens/scores.dart';
//import 'package:fitgo/screens/scores.dart';
import 'package:fitgo/screens/shopPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:fitgo/screens/loginPage.dart';

import '../utils/fitbit_data.dart';
import '../utils/fitbit_data_class.dart';

class HomePage extends StatelessWidget {
  int? index;
  HomePage({Key? key, this.index}) : super(key: key);
  
  static const route = '/homepage';
  static const routename = 'Home';
  final dati = Dati();
  dynamic data = fitbit_data_class();
  dynamic passi_tot = fitbit_data();

  @override
  Widget build(BuildContext context) {
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

    if (page == 0) {
      //print(passi.printPassi());
      //Future<List<dynamic>>lista = data.fetchData();
      //passi_tot.copy(lista.steps());
      return TodayPage(passi_1: dati.printPassi(), cal: dati.printCalorie(), index:index);
    } else if (page == 1)
      return ScoresPage(
        calorie: dati.printCalorie(),
      );
    else if (page == 3) return ShopPage();

    return Container(
      color: Colors.green,
    );
  }
}

class Index{
}
