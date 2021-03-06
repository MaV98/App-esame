//import 'package:fitgo/Charts/ActivityDB.dart';
//import 'package:fitgo/Charts/physical_activity.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:fitgo/database/entities/dati.dart';
import 'package:fitgo/models/index.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitgo/repository%20copy/databaseRepository.dart';
import 'package:fitgo/screens/devicePage.dart';
import 'package:fitgo/screens/weatherPage.dart';
import 'package:fitgo/utils/fitbit_data.dart';
import 'package:fitgo/utils/fitbit_data_class.dart';
import 'package:flutter/material.dart';

//import 'package:fitgo/screens/loginPage.dart';
import 'package:fitgo/screens/loginPage_2.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pie_chart/pie_chart.dart';

import '../utils/strings.dart';

class TodayPage extends StatelessWidget {
  //Map<String, dynamic>? topass;
  String? passi_1;
  String? cal;
  final index;
  String? usern;
  TodayPage({this.passi_1, this.cal, this.index, this.usern});

  static const route = '/todaypage/';
  static const routename = 'TodayPage';

  //   @override
  //   State<TodayPage> createState() => _TodayPageState(this.topass);
  // }

  // class _TOdayPageState extends State<TodayPage> {
  //   Map<String, dynamic>? topass;
  final passi_totali = fitbit_data();
  final calorie_totali = fitbit_data();
  //final data1 = fitbit_data_class();

  Dati passi = Dati();
  Dati deviceData = Dati();
  Dati accountData = Dati();
  Dati heartData = Dati();
  Dati sleepData_today = Dati();
  double passi_fatti = 0;

  dynamic data1 = fitbit_data_class();

  // _HomePageState(this.topass);
  @override
  Widget build(BuildContext context) {
    print('CONTROLLO');

    // creation.currentCreation = creation.setCreation() + 1;
    // final creat = creation.setCreation();
    // final creation = Provider.of<IndicePag>(context);
    // creation.currentCreation = 0;
    return Consumer<IndicePag>(builder: (context, indpag, _) {
      //var creation = Provider.of<IndicePag>(context);
      // creation.currentCreation = creation.setCreation() + 1;
      // final creat = creation.setCreation();
      print('l' 'indice ??: ' + index.toString());
      print('CREATION: ' + indpag.setCreation().toString());
      indpag.currentCreation = indpag.setCreation() + 1;
      final creat = indpag.setCreation();
      return //selectSituation(context, index, creat, data1, usern);
          Scaffold(
              // floatingActionButton:
              //     Consumer<Dati>(builder: (context, passi, _) {
              //   return FloatingActionButton(
              //     onPressed: () => displayCard(context, passi),
              //     child: Image.network(
              //         //'https://w7.pngwing.com/pngs/442/860/png-transparent-grogu-baby-yoda.png'
              //         //  'https://seeklogo.com/images/B/baby-yoda-logo-624AE4E7B3-seeklogo.com.png'
              //         'https://icons-for-free.com/download-icon-jedi+master+starwars+yoda+icon-1320166755293974043_512.png'),
              //   );
              // }),
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 0, 105, 140),
                title: Text('Home Page'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WeatherPage.route);
                    },
                    icon: Icon(MdiIcons.weatherPartlyCloudy),
                    color: Colors.white,
                    iconSize: 35,
                  )
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Consumer<Dati>(builder: (context, accountData, _) {
                      return ElevatedButton(
                        onPressed: () {
                          _toProfilePage(context, accountData);
                        },
                        child: DrawerHeader(
                            decoration: BoxDecoration(

                                //color: Color.fromARGB(255, 0, 105, 140),
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  minRadius: 35.0,
                                  maxRadius: 45.0,
                                  child: CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: accountData
                                              .isEmptyAccount()
                                          ? NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvFoqpTEH65bi07UUM1Osre6jjvLzRi7Tb-6DP_ee5k3DXs6wur3_qHZHG0o4KC2ZQIxw&usqp=CAU')
                                          : NetworkImage(
                                              accountData.printImage())),
                                ),
                                accountData.isEmptyAccount()
                                    ? Text(
                                        'Data not available',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(accountData.printName(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('Average daily steps:',
                                              style: TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                          Text(
                                              accountData
                                                  .printAverageDailySteps(),
                                              style: TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ))
                                        ],
                                      )
                              ],
                            )),
                      );
                    }),
                    Consumer<Dati>(builder: (context, deviceData, _) {
                      return ListTile(
                        leading: Icon(Icons.watch,
                            color: Color.fromARGB(255, 0, 105, 140)),
                        title: Text('Device'),
                        onTap: () => _toDevicePage(context, deviceData),
                      );
                    }),
                    ListTile(
                      leading: Icon(MdiIcons.cancel,
                          color: Color.fromARGB(255, 0, 105, 140)),
                      title: Text('Unauthorize'),
                      onTap: () async {
                        await FitbitConnector.unauthorize(
                          clientID: Strings.fitbitClientID,
                          clientSecret: Strings.fitbitClientSecret,
                        );
                        final snackBar = SnackBar(
                            //backgroundColor: Colors.green,
                            content: Text('Unauthorisation confirmed'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 0, 105, 140),
                        ),
                        title: Text('Logout'),
                        onTap: () {
                          _toLoginPage(context);

                          FitbitConnector.unauthorize(
                            clientID: Strings.fitbitClientID,
                            clientSecret: Strings.fitbitClientSecret,
                          );
                          //var cr = Provider.of<IndicePag>(context);
                          //var c = cr.setCreation();
                          //int c = 0;
                          //creation.currentCreation = 0;
                          //cr.currentCreation = 0;
                        }),
                  ],
                ),
              ),
              body: selectSituation(context, index, creat, data1, usern));
    });
  }

  Future<String?> retUserName() async {
    final sp = await SharedPreferences.getInstance();
    String? usern = sp.getString('UserName');
    return usern;
  }
}

