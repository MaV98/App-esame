import 'package:fitbitter/fitbitter.dart';
import 'package:fitgo/database/entities/dati.dart';
import 'package:fitgo/repository%20copy/databaseRepository.dart';
import 'package:flutter/material.dart';
import 'package:fitgo/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/strings.dart';
import '../utils/fitbit_data.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:fitgo/utils/fitbit_data_class.dart';

class ScoresPage extends StatelessWidget {
  String? calorie;
  String? usern;
  ScoresPage({this.calorie, this.usern});

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
    print('Usern SCORES: ' + usern!);
    print('${ScoresPage.routename} built');
    // setState(() {
    //   this.passi_totali;
    // });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(ScoresPage.routename),
      ),
      body: FutureBuilder<dynamic>(
          initialData: null,
          future: dbQuery(context, usern),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final passi_db = snapshot.data as double;

              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Row(
                      children: [
                        Text(calorie!),
                        ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/walking1/'),
                            child: Column(
                              children: [
                                Text('pagina col grafico'),
                                Icon(Icons.abc)
                              ],
                            ))
                      ],
                    ),
                    Row(
                      children: [Text('Passi DB: ' + passi_db.toString())],
                    ),
                  ]));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  } //build

  Future<double> dbQuery(context, usern) async {
    final user = await Provider.of<DatabaseRepository>(context, listen: false)
        .findAllUserId(usern);
    return user!.passi_today;
  }
} //HomePage