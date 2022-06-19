//import 'package:fitgo/Charts/ActivityDB.dart';
//import 'package:fitgo/Charts/physical_activity.dart';
//import 'package:App-esame/screens/profilePage.dart';
//import 'package:App-esame/screens/settingsPage.dart';
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
//import 'package:app_demo/screens/LoginPage.dart';
//import 'package:fitgo/screens/loginPage.dart';
import 'package:fitgo/screens/loginPage_2.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:app_demo/Charts/physical_activity.dart';
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
  double passi_fatti = 0;

  dynamic data1 = fitbit_data_class();

  //dati di prova
  //final dataMap = <String, double>{
  //"Steps objective": 80,
  //"Walking": 15,
  //"Running": 35,
  //};

  // final List<PhysicalActivity> data = [
  //final colorList = <Color>[
  //  Colors.green,
  //Colors.blue,
  //Colors.red,
  //];

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
      print('l' 'indice é: ' + index.toString());
      print('CREATION: ' + indpag.setCreation().toString());
      indpag.currentCreation = indpag.setCreation() + 1;
      final creat = indpag.setCreation();
      return //selectSituation(context, index, creat, data1, usern);
          Scaffold(
              appBar: AppBar(
                title: Text('Home Page'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WeatherPage.route);
                    },
                    //icon: Icon(Icons.sunny),
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
                        //Navigator.of(context)
                        //.pushReplacementNamed(ProfilePage.route),
                        child: DrawerHeader(
                            decoration: BoxDecoration(
                              color: Colors.blue,
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
                                              accountData.printImage())
                                      //NetworkImage(
                                      //  'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                                      ),
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
                                          Text(
                                              'Average daily steps:', // ${accountData.printAverageDailySteps()}',
                                              //textAlign: TextAlign.right,
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
                      //print('PROVA Account Name: '+ accountData.printName());
                      return ListTile(
                        leading: Icon(Icons.watch),
                        title: Text('Device'),
                        onTap: () => _toDevicePage(context, deviceData),
                      );
                    }),
                    ListTile(
                      leading: Icon(Icons.smoke_free),
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
                        leading: Icon(Icons.logout),
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
            provider.deviceData = dati_device;
            provider.accountData = dati_account;
            provider.heartData = dati_heart;

            _addDataDB(context, dati[0], usern);
            // Provider.of<DatabaseRepository>(context,listen:false)
            // .insertData(DatiDB(1,dati[0],usern));
            return situation1(dati: dati);
          } else {
            return Center(child: CircularProgressIndicator());
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

  //final dataMap = <String, double>{
  //"Steps objective": 80
  //"Walking": 15,
  //"Running": 35,
  //};

  // final List<PhysicalActivity> data = [
  //final colorList = <Color>[
  //Colors.green,
  //Colors.blue,
  //Colors.red,
  //];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Dati>(context);
    dynamic data1 = fitbit_data_class();
    dynamic data_device = fitbit_data_class();
    print('SITUATION 1 built');

    // _refresh(context, data1);
    //print(data1.refresh(context));
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       Consumer<Dati>(builder: (context, accountData, _) {
      //         return ElevatedButton(
      //           onPressed: () => _toProfilePage(context, accountData),
      //           //Navigator.of(context)
      //           //.pushReplacementNamed(ProfilePage.route),
      //           child: DrawerHeader(
      //               decoration: BoxDecoration(
      //                 color: Colors.blue,
      //               ),
      //               child: Row(
      //                 mainAxisAlignment:
      //                     MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   CircleAvatar(
      //                     backgroundColor: Colors.white,
      //                     minRadius: 35.0,
      //                     maxRadius: 45.0,
      //                     child: CircleAvatar(
      //                       radius: 40.0,
      //                       backgroundImage: NetworkImage(
      //                           'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
      //                     ),
      //                   ),
      //                   Text('Giacomo Cappon',
      //                       textAlign: TextAlign.right,
      //                       style: TextStyle(
      //                         fontSize: 16.0,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white,
      //                       ))
      //                 ],
      //               )),
      //         );
      //       }),
      //       Consumer<Dati>(builder: (context, deviceData, _) {
      //         return ListTile(
      //           leading: Icon(Icons.watch),
      //           title: Text('Device'),
      //           onTap: () => _toDevicePage(context, deviceData),
      //         );
      //       }),
      //       ListTile(
      //         leading: Icon(Icons.smoke_free),
      //         title: Text('Unauthorize'),
      //         onTap: () async {
      //           await FitbitConnector.unauthorize(
      //             clientID: Strings.fitbitClientID,
      //             clientSecret: Strings.fitbitClientSecret,
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.logout),
      //         title: Text('Logout'),
      //         onTap: () => _toLoginPage(context),
      //       ),
      //     ],
      //   ),
      // ),
      body:
          //Consumer<Dati>(
          //builder: (context, dati,_){
          //return
          RefreshIndicator(
        onRefresh: () async {
          List dati = await data1.fetchData();
          provider.passi = dati[0];
          provider.calorie = dati[1];
          final dati_device = dati[2].toString().split(' ');
          final dati_account = dati[3].toString().split(' ');
          final dati_heart = dati[4].toString().split(' ');
          provider.accountData = dati_account;
          provider.deviceData = dati_device;
          provider.heartData = dati_heart;
        },
        child: ListView(children: <Widget>[
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                Consumer<Dati>(builder: (context, accountData, _) {
                  return Text(
                    //Text(
                    "Welcome back ${accountData.printName()}!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  );
                }),
                // IconButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, WeatherPage.route);
                //   },

                // icon: Icon(MdiIcons.weatherPartlyCloudy),
                // color: Colors.blue,
                // iconSize: 40,
                //)
                //],
                //),
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
                          Colors.black,
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
                      color: Colors.black,
                      fontSize: 15.0,
                      //fontFamily: 'WorkSansMedium'
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.black,
                          Colors.black12,
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

          //                 Container(
          //                   child:
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(accountData.printName(),
          //                           textAlign: TextAlign.left,
          //                           style: TextStyle(
          //                             fontSize: 18.0,
          //                             fontWeight: FontWeight.bold,
          //                             color: Colors.white,
          //                           )),
          //                       Text(
          //                           'Average daily steps: ${accountData.printAverageDailySteps()}',
          //                           textAlign: TextAlign.right,
          //                           style: TextStyle(
          //                             fontSize: 12.5,
          //                             fontWeight: FontWeight.bold,
          //                             color: Colors.white,
          //                           )),
          //                     ],
          //                   )
          //                 ],
          //               )),
          //         );
          //       }),
          //       Consumer<Dati>(builder: (context, accountData, _) {
          //         return Consumer<Dati>(builder: (context, deviceData, _) {
          //           return ListTile(
          //             leading: Icon(Icons.watch),
          //             title: Text('Device'),
          //             onTap: () => _toDevicePage(context, deviceData, accountData),
          //           );
          //         });
          //       }),
          //       ListTile(
          //         leading: Icon(Icons.smoke_free),
          //         title: Text('Unauthorize'),
          //         onTap: () async {
          //           await FitbitConnector.unauthorize(
          //             clientID: Strings.fitbitClientID,
          //             clientSecret: Strings.fitbitClientSecret,
          //           );
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.logout),
          //         title: Text('Logout'),
          //         onTap: () => _toLoginPage(context),
          //       ),
          //     ],
          //   ),
          // ),
          // body: RefreshIndicator(
          //   onRefresh: () async {
          //     List dati = await data1.fetchData();
          //     provider.passi = dati[0];
          //     provider.calorie = dati[1];
          //   },
          //   child: ListView(
          //     children: <Widget>[
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Consumer<Dati>(builder: (context, accountData, _) {
          //             return Text("Welcome back ${accountData.printName()}!",
          //                 style:
          //                     TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
          //           }),
          //           IconButton(
          //             onPressed: () {
          //               Navigator.pushNamed(context, WeatherPage.route);
          //             },
          //             //icon: Icon(Icons.sunny),
          //             icon: Icon(MdiIcons.weatherPartlyCloudy),
          //             color: Colors.blue,
          //             iconSize: 40,
          //           )
          //         ],
          //       ),
          Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                0,
                20,
                10,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 150),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {},
                child: Consumer<Dati>(builder: (context, passi, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (15000 -
                                  double.parse(
                                    passi.printPassi(),
                                  ) <
                              0)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  Text(
                                    'Activity timeseries',
                                    style: TextStyle(
                                        color: Color.fromARGB(131, 3, 78, 4),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Goal reached!',
                                      style: TextStyle(
                                          color: Color.fromARGB(131, 3, 78, 4),
                                          fontSize: 18))
                                ])
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  Text(
                                    'Activity timeseries',
                                    style: TextStyle(
                                        color: Color.fromARGB(131, 3, 78, 4),
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
                                Color.fromARGB(255, 177, 251, 182),
                              ], //colorList,
                        centerText: passi.printPassi(),
                        centerTextStyle: TextStyle(
                            backgroundColor: Colors.white,
                            color: Colors.black,
                            decorationColor: Colors.white),
                        chartType: ChartType.ring,
                        animationDuration: Duration(milliseconds: 1000),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions: LegendOptions(
                            legendTextStyle: TextStyle(color: Colors.black)),
                        chartValuesOptions: ChartValuesOptions(
                            showChartValues: false,
                            showChartValuesOutside: false),
                      ),
                    ],
                  );
                }),
              )),

          Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              0,
              20,
              10,
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(155, 310),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<Dati>(builder: (context, passi, _) {
                        return Text(
                          passi.printCalorie(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        );
                      }),
                      Icon(
                        Icons.local_fire_department_rounded,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(155, 310),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sleep",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Icon(
                        Icons.nightlight_round_rounded,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ],
                  ),
                ),
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
            child: Consumer<Dati>(builder: (context, heartData, _) {
              dynamic todayheartdata = heartData.subList(192, null);
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
                          style: TextStyle(color: Colors.red, fontSize: 18),
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
                    fixedSize: const Size(320, 150),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              );
            }),
          )
        ]),
      ),
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

    return Scaffold(
      //appBar: AppBar(
      //title: Text('Situation2'),
      //automaticallyImplyLeading: false,
      //),
      body: Center(
        child: Column(children: [
          Text('not auth'),
          ElevatedButton(
              onPressed: () async {
                final sp = await SharedPreferences.getInstance();
                sp.remove('UserName');
                //final index = await SharedPreferences.getInstance();
                sp.remove('indice');
                Navigator.pushNamed(context, LoginPage.route);
              },
              child: Text('LogOut'))
        ]),
      ),
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

// Future<void> _refresh(context, data1) async{
//   data1.refresh(context);
// }
Future<void> _addDataDB(context, dati, usern) async {
  await Provider.of<DatabaseRepository>(context, listen: false)
      .insertData(DatiDB(1, dati, usern));
}
