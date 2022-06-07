//import 'package:fitgo/Charts/ActivityDB.dart';
//import 'package:fitgo/Charts/physical_activity.dart';
//import 'package:App-esame/screens/profilePage.dart';
//import 'package:App-esame/screens/settingsPage.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitgo/screens/devicePage.dart';
import 'package:fitgo/screens/weatherPage.dart';
import 'package:fitgo/utils/fitbit_data.dart';
import 'package:fitgo/utils/fitbit_data_class.dart';
import 'package:flutter/material.dart';
//import 'package:app_demo/screens/LoginPage.dart';
//import 'package:fitgo/screens/TodayPage.dart';
import 'package:fitgo/screens/loginPage.dart';
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
  TodayPage({this.passi_1, this.cal, this.index});

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
  double passi_fatti = 0;

  //dati di prova
  final dataMap = <String, double>{
    "Steps objective": 80,
    //"Walking": 15,
    //"Running": 35,
  };

  // final List<PhysicalActivity> data = [
  final colorList = <Color>[
    Colors.green,
    //Colors.blue,
    //Colors.red,
  ];

  // _HomePageState(this.topass);
  @override
  Widget build(BuildContext context) {
    //final index = Provider.of<IndicePag>(context).setIndex();
    print('l' 'indice é: ' + index.toString());
    return selectSituation(context, index);
    //Scaffold(
    // appBar: AppBar(
    //   title: Text(TodayPage.routename),),
    //body: selectSituation(context, index_1, data1),);
  }
}

Widget selectSituation(BuildContext context, index) {
  if (index == 1) {
    return situation1();
  } else {
    return situation2();
  }
}

class situation1 extends StatelessWidget {
  final dataMap = <String, double>{
    "Steps objective": 80,
    //"Walking": 15,
    //"Running": 35,
  };

  // final List<PhysicalActivity> data = [
  final colorList = <Color>[
    Colors.green,
    //Colors.blue,
    //Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Dati>(context);
    dynamic data1 = fitbit_data_class();
    dynamic data_device = fitbit_data_class();
    print('${TodayPage.routename} built');

    return FutureBuilder<List<dynamic>>(
        initialData: null,
        future: data_device.fetchDevicedata(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dati_dev = snapshot.data as List<dynamic>;
            final dati_device = dati_dev[0].toString().split(' ');
            provider.deviceData = dati_device;
            print('DATI DEVICE: ' + dati_device[0]);
            return Scaffold(
              appBar: AppBar(
                title: Text('Home Page'),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/profile/'),
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
                                  backgroundImage: NetworkImage(
                                      'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                                ),
                              ),
                              Text('Giacomo Cappon',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ))
                            ],
                          )),
                    ),
                    Consumer<Dati>(builder: (context, deviceData, _) {
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
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () => _toLoginPage(context),
                    ),
                  ],
                ),
              ),
              body: FutureBuilder<List>(
                  initialData: null,
                  future: data1.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final dati = snapshot.data as List;
                      provider.passi = dati[0];
                      provider.calorie = dati[1];
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.white30,
                                        //offset: new Offset(6.0, 6.0),
                                      ),
                                    ],
                                  ),
                                  child: Text("Welcome back Giacomo!",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, WeatherPage.route);
                                  },
                                  //icon: Icon(Icons.sunny),
                                  icon: Icon(MdiIcons.weatherPartlyCloudy),
                                  color: Colors.blue,
                                  iconSize: 40,
                                )
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 75,
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Consumer<Dati>(
                                                builder: (context, passi, _) {
                                              return Text(
                                                passi.printCalorie(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              );
                                            }),
                                            Icon(
                                              Icons
                                                  .local_fire_department_rounded,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    height: 75,
                                    width: 20,
                                  ),
                                  SizedBox(
                                      height: 75,
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Sleep",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Icon(
                                              Icons.nightlight_round_rounded,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            )
                                          ],
                                        ),
                                      )),
                                ]),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                15,
                                0,
                                0,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 320,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                        onPressed: () {},
                                        child: Consumer<Dati>(
                                            builder: (context, passi, _) {
                                          return PieChart(
                                            totalValue: 100,
                                            dataMap: dataMap,
                                            colorList: colorList,
                                            centerText: passi.printPassi(),
                                            chartType: ChartType.ring,
                                            animationDuration:
                                                Duration(milliseconds: 800),
                                            chartLegendSpacing: 32,
                                            chartRadius: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.2,
                                            legendOptions: LegendOptions(
                                              legendTextStyle: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            chartValuesOptions:
                                                ChartValuesOptions(
                                                    showChartValues: false,
                                                    showChartValuesOutside:
                                                        false),
                                          );
                                        }),
                                      ),
                                    )
                                  ]),
                            )
                          ]);
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class situation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<Passi>(context);
    // List<dynamic> lista = data.fetchData();
    // provider.passi = lista[0];
    // provider.calorie = lista[1];
    print('${TodayPage.routename} built');

    return Scaffold(
      appBar: AppBar(
        title: Text('Situation2'),
        automaticallyImplyLeading: false,
      ),
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
  final sp = await SharedPreferences.getInstance();
  sp.remove('UserName');
  sp.remove('indice');

  //Pop the drawer first
  //Then pop the HomePage
  //Navigator.pushNamed(context, '/');
  Navigator.pushNamed(context, LoginPage.route);
}

void _toDevicePage(BuildContext context, dati_device) {
  //Pop the drawer first
  //Navigator.pop(context);
  //Navigator.of(context).pushReplacementNamed(SettingsPage.route);
  Navigator.pushNamed(context, '/devicepage/',
      arguments: {'device_data': dati_device});

  //Navigator.pushNamed(context, );
  //Navigator.of(context).pushReplacementNamed(LoginPage.route);
}
