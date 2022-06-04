//import 'package:fitgo/Charts/ActivityDB.dart';
//import 'package:fitgo/Charts/physical_activity.dart';
//import 'package:App-esame/screens/profilePage.dart';
//import 'package:App-esame/screens/settingsPage.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:fitgo/models/passi.dart';
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
  TodayPage({this.passi_1, this.cal});

  static const route = '/todaypage/';
  static const routename = 'TodayPage';

//   @override
//   State<TodayPage> createState() => _TodayPageState(this.topass);
// }

// class _TOdayPageState extends State<TodayPage> {
//   Map<String, dynamic>? topass;
  final passi_totali = fitbit_data();
  final calorie_totali = fitbit_data();
  final data = fitbit_data_class();

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
    var provider = Provider.of<Dati>(context);
    print('${TodayPage.routename} built');

    return Consumer<Dati>(builder: (context, value, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/profile/'),
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
                          Text('Giorgio Cappon',
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
                  leading: Icon(Icons.check_circle),
                  title: Text('Authorize'),
                  onTap: () async {
                    List<dynamic> lista = await data.fetchdata(context);
                    List<dynamic> device_data =
                        await data.fetchDevicedata(context);
                    device_data = device_data[0].toString().split(' ');
                    print(device_data);
                    passi_totali.copy(lista[0]);
                    passi_totali.stampa();

                    calorie_totali.copy(lista[1]);
                    calorie_totali.stampa();

                    provider.passi = lista[0];
                    provider.calorie = lista[1];
                    provider.deviceData = device_data;
                  },
                ),
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
          body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.white30,
                        //offset: new Offset(6.0, 6.0),
                      ),
                    ],
                  ),
                  child: Text("Welcome back Giorgio!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, WeatherPage.route);
                  },
                  //icon: Icon(Icons.sunny),
                  icon: Icon(MdiIcons.weatherPartlyCloudy),
                  color: Colors.blue,
                  iconSize: 40,
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 75,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sleep",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Icon(
                          Icons.nightlight_round_rounded,
                          color: Color.fromARGB(255, 0, 0, 0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 320,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                        child: Consumer<Dati>(builder: (context, passi, _) {
                          return PieChart(
                            totalValue: 100,
                            dataMap: dataMap,
                            colorList: colorList,
                            centerText: passi.printPassi(),
                            chartType: ChartType.ring,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 32,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            legendOptions: LegendOptions(
                              legendTextStyle: TextStyle(color: Colors.black),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValues: false,
                                showChartValuesOutside: false),
                          );
                        }),
                      ),
                    )
                  ]),
            )
          ]));
    });
  }
}

void _toLoginPage(BuildContext context) async {
  //Unset the 'username' filed in SharedPreference
  final sp = await SharedPreferences.getInstance();
  sp.remove('username');

  //Pop the drawer first
  Navigator.pop(context);
  //Then pop the HomePage
  //Navigator.pushNamed(context, '/');
  Navigator.of(context).pushReplacementNamed(LoginPage.route);
}

void _toDevicePage(BuildContext context, device_data) {
  //Pop the drawer first
  //Navigator.pop(context);
  //Navigator.of(context).pushReplacementNamed(SettingsPage.route);
  Navigator.pushNamed(context, '/devicepage/',
      arguments: {'device_data': device_data});
  //Navigator.pushNamed(context, );
  //Navigator.of(context).pushReplacementNamed(LoginPage.route);
}