Widget selectSituation(BuildContext context, index, creat, data1, usern) {
  // final creation = Provider.of<IndicePag>(context);
  // creation.currentCreation = creation.setCreation() + 1;
  // final creat = creation.setCreation();
  print('creat: ' + creat.toString());
  var provider = Provider.of<Dati>(context);
  dynamic data1 = fitbit_data_class();
  if ((index == 1) & (creat == 1)) {
    return FutureBuilder<List>(
        initialData: null,
        future: data1.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dati = snapshot.data as List;
            provider.passi = dati[0];
            provider.calorie = dati[1];
            final dati_device = dati[2].toString().split(' ');
            final dati_account = dati[3].toString().split(' ');
            final dati_heart = dati[4].toString().split(' ');
            final dati_sleep_today = dati[5];
            final dati_sleep_2 = dati[6];
            final dati_sleep_3 = dati[7];
            final dati_sleep_4 = dati[8];
            final dati_sleep_5 = dati[9];
            final dati_sleep_6 = dati[10];
            final dati_sleep_7 = dati[11];
            final dati_sleep = [];
            dati_sleep.add(dati_sleep_today);
            dati_sleep.add(dati_sleep_2);
            dati_sleep.add(dati_sleep_3);
            dati_sleep.add(dati_sleep_4);
            dati_sleep.add(dati_sleep_5);
            dati_sleep.add(dati_sleep_6);
            dati_sleep.add(dati_sleep_7);
            final dati_activity_today = dati[12];
            final dati_activity_2 = dati[13];
            final dati_activity_3 = dati[14];
            final dati_activity_4 = dati[15];
            final dati_activity_5 = dati[16];
            final dati_activity_6 = dati[17];
            final dati_activity_7 = dati[18];
            final dati_activity = [];
            dati_activity.add(dati_activity_today);
            dati_activity.add(dati_activity_2);
            dati_activity.add(dati_activity_3);
            dati_activity.add(dati_activity_4);
            dati_activity.add(dati_activity_5);
            dati_activity.add(dati_activity_6);
            dati_activity.add(dati_activity_7);
            final dati_timeseries_calories = dati[19];
            final dati_timeseries_steps = dati[20];
            final dati_timeseries_distance = dati[21];
            final dati_timeseries_floors = dati[22];
            final dati_timeseries_elevation = dati[23];
            final dati_timeseries_minutesSedentary = dati[24];
            final dati_timeseries_minutesLightliActive = dati[25];
            final dati_timeseries_minutesFairlyActive = dati[26];
            final dati_timeseries_minutesVeryActive = dati[27];
            final dati_timeseries_activityCalories = dati[28];
            final dati_timeseries = [];
            dati_timeseries.add(dati_timeseries_calories);
            dati_timeseries.add(dati_timeseries_steps);
            dati_timeseries.add(dati_timeseries_distance);
            dati_timeseries.add(dati_timeseries_floors);
            dati_timeseries.add(dati_timeseries_elevation);
            dati_timeseries.add(dati_timeseries_minutesSedentary);
            dati_timeseries.add(dati_timeseries_minutesLightliActive);
            dati_timeseries.add(dati_timeseries_minutesFairlyActive);
            dati_timeseries.add(dati_timeseries_minutesVeryActive);
            dati_timeseries.add(dati_timeseries_activityCalories);

            provider.deviceData = dati_device;
            provider.accountData = dati_account;
            provider.heartData = dati_heart;
            provider.sleepData = dati_sleep;
            provider.activityData = dati_activity;
            provider.timeseriesData = dati_timeseries;

            int steps_count = 0;
            for (var i = 0; i < dati_timeseries_steps.length; i++) {
              var currentElement = dati_timeseries_steps[i];
              var currentElement_value = double.parse(
                currentElement.toString().split(' ')[8].substring(
                    0, currentElement.toString().split(' ')[8].length - 1),
              );
              if (currentElement_value >= 15000) {
                ++steps_count;
              }
            }
            provider.stepsCount = steps_count;
            //steps_count;

            // provider.weekSteps = dati[12]; //7
            // provider.weekSteps = dati[13]; //6
            // provider.weekSteps = dati[14]; //5
            // provider.weekSteps = dati[15]; //4
            // provider.weekSteps = dati[16]; //3
            // provider.weekSteps = dati[17]; //2

            List<dynamic> passi_settimana = [];
            passi_settimana.add(dati[29]);
            passi_settimana.add(dati[30]);
            passi_settimana.add(dati[31]);
            passi_settimana.add(dati[32]);
            passi_settimana.add(dati[33]);
            passi_settimana.add(dati[34]);
            passi_settimana.add(dati[35]);
            provider.weekSteps = passi_settimana;

            _addDataDB(context, dati[0], passi_settimana, usern);
            setScoreIndex(context);
            // Provider.of<DatabaseRepository>(context,listen:false)
            // .insertData(DatiDB(1,dati[0],usern));
            return situation1(dati: dati);
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 105, 140),
            ));
          }
        });
  } else if ((index == 1) & (creat > 1)) {
    return situation1();
  } else {
    return situation2();
  }
}

