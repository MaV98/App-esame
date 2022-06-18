import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitgo/models/passi.dart';

class DevicePage extends StatelessWidget {
  List<dynamic>? device_data;
  //List<dynamic>? account_data;
  DevicePage({this.device_data}); //, this.account_data

  static const route = '/devicepage/';
  static const routename = 'DevicePage';

  @override
  Widget build(BuildContext context) {
    print('${DevicePage.routename} built');
    Map<dynamic, dynamic> fetch_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF2196F3),
          title: Text('Device'),
        ),
        body: ListView(children: [
          // SizedBox(
          //   height: 30,
          // ),
          // Container(
          //   height: 240,
          //   child: Image.asset(
          //     'assets/fit2.png',
          //   ),
          // ),
          Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 54, 184, 244),
                    Color.fromARGB(255, 65, 212, 238)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/fit2.png',
                      ),
                    ),
                    fetch_data['device_data'].isEmpty()
                        ? Text('Data not available',
                            style: TextStyle(color: Colors.white, fontSize: 18))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${fetch_data['device_data'].printName()}'s Fitbit", //account_data
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              Text(
                                  'Battery level: ${fetch_data['device_data'].printBatteryLevel()}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))
                            ],
                          )
                  ])),
          // SizedBox(
          //   height: 30,
          // ),
          // ListTile(
          //   leading: Icon(Icons.battery_0_bar),
          //   title: Text('Battery level'),
          //   trailing: Icon(Icons.arrow_right),
          // ),
          ListTile(
            leading: Icon(Icons.watch),
            title: Text('Device type'),
            trailing: fetch_data['device_data'].isEmpty()
                ? Text('Data not available')
                : Text(fetch_data['device_data'].printType()),
          ),
          ListTile(
            leading: Icon(MdiIcons.watchExport),
            title: Text('Device version'),
            trailing: fetch_data['device_data'].isEmpty()
                ? Text('Data not available')
                : Text(fetch_data['device_data'].printDeviceVersion()),
          ),
          ListTile(
            leading: Icon(MdiIcons.chartBubble),
            title: Text('Device Id'),
            trailing: fetch_data['device_data'].isEmpty()
                ? Text('Data not available')
                : Text(fetch_data['device_data'].printDeviceId()),
          ),
          ListTile(
            leading: Icon(MdiIcons.watchVibrate),
            title: Text('Last synch.'),
            trailing: fetch_data['device_data'].isEmpty()
                ? Text('Data not available')
                : Text(fetch_data['device_data'].printLastSyncTime()),
          ),
        ]));
  }
}
