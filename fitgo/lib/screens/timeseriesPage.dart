import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:fitgo/models/passi.dart';
import 'package:provider/provider.dart';

class TimeseriesPage extends StatelessWidget {
  TimeseriesPage({Key? key}) : super(key: key);

  static const route = '/timeseries/';
  static const routename = 'TimeseriesPage';

  @override
  Widget build(BuildContext context) {
    print('${TimeseriesPage.routename} built');
    Map<dynamic, dynamic> timeseries_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;

    dynamic timeseries_calories =
        timeseries_data['timeseries_data'].selectElementTimeseries(0);
    dynamic timeseries_steps =
        timeseries_data['timeseries_data'].selectElementTimeseries(1);
    dynamic timeseries_distance =
        timeseries_data['timeseries_data'].selectElementTimeseries(2);
    dynamic timeseries_floors =
        timeseries_data['timeseries_data'].selectElementTimeseries(3);
    dynamic timeseries_elevation =
        timeseries_data['timeseries_data'].selectElementTimeseries(4);
    dynamic timeseries_minutesSedentary =
        timeseries_data['timeseries_data'].selectElementTimeseries(5);
    dynamic timeseries_minutesLightliActive =
        timeseries_data['timeseries_data'].selectElementTimeseries(6);
    dynamic timeseries_minutesFairlyActive =
        timeseries_data['timeseries_data'].selectElementTimeseries(7);
    dynamic timeseries_minutesVeryActive =
        timeseries_data['timeseries_data'].selectElementTimeseries(8);
    dynamic timeseries_activityCalories =
        timeseries_data['timeseries_data'].selectElementTimeseries(9);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(131, 3, 78, 4),
          title: Text('Activity Timeseries'),
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Today total steps',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeseries_steps.last.toString().split(' ')[8].substring(
                      0,
                      timeseries_steps.last.toString().split(' ')[8].length -
                          1),
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
        ]));
  }
}
