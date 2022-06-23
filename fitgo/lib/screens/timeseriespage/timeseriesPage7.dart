import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TimeseriesPage7 extends StatelessWidget {
  TimeseriesPage7({Key? key}) : super(key: key);

  static const route = '/timeseries7/';
  static const routename = 'TimeseriesPage7';

  @override
  Widget build(BuildContext context) {
    print('${TimeseriesPage7.routename} built');
    Map<dynamic, dynamic> timeseriesdata =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    dynamic timeseries_data = timeseriesdata['timeseries_data'];

    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          backgroundColor: Color.fromARGB(131, 3, 78, 4),
          title:
              Text(timeseries_data[0].toString().split(' ')[3] + ' Activity'),
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Total steps',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeseries_data[1].toString().split(' ')[8].substring(0,
                      timeseries_data[1].toString().split(' ')[8].length - 1),
                  style: TextStyle(
                      fontSize: 48, color: Color.fromARGB(131, 3, 78, 4)),
                ),
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
                          Color.fromARGB(131, 3, 78, 4),
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
                      color: Color.fromARGB(131, 3, 78, 4),
                      fontSize: 15.0,
                      //fontFamily: 'WorkSansMedium'
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(131, 3, 78, 4),
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
              'Activity data in details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.mapMarkerDistance,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Distance'),
            trailing: Text(
              double.parse(timeseries_data[2]
                          .toString()
                          .split(' ')[8]
                          .substring(
                              0,
                              timeseries_data[2]
                                      .toString()
                                      .split(' ')[8]
                                      .length -
                                  1))
                      .toStringAsFixed(3) +
                  ' km',
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.stairs,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Floors'),
            trailing: Text(
              timeseries_data[3].toString().split(' ')[8].substring(
                  0, timeseries_data[3].toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.elevationRise,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Elevation'),
            trailing: Text(
              timeseries_data[4].toString().split(' ')[8].substring(
                  0, timeseries_data[4].toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fire,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Calories'),
            trailing: Text(
              timeseries_data[0].toString().split(' ')[8].substring(
                  0, timeseries_data[0].toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fireCircle,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Activity calories'),
            trailing: Text(
              timeseries_data[9].toString().split(' ')[8].substring(
                  0, timeseries_data[9].toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.sofaSingleOutline,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes sedentary'),
            trailing: Text(
              timeseries_data[5].toString().split(' ')[8].substring(
                  0, timeseries_data[5].toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.walk,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes lightly active'),
            trailing: Text(
              timeseries_data[6].toString().split(' ')[8].substring(
                  0, timeseries_data[6].toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.run,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes fairly active'),
            trailing: Text(
              timeseries_data[7].toString().split(' ')[8].substring(
                  0, timeseries_data[7].toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.runFast,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes very active'),
            trailing: Text(
              timeseries_data[8].toString().split(' ')[8].substring(
                  0, timeseries_data[8].toString().split(' ')[8].length - 1),
            ),
          )
        ]));
  }
}
