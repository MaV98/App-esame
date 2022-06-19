import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HeartDataPage6 extends StatelessWidget {
  HeartDataPage6({Key? key}) : super(key: key);

  static const route = '/heart6/';
  static const routename = 'HeartDataPage6';

  @override
  Widget build(BuildContext context) {
    print('${HeartDataPage6.routename} built');
    Map<dynamic, dynamic> heart_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    dynamic heartdata6 = heart_data['heart_data'];

    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          backgroundColor: Colors.red,
          title: Text(heartdata6[3].toString() + ' Heart Activity'),
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Resting heart rate',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heartdata6[30]
                      .substring(0, heartdata6[30].toString().length - 1)
                      .toString(),
                  style: TextStyle(fontSize: 48, color: Colors.red),
                ),
                Text('BPM',
                    style: TextStyle(
                      fontSize: 18,
                    ))
              ],
            ),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              20,
              15,
              20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.black12,
                          Colors.red,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 155.0,
                  height: 2.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(
                    'o',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                      //fontFamily: 'WorkSansMedium'
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.red,
                          Colors.black12,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 155.0,
                  height: 2.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              0,
              0,
              0,
            ),
            child: Text(
              'Out of active range',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fire,
              color: Colors.red,
            ),
            title: Text('Calories spent out of active range'),
            trailing: Text(double.parse(heartdata6[6]
                    .substring(0, heartdata6[6].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the out of active range'),
            trailing: Text(double.parse(heartdata6[8]
                    .substring(0, heartdata6[8].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent out of active range'),
            trailing: Text(double.parse(heartdata6[10]
                    .substring(0, heartdata6[10].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              20,
              0,
              0,
            ),
            child: Text(
              'Fat burn range',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fire,
              color: Colors.red,
            ),
            title: Text('Calories spent in the fat burn range'),
            trailing: Text(double.parse(heartdata6[12]
                    .substring(0, heartdata6[12].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the fat burn range'),
            trailing: Text(double.parse(heartdata6[14]
                    .substring(0, heartdata6[14].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent in the fat burn range'),
            trailing: Text(double.parse(heartdata6[16]
                    .substring(0, heartdata6[16].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              20,
              0,
              0,
            ),
            child: Text(
              'Cardio range',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fire,
              color: Colors.red,
            ),
            title: Text('Calories spent in the cardio range'),
            trailing: Text(double.parse(heartdata6[18]
                    .substring(0, heartdata6[18].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the cardio range'),
            trailing: Text(double.parse(heartdata6[20]
                    .substring(0, heartdata6[20].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent in the cardio range'),
            trailing: Text(double.parse(heartdata6[22]
                    .substring(0, heartdata6[22].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              20,
              0,
              0,
            ),
            child: Text(
              'Peak range',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fire,
              color: Colors.red,
            ),
            title: Text('Calories spent in the peak range'),
            trailing: Text(double.parse(heartdata6[24]
                    .substring(0, heartdata6[24].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the peak range'),
            trailing: Text(double.parse(heartdata6[26]
                    .substring(0, heartdata6[26].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent in the peak range'),
            trailing: Text(double.parse(heartdata6[28]
                    .substring(0, heartdata6[28].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
        ]));
  }
}
