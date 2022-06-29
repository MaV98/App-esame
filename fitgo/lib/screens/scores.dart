import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgo/database/entities/dati.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:fitgo/models/passi.dart';
import 'package:flutter/material.dart';
import 'package:fitgo/screens/homePage.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
    CollectionReference player =
        FirebaseFirestore.instance.collection('Players');
    // setState(() {
    //   this.passi_totali;
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 76, 96),
        automaticallyImplyLeading: false,
        title: Text('Database'),
        actions: <Widget>[
          IconButton(onPressed: ()async {
            await deleteAllData(context,usern);
          }, 
            icon: Icon(
              Icons.delete_forever,
              semanticLabel: 'Delete all data',
            ))
        ],
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
                  return ListView(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 119, 76, 96),
                              width: 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.white,
                            ),
                          ],
                        ),
                        child: Text(
                            'The following data refers to the steps taken in the previous seven days, and they are stored locally',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                    Lottie.asset(
                        'assets/18517-the-travelers-walking-cycle-delivery.json',
                        height: 200,
                        animate: true),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text('Date',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        trailing: Text('Steps',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold))),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text(
                            date_db[0].toString().substring(0, 4) +
                                '-' +
                                date_db[0].toString().substring(4, 6) +
                                '-' +
                                date_db[0].toString().substring(6),
                            style: TextStyle(fontSize: 16)),
                        trailing: Text(
                            passi_db[0].toString().substring(
                                    0, passi_db[0].toString().length - 1) +
                                '.' +
                                passi_db[0].toString().substring(
                                    passi_db[0].toString().length - 1),
                            style: TextStyle(fontSize: 16))),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text(
                            date_db[1].toString().substring(0, 4) +
                                '-' +
                                date_db[1].toString().substring(4, 6) +
                                '-' +
                                date_db[1].toString().substring(6),
                            style: TextStyle(fontSize: 16)),
                        trailing: Text(
                            passi_db[1].toString().substring(
                                    0, passi_db[1].toString().length - 1) +
                                '.' +
                                passi_db[1].toString().substring(
                                    passi_db[1].toString().length - 1),
                            style: TextStyle(fontSize: 16))),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text(
                            date_db[2].toString().substring(0, 4) +
                                '-' +
                                date_db[2].toString().substring(4, 6) +
                                '-' +
                                date_db[2].toString().substring(6),
                            style: TextStyle(fontSize: 16)),
                        trailing: Text(
                            passi_db[2].toString().substring(
                                    0, passi_db[2].toString().length - 1) +
                                '.' +
                                passi_db[2].toString().substring(
                                    passi_db[2].toString().length - 1),
                            style: TextStyle(fontSize: 16))),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text(
                            date_db[3].toString().substring(0, 4) +
                                '-' +
                                date_db[3].toString().substring(4, 6) +
                                '-' +
                                date_db[3].toString().substring(6),
                            style: TextStyle(fontSize: 16)),
                        trailing: Text(
                            passi_db[3].toString().substring(
                                    0, passi_db[3].toString().length - 1) +
                                '.' +
                                passi_db[3].toString().substring(
                                    passi_db[3].toString().length - 1),
                            style: TextStyle(fontSize: 16))),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text(
                            date_db[4].toString().substring(0, 4) +
                                '-' +
                                date_db[4].toString().substring(4, 6) +
                                '-' +
                                date_db[4].toString().substring(6),
                            style: TextStyle(fontSize: 16)),
                        trailing: Text(
                            passi_db[4].toString().substring(
                                    0, passi_db[4].toString().length - 1) +
                                '.' +
                                passi_db[4].toString().substring(
                                    passi_db[4].toString().length - 1),
                            style: TextStyle(fontSize: 16))),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text(
                            date_db[5].toString().substring(0, 4) +
                                '-' +
                                date_db[5].toString().substring(4, 6) +
                                '-' +
                                date_db[5].toString().substring(6),
                            style: TextStyle(fontSize: 16)),
                        trailing: Text(
                            passi_db[5].toString().substring(
                                    0, passi_db[5].toString().length - 1) +
                                '.' +
                                passi_db[5].toString().substring(
                                    passi_db[5].toString().length - 1),
                            style: TextStyle(fontSize: 16))),
                    ListTile(
                        leading: Icon(
                          MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 119, 76, 96),
                        ),
                        title: Text(
                            date_db[6].toString().substring(0, 4) +
                                '-' +
                                date_db[6].toString().substring(4, 6) +
                                '-' +
                                date_db[6].toString().substring(6),
                            style: TextStyle(fontSize: 16)),
                        trailing: Text(
                            passi_db[6].toString().substring(
                                    0, passi_db[6].toString().length - 1) +
                                '.' +
                                passi_db[6].toString().substring(
                                    passi_db[6].toString().length - 1),
                            style: TextStyle(fontSize: 16))),
                  ]);
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 119, 76, 96),
                  ));
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
    for (var i = dati.length - 1; i >= dati.length - 7; i--) {
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

  Future<void> deleteAllData(context,usern) async {
    final dati = await Provider.of<DatabaseRepository>(context, listen: false)
        .findAllData(usern);
    await Provider.of<DatabaseRepository>(context, listen: false)
        .deleteData(dati);
  }

} //HomePage

