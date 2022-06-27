import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:fitgo/models/passi.dart';
import 'package:flutter/material.dart';
import 'package:fitgo/screens/homePage.dart';
import 'package:provider/provider.dart';
import '../utils/strings.dart';
import '../utils/fitbit_data.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:fitgo/repository copy/databaseRepository.dart';
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
    //print('Usern SCORES: ' + usern!);
    print('${ScoresPage.routename} built');

    final passi_week = Provider.of<Dati>(context);
    CollectionReference player = FirebaseFirestore.instance.collection('Players');
    // setState(() {
    //   this.passi_totali;
    // });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(ScoresPage.routename),
      ),
      body: 
      // FutureBuilder<DocumentSnapshot>(
      // //Fetching data from the documentId specified of the student
      //           future: player.doc('profilo1').get(),
      //           builder:
      //           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      //             if (snapshot.connectionState == ConnectionState.done) {
      //               var data = snapshot.data!.data() as Map<String, dynamic>;
      //                 //return Text("Full Name: ${data['full_name']} ${data['last_name']}");
                  
      //             return
      FutureBuilder<List<dynamic>>(
          initialData: null,
          future: dbQuery(context, 'a'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final dati_db = snapshot.data as List;
              final passi_db = dati_db[0];
              final date_db = dati_db[1];
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Row(
                      children: [
                        Text(calorie!),
                        
                      ],
                    ),
                    Row(
                      children: [Text('Passi DB: ' + passi_db[0].toString()+' '+ passi_db[1].toString()+' '+ passi_db[2].toString())],
                    ),
                    Row(
                      children: [Text(passi_db[3].toString()+' '+ passi_db[4].toString()+' '+ passi_db[5].toString()+' '+ passi_db[6].toString())],
                    ),
                    Row(
                      children: [Text('Date DB: ' + date_db[0].toString()+' '+ date_db[1].toString()+' '+ date_db[2].toString())],
                    ),
                    Row(
                      children: [Text(date_db[3].toString()+' '+ date_db[4].toString()+' '+ date_db[5].toString()+' '+ date_db[6].toString())],
                    ),
                      ]
                    ));
  
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  } //build

  Future<List<dynamic>> dbQuery(context, usern) async {
    final dati = await Provider.of<DatabaseRepository>(context, listen: false)
        .findAllData(usern);
        List<dynamic> to_plot = [];
        List<dynamic> passi = [];
        List<dynamic> date = [];
    for(var i = dati.length-1; i>=dati.length-7; i--){
      passi.add(dati[i].passi_week);
      date.add(dati[i].date_steps);
    }
    to_plot.add(passi);
    to_plot.add(date);
    // print('lunghezza lista db: '+dati.length.toString());
    // print('Passi: '+dati[7].passi_week.toString());
    // print('Date: '+dati[0].date_steps.toString());
    return to_plot;
  }
} //HomePage