class situation1 extends StatelessWidget {
  // final dati_device;
  // final dati_account;
  final dati;
  situation1({this.dati});
  // situation1({this.dati_device,this.dati_account});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Dati>(context);
    dynamic data1 = fitbit_data_class();
    dynamic data_device = fitbit_data_class();
    print('SITUATION 1 built');

    // _refresh(context, data1);
    //print(data1.refresh(context));
    return Scaffold(
      // floatingActionButton: Consumer<Dati>(builder: (context, passi, _) {
      //   return FloatingActionButton(
      //     backgroundColor: Color.fromARGB(255, 0, 105, 140),
      //     onPressed: () => displayCard(context, passi),
      //     child: Image.network(
      //         //'https://w7.pngwing.com/pngs/442/860/png-transparent-grogu-baby-yoda.png'
      //         //  'https://seeklogo.com/images/B/baby-yoda-logo-624AE4E7B3-seeklogo.com.png'
      //         'https://icons-for-free.com/download-icon-jedi+master+starwars+yoda+icon-1320166755293974043_512.png'),
      //   );
      // }),

      body:
          //Consumer<Dati>(
          //builder: (context, dati,_){
          //return

          RefreshIndicator(
              color: Color.fromARGB(255, 0, 105, 140),
              onRefresh: () async {
                List dati = await data1.fetchData();
                provider.passi = dati[0];
                provider.calorie = dati[1];
                final dati_device = dati[2].toString().split(' ');
                final dati_account = dati[3].toString().split(' ');
                final dati_heart = dati[4].toString().split(' ');
                final dati_sleep_today = dati[5];
                final dati_sleep_2 = dati[6];
                final dati_sleep_3 = dati[7];
                final dati_sleep_4 = dati[8];
                final dati_sleep_5 = dati[9];
                final dati_sleep_6 = dati[10];
                final dati_sleep_7 = dati[11];
                final dati_sleep = [];
                dati_sleep.add(dati_sleep_today);
                dati_sleep.add(dati_sleep_2);
                dati_sleep.add(dati_sleep_3);
                dati_sleep.add(dati_sleep_4);
                dati_sleep.add(dati_sleep_5);
                dati_sleep.add(dati_sleep_6);
                dati_sleep.add(dati_sleep_7);
                final dati_activity_today = dati[12];
                final dati_activity_2 = dati[13];
                final dati_activity_3 = dati[14];
                final dati_activity_4 = dati[15];
                final dati_activity_5 = dati[16];
                final dati_activity_6 = dati[17];
                final dati_activity_7 = dati[18];
                final dati_activity = [];
                dati_activity.add(dati_activity_today);
                dati_activity.add(dati_activity_2);
                dati_activity.add(dati_activity_3);
                dati_activity.add(dati_activity_4);
                dati_activity.add(dati_activity_5);
                dati_activity.add(dati_activity_6);
                dati_activity.add(dati_activity_7);
                final dati_timeseries_calories = dati[19];
                final dati_timeseries_steps = dati[20];
                final dati_timeseries_distance = dati[21];
                final dati_timeseries_floors = dati[22];
                final dati_timeseries_elevation = dati[23];
                final dati_timeseries_minutesSedentary = dati[24];
                final dati_timeseries_minutesLightliActive = dati[25];
                final dati_timeseries_minutesFairlyActive = dati[26];
                final dati_timeseries_minutesVeryActive = dati[27];
                final dati_timeseries_activityCalories = dati[28];
                final dati_timeseries = [];
                dati_timeseries.add(dati_timeseries_calories);
                dati_timeseries.add(dati_timeseries_steps);
                dati_timeseries.add(dati_timeseries_distance);
                dati_timeseries.add(dati_timeseries_floors);
                dati_timeseries.add(dati_timeseries_elevation);
                dati_timeseries.add(dati_timeseries_minutesSedentary);
                dati_timeseries.add(dati_timeseries_minutesLightliActive);
                dati_timeseries.add(dati_timeseries_minutesFairlyActive);
                dati_timeseries.add(dati_timeseries_minutesVeryActive);
                dati_timeseries.add(dati_timeseries_activityCalories);

                provider.accountData = dati_account;
                provider.deviceData = dati_device;
                provider.heartData = dati_heart;
                provider.sleepData = dati_sleep;
                provider.activityData = dati_activity;
                provider.timeseriesData = dati_timeseries;

                int steps_count = 0;
                setScoreIndex(context);

                for (var i = 0; i < dati_timeseries_steps.length; i++) {
                  var currentElement = dati_timeseries_steps[i];
                  var currentElement_value = double.parse(
                    currentElement.toString().split(' ')[8].substring(
                        0, currentElement.toString().split(' ')[8].length - 1),
                  );
                  if (currentElement_value >= 15000) {
                    ++steps_count;
                  }
                }
                provider.stepsCount = steps_count;
                //steps_count;
              },
              child: Consumer<Dati>(builder: (context, accountData, _) {
                return accountData.isEmpty()
                    ? ListView(children: [
                        SizedBox(height: 50),
                        Center(
                          child: Text(
                              'Oh no, something went wrong. Try to reload the data'),
                        )
                      ])
                    : ListView(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            20,
                            10,
                            20,
                            10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer<Dati>(
                                  builder: (context, accountData, _) {
                                return Text(
                                  "Welcome back ${accountData.printName()}!",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                              Text("Let's check your activity",
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: <Color>[
                                        Colors.black12,
                                        Color.fromARGB(255, 0, 105, 140),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 1.0),
                                      stops: <double>[0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                width: 150.0,
                                height: 2.0,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                child: Text(
                                  'o',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 105, 140),
                                    fontSize: 15.0,
                                    //fontFamily: 'WorkSansMedium'
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: <Color>[
                                        Color.fromARGB(255, 0, 105, 140),
                                        Colors.black12
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 1.0),
                                      stops: <double>[0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                width: 150.0,
                                height: 2.0,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              0,
                              20,
                              10,
                            ),
                            child: Consumer<Dati>(
                                builder: (context, timeseriesData, _) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 12,
                                    fixedSize: const Size(320, 150),
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  _toTimeSeriesPage(context, timeseriesData);
                                },
                                child: Consumer<Dati>(
                                    builder: (context, passi, _) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      (15000 -
                                                  double.parse(
                                                    passi.printPassi(),
                                                  ) <
                                              0)
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                  Text(
                                                    'Activity timeseries',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            131, 3, 78, 4),
                                                        fontSize: 18),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text('Goal reached!',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              131, 3, 78, 4),
                                                          fontSize: 18))
                                                ])
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                  Text(
                                                    'Activity timeseries',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            131, 3, 78, 4),
                                                        fontSize: 18),
                                                  ),
                                                ]),
                                      PieChart(
                                        initialAngleInDegree: 270,
                                        totalValue: 15000,
                                        dataMap: <String, double>{
                                          "Today steps": double.parse(
                                            passi.printPassi(),
                                          ),
                                          "15000 steps goal": 15000 -
                                              double.parse(
                                                passi.printPassi(),
                                              ),
                                        }, //dataMap,
                                        colorList: (15000 -
                                                    double.parse(
                                                      passi.printPassi(),
                                                    ) <
                                                0)
                                            ? <Color>[
                                                Color.fromARGB(131, 3, 78, 4),
                                                Colors.transparent
                                              ]
                                            : <Color>[
                                                Color.fromARGB(131, 3, 78, 4),
                                                Color.fromARGB(
                                                    255, 177, 251, 182),
                                              ], //colorList,
                                        centerText: passi.printPassi(),
                                        centerTextStyle: TextStyle(
                                            backgroundColor: Colors.white,
                                            color: Colors.black,
                                            decorationColor: Colors.white),
                                        chartType: ChartType.ring,
                                        animationDuration:
                                            Duration(milliseconds: 1000),
                                        chartLegendSpacing: 32,
                                        chartRadius:
                                            MediaQuery.of(context).size.width /
                                                3.2,
                                        legendOptions: LegendOptions(
                                            legendTextStyle:
                                                TextStyle(color: Colors.black)),
                                        chartValuesOptions: ChartValuesOptions(
                                            showChartValues: false,
                                            showChartValuesOutside: false),
                                      ),
                                    ],
                                  );
                                }),
                              );
                            })),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            10,
                          ),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Consumer<Dati>(
                                      builder: (context, activityData, _) {
                                    dynamic today_activity_data =
                                        activityData.selectElementActivity(0);
                                    if (today_activity_data.isEmpty) {
                                    } else {
                                      dynamic activity_name =
                                          today_activity_data.last
                                              .toString()
                                              .split(',')[10]
                                              .substring(6);
                                      provider.activityName = [activity_name];
                                    }
                                    //dynamic name = activity_name;
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 12,
                                          fixedSize: const Size(155, 239),
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      onPressed: () {
                                        _toActivityPage(context, activityData);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Activity",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 18),
                                          ),
                                          Lottie.asset(
                                              'assets/787-progression.json',
                                              width: 130,
                                              height: 110),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          today_activity_data.isNotEmpty
                                              ? Consumer<Dati>(builder:
                                                  (context, activityName, _) {
                                                  return Column(children: [
                                                    Text(
                                                        'Last activity performed',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        activityName
                                                            .selectElementActivityName(
                                                                0)
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.center)
                                                  ]);
                                                })
                                              : Text(
                                                  'No activity performed today',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                )
                                        ],
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    height: 75,
                                    width: 10,
                                  ),
                                  Consumer<Dati>(
                                      builder: (context, sleepData, _) {
                                    dynamic today_sleep_data =
                                        sleepData.selectElement(0);
                                    int count = 0;
                                    if (today_sleep_data.isEmpty) {
                                      count = 0;
                                    } else {
                                      for (var i = 0;
                                          i < today_sleep_data.length;
                                          i++) {
                                        var currentElement =
                                            today_sleep_data[i];
                                        var currentElement_str = currentElement
                                            .toString()
                                            .split(' ');
                                        if (currentElement_str[9]
                                                .substring(
                                                    0,
                                                    currentElement_str[9]
                                                            .toString()
                                                            .length -
                                                        1)
                                                .toString() !=
                                            'wake') {
                                          ++count;
                                        }
                                      }
                                    }

                                    double seconds = count * 30;
                                    double total_minutes = seconds / 60;
                                    double hour = total_minutes / 60;
                                    double resto = hour - hour.toInt();
                                    double minutes = resto * 60;

                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 12,
                                          fixedSize: const Size(155, 239),
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      onPressed: () {
                                        _toSleepPage(context, sleepData);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Sleep",
                                            style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 18),
                                          ),
                                          Lottie.asset(
                                              'assets/10686-the-moon.json',
                                              width: 130,
                                              height: 110),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          today_sleep_data.isEmpty
                                              ? Column(
                                                  children: [
                                                    Text(
                                                      'No last sleep activity registered',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text('Device on charge',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black))
                                                  ],
                                                )
                                              : Column(children: [
                                                  Text('Last sleep duration',
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                      '${hour.toInt()}h ${minutes.toInt()}min',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20))
                                                ])
                                        ],
                                      ),
                                    );
                                  }),
                                ]),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            10,
                          ),
                          child:
                              Consumer<Dati>(builder: (context, heartData, _) {
                            dynamic todayheartdata =
                                heartData.subList(192, null);
                            return ElevatedButton(
                              onPressed: () {
                                _toHeartPage(context, heartData);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Heart',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 18),
                                      ),
                                      Lottie.asset(
                                          //'assets/9427-heartbeat.json',
                                          'assets/97571-beating-heart.json',
                                          width: 130,
                                          height: 110),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Today minutes spent in:',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        'Fat Burn range: ${todayheartdata[16].substring(0, todayheartdata[16].toString().length - 1).toString()}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        'Cardio range: ${todayheartdata[22].substring(0, todayheartdata[22].toString().length - 1).toString()}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        'Peak range: ${todayheartdata[28].substring(0, todayheartdata[28].toString().length - 1).toString()}',
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  fixedSize: const Size(320, 150),
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            );
                          }),
                        )
                      ]);
              })),
    );
  }
}

