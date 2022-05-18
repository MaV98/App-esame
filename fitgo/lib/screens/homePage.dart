//import 'package:fitgo/Charts/ActivityDB.dart';
//import 'package:fitgo/Charts/physical_activity.dart';
//import 'package:App-esame/screens/profilePage.dart';
//import 'package:App-esame/screens/settingsPage.dart';
import 'package:flutter/material.dart';
//import 'package:app_demo/screens/LoginPage.dart';
import 'package:fitgo/screens/homePage.dart';
import 'package:fitgo/screens/loginPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//import 'package:app_demo/Charts/physical_activity.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  //final void Function(int) changePage;

  static const route = '/home/';
  static const routename = 'HomePage';

  //dati di prova
  // final List<PhysicalActivity> data = [
  //   PhysicalActivity(
  //       typeofactivity: 'Pre Work Out', minutes: 10, barColor: Colors.blue),
  //   PhysicalActivity(
  //       typeofactivity: 'Walking', minutes: 20, barColor: Colors.green),
  //   PhysicalActivity(
  //       typeofactivity: 'Running', minutes: 30, barColor: Colors.red),
  // ];
  final dataMap = <String, double>{
    "Pre work out": 10,
    "Walking": 15,
    "Running": 35,
  };

  // final List<PhysicalActivity> data = [
  //   PhysicalActivity(typeofactivity: "Pre work out", minutes: 10),
  //   PhysicalActivity(typeofactivity: "Wolking", minutes: 25),
  //   PhysicalActivity(typeofactivity: "Running", minutes: 35),
  // ];

  final colorList = <Color>[
    Colors.green,
    Colors.blue,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    //print(data[1].minutes);
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
                        Text('Leonardo Palmeiro',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))
                      ],
                    )),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => _toSettingPage(context),
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
                child: Text("Welcome back Leonardo!",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              IconButton(
                onPressed: () {},
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
                      Text(
                        "Calories",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Icon(
                        Icons.local_fire_department_rounded,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
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
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Icon(
                        Icons.nightlight_round_rounded,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ],
                  ),
                )),
            // Container(
            //   padding: EdgeInsets.all(15),
            //   margin: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.blue, width: 2),
            //     borderRadius: BorderRadius.circular(8),
            //     boxShadow: [
            //       new BoxShadow(
            //         color: Colors.white30,
            //         //offset: new Offset(6.0, 6.0),
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     children: [
            //       Text("Calories", style: TextStyle(fontSize: 15)),
            //       Icon(Icons.local_fire_department_rounded)
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(15),
            //   margin: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.blue, width: 2),
            //     borderRadius: BorderRadius.circular(8),
            //     boxShadow: [
            //       new BoxShadow(
            //         color: Colors.white30,
            //         //offset: new Offset(6.0, 6.0),
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     children: [
            //       Text("Sleep", style: TextStyle(fontSize: 15)),
            //       Icon(Icons.nightlight_round_rounded)
            //     ],
            //   ),
            // )
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
                      child: PieChart(
                        dataMap: dataMap,
                        colorList: colorList,
                        centerText: 'TOT',
                        chartType: ChartType.ring,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions: LegendOptions(
                          legendTextStyle: TextStyle(color: Colors.black),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                            showChartValues: false,
                            showChartValuesOutside: false),
                      ),
                    ),
                  )
                ]),
          )
        ]));
  }
}

void _toLoginPage(BuildContext context) {
  //Pop the drawer first
  Navigator.pop(context);
  //Then pop the HomePage
  //Navigator.pushNamed(context, '/');
  Navigator.of(context).pushReplacementNamed(LoginPage.route);
}

void _toSettingPage(BuildContext context) {
  //Pop the drawer first
  //Navigator.pop(context);
  //Navigator.of(context).pushReplacementNamed(SettingsPage.route);
  Navigator.pushNamed(context, '/settings/');
  //Navigator.pushNamed(context, );
  //Navigator.of(context).pushReplacementNamed(LoginPage.route);
}
