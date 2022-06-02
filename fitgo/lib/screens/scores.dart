import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'package:fitgo/screens/homepage.dart';
import '../utils/strings.dart';
import '../utils/fitbit_data.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:fitgo/utils/fitbit_data_class.dart';

class ScoresPage extends StatelessWidget {
  String? calorie;
  ScoresPage({this.calorie});

  static const route = '/scores';
  static const routename = 'ScoresPage';

//   @override
//   _MycustomState createState() => _MycustomState();
// }

// class _MycustomState extends State<ScoresPage> {
//   final data = fitbit_data_class();

  //lista_dati() => null;

  @override
  Widget build(BuildContext context) {
    print('${ScoresPage.routename} built');
    // setState(() {
    //   this.passi_totali;
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text(ScoresPage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(calorie!),
          ],
        ),
      ),
    );
  } //build

} //HomePage