// } else {
//   return Center(
//     child: CircularProgressIndicator(),
//   );
// }
//}
//);
//}
//}

class situation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<Passi>(context);
    // List<dynamic> lista = data.fetchData();
    // provider.passi = lista[0];
    // provider.calorie = lista[1];
    print('SITUATION 2 built');

    var provider = Provider.of<Dati>(context);
    provider.stepsCount = -1;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color.fromARGB(255, 0, 105, 140),
      //   onPressed: () => displayCardUnhautorize(context),
      //   child: Image.network(
      //       //'https://w7.pngwing.com/pngs/442/860/png-transparent-grogu-baby-yoda.png'
      //       //  'https://seeklogo.com/images/B/baby-yoda-logo-624AE4E7B3-seeklogo.com.png'
      //       'https://icons-for-free.com/download-icon-jedi+master+starwars+yoda+icon-1320166755293974043_512.png'),
      // ),

      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Data download permission not granted. You can still visit the store, but you will not get any discount. If you want to see your activity please log out and then log back in by authorizing the application',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(120, 40)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 0, 105, 140)),
            ),
            onPressed: () async {
              final sp = await SharedPreferences.getInstance();
              sp.remove('UserName');
              //final index = await SharedPreferences.getInstance();
              sp.remove('indice');
              Navigator.pushNamed(context, LoginPage.route);
            },
            child: Text('LogOut')),
        Lottie.asset('assets/49993-search.json', width: 260, height: 260)
      ]),
    );

    //build
  }
}

