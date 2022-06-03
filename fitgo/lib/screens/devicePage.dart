import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitgo/models/passi.dart';

class DevicePage extends StatelessWidget {
  static const route = '/devicepage/';
  static const routename = 'DevicePage';

  @override
  Widget build(BuildContext context) {
    final device_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    print(device_data['device_data']);
    print(device_data['device_data'].printDeviceId());

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
              height: 180,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('"name" Fitbit',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        Text('Battery level ',
                            style: TextStyle(color: Colors.white, fontSize: 18))
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
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(MdiIcons.watchExport),
            title: Text('Device version'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(MdiIcons.chartBubble),
            title: Text('Device Id'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(MdiIcons.watchVibrate),
            title: Text('Last synchronization'),
            trailing: Icon(Icons.arrow_right),
          ),
        ]));
  }
}