void _toLoginPage(BuildContext context) async {
  //Unset the 'username' filed in SharedPreference
  //final create = Provider.of<IndicePag>(context);
  final sp = await SharedPreferences.getInstance();
  sp.remove('UserName');
  sp.remove('indice');
  //create.currentCreation = 0;
  //Pop the drawer first
  //Navigator.pop(context);
  //Navigator.pop(context);
  //Navigator.pop(context);
  //Then pop the HomePage
  Navigator.pushNamed(context, '/');
  //Navigator.pushReplacementNamed(context, LoginPage.route);
}

void _toDevicePage(BuildContext context, dati_device) {
  Navigator.pushNamed(context, '/devicepage/',
      arguments: {'device_data': dati_device}); //, 'account_data': dati_account
}

void _toProfilePage(BuildContext context, dati_account) {
  Navigator.pushNamed(context, '/profile/',
      arguments: {'account_data': dati_account});
}

void _toHeartPage(BuildContext context, dati_heart) {
  Navigator.pushNamed(context, '/heart/',
      arguments: {'heart_data': dati_heart});
}

void _toSleepPage(BuildContext context, dati_sleep) {
  Navigator.pushNamed(context, '/sleep/',
      arguments: {'sleep_data': dati_sleep});
}

void _toActivityPage(BuildContext context, dati_activity) {
  Navigator.pushNamed(context, '/activity/',
      arguments: {'activity_data': dati_activity});
}

void _toTimeSeriesPage(BuildContext context, dati_timeseries) {
  Navigator.pushNamed(context, '/timeseries/',
      arguments: {'timeseries_data': dati_timeseries});
}

// Future<void> _refresh(context, data1) async{
//   data1.refresh(context);
// }
Future<void> _addDataDB(context, dati, dati_week, usern) async {
  // final prov = Provider.of<Dati>(context);
  // dynamic passi_sett =
  //       prov.selectElementTimeseries(1);

  print('DB addDataDB FUNCTION');
  print('Lunghezza passi_settimana: ' + dati_week.length.toString());
  print('Dati immediati: ' + dati.toString());
  final userData = await Provider.of<DatabaseRepository>(context, listen: false)
      .findAllData(usern);

  print('LUNGHEZZA lista dati: ' + userData.length.toString());

  //List lista_dateDB = [];

  //int ind = 0;

  if (userData.isNotEmpty == true) {
    int ind = userData.length - 1;
    print('IND IF: ' + ind.toString());
    List lista_dateDB = [];
    for (var j = 0; j < userData.length; j++) {
      lista_dateDB.add(userData[j].retDate());
    }
    for (var i = 0; i < dati_week.length; i++) {
      var currentElement = dati_week[i];
      var currentElement_str = currentElement.toString().split(' ');
      var day_string = currentElement_str[3];
      print('DAY STRING: ' + day_string);
      var currentDay = int.parse(day_string.replaceAll(RegExp('[^0-9]+'), ''));

      //List date_to_append = [];
      //List steps_to_append = [];
      if (lista_dateDB.contains(currentDay)) {
      } else {
        ind = ind + 2;
        var date_to_insert = currentDay;
        var steps_to_insert =
            int.parse(currentElement_str[8].replaceAll(RegExp('[^0-9]+'), ''));
        print('STEPS TO INSERT: ' + steps_to_insert.toString());
        print('IND: ' + ind.toString());
        await Provider.of<DatabaseRepository>(context, listen: false)
            .insertData(
                DatiDB(ind, 1, dati, steps_to_insert, date_to_insert, usern));
      }
    }
  } else {
    int ind = 0;
    List lista_dateDB = [];

    for (var i = 0; i < dati_week.length; i++) {
      var currentElement = dati_week[i];
      var currentElement_str = currentElement.toString().split(' ');
      var day_string = currentElement_str[3];
      print('DAY STRING: ' + day_string);
      var currentDay = int.parse(day_string.replaceAll(RegExp('[^0-9]+'), ''));

      //List date_to_append = [];
      //List steps_to_append = [];
      if (lista_dateDB.contains(currentDay)) {
      } else {
        ind = ind + 2;
        var date_to_insert = currentDay;
        var steps_to_insert =
            int.parse(currentElement_str[8].replaceAll(RegExp('[^0-9]+'), ''));
        print('STEPS TO INSERT: ' + steps_to_insert.toString());
        print('IND: ' + ind.toString());
        await Provider.of<DatabaseRepository>(context, listen: false)
            .insertData(
                DatiDB(ind, 1, dati, steps_to_insert, date_to_insert, usern));
      }
    }
  }
}

// void displayCard(BuildContext context, passi) {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//             title: Text("What does Yoda have to say?"),
//             content: (double.parse(passi.printPassi()) >= 0) &
//                     (double.parse(passi.printPassi()) < 3000)
//                 ? Text("testo 1")
//                 : (double.parse(passi.printPassi()) >= 3000) &
//                         (double.parse(passi.printPassi()) < 6000)
//                     ? Text('testo 2')
//                     : (double.parse(passi.printPassi()) >= 6000) &
//                             (double.parse(passi.printPassi()) < 9000)
//                         ? Text('Testo 3')
//                         : (double.parse(passi.printPassi()) >= 9000) &
//                                 (double.parse(passi.printPassi()) < 12000)
//                             ? Text('Testo 4')
//                             : (double.parse(passi.printPassi()) >= 12000) &
//                                     (double.parse(passi.printPassi()) < 15000)
//                                 ? Text('Testo 5')
//                                 : Text('Testo 6'),
//             actions: <Widget>[
//               ElevatedButton(
//                   child: Text("Got it"),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                     Color.fromARGB(255, 0, 105, 140),
//                   )),
//                   onPressed: () {
//                     //remove the dialog popup
//                     Navigator.of(context).pop();
//                   })
//             ]);
//       });
// }

// void displayCardUnhautorize(BuildContext context) {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//             title: Text("What does Yoda have to say?"),
//             content: Text('No authorizaton to download data granted'),
//             actions: <Widget>[
//               ElevatedButton(
//                   child: Text("Got it"),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                     Color.fromARGB(255, 0, 105, 140),
//                   )),
//                   onPressed: () {
//                     //remove the dialog popup
//                     Navigator.of(context).pop();
//                   })
//             ]);
//       });
// }

void setScoreIndex(context) async {
  var sp = await SharedPreferences.getInstance();
  sp.setInt('Scores', 1);
}
