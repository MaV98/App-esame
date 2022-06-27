// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

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

    dynamic timeseries2 = [];
    timeseries2.add(timeseries_calories[5]);
    timeseries2.add(timeseries_steps[5]);
    timeseries2.add(timeseries_distance[5]);
    timeseries2.add(timeseries_floors[5]);
    timeseries2.add(timeseries_elevation[5]);
    timeseries2.add(timeseries_minutesSedentary[5]);
    timeseries2.add(timeseries_minutesLightliActive[5]);
    timeseries2.add(timeseries_minutesFairlyActive[5]);
    timeseries2.add(timeseries_minutesVeryActive[5]);
    timeseries2.add(timeseries_activityCalories[5]);

    dynamic timeseries3 = [];
    timeseries3.add(timeseries_calories[4]);
    timeseries3.add(timeseries_steps[4]);
    timeseries3.add(timeseries_distance[4]);
    timeseries3.add(timeseries_floors[4]);
    timeseries3.add(timeseries_elevation[4]);
    timeseries3.add(timeseries_minutesSedentary[4]);
    timeseries3.add(timeseries_minutesLightliActive[4]);
    timeseries3.add(timeseries_minutesFairlyActive[4]);
    timeseries3.add(timeseries_minutesVeryActive[4]);
    timeseries3.add(timeseries_activityCalories[4]);

    dynamic timeseries4 = [];
    timeseries4.add(timeseries_calories[3]);
    timeseries4.add(timeseries_steps[3]);
    timeseries4.add(timeseries_distance[3]);
    timeseries4.add(timeseries_floors[3]);
    timeseries4.add(timeseries_elevation[3]);
    timeseries4.add(timeseries_minutesSedentary[3]);
    timeseries4.add(timeseries_minutesLightliActive[3]);
    timeseries4.add(timeseries_minutesFairlyActive[3]);
    timeseries4.add(timeseries_minutesVeryActive[3]);
    timeseries4.add(timeseries_activityCalories[3]);

    dynamic timeseries5 = [];
    timeseries5.add(timeseries_calories[2]);
    timeseries5.add(timeseries_steps[2]);
    timeseries5.add(timeseries_distance[2]);
    timeseries5.add(timeseries_floors[2]);
    timeseries5.add(timeseries_elevation[2]);
    timeseries5.add(timeseries_minutesSedentary[2]);
    timeseries5.add(timeseries_minutesLightliActive[2]);
    timeseries5.add(timeseries_minutesFairlyActive[2]);
    timeseries5.add(timeseries_minutesVeryActive[2]);
    timeseries5.add(timeseries_activityCalories[2]);

    dynamic timeseries6 = [];
    timeseries6.add(timeseries_calories[1]);
    timeseries6.add(timeseries_steps[1]);
    timeseries6.add(timeseries_distance[1]);
    timeseries6.add(timeseries_floors[1]);
    timeseries6.add(timeseries_elevation[1]);
    timeseries6.add(timeseries_minutesSedentary[1]);
    timeseries6.add(timeseries_minutesLightliActive[1]);
    timeseries6.add(timeseries_minutesFairlyActive[1]);
    timeseries6.add(timeseries_minutesVeryActive[1]);
    timeseries6.add(timeseries_activityCalories[1]);

    dynamic timeseries7 = [];
    timeseries7.add(timeseries_calories[0]);
    timeseries7.add(timeseries_steps[0]);
    timeseries7.add(timeseries_distance[0]);
    timeseries7.add(timeseries_floors[0]);
    timeseries7.add(timeseries_elevation[0]);
    timeseries7.add(timeseries_minutesSedentary[0]);
    timeseries7.add(timeseries_minutesLightliActive[0]);
    timeseries7.add(timeseries_minutesFairlyActive[0]);
    timeseries7.add(timeseries_minutesVeryActive[0]);
    timeseries7.add(timeseries_activityCalories[0]);

    int steps_count = 0;
    for (var i = 0; i < timeseries_steps.length; i++) {
      var currentElement = timeseries_steps[i];
      var currentElement_value = double.parse(
        currentElement
            .toString()
            .split(' ')[8]
            .substring(0, currentElement.toString().split(' ')[8].length - 1),
      );
      if (currentElement_value >= 15000) {
        ++steps_count;
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(131, 3, 78, 4),
          title: Text('Today Timeseries Activity'),
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
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.mapMarkerDistance,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Distance'),
            trailing: Text(double.parse(timeseries_distance.last
                        .toString()
                        .split(' ')[8]
                        .substring(
                            0,
                            timeseries_distance.last
                                    .toString()
                                    .split(' ')[8]
                                    .length -
                                1))
                    .toStringAsFixed(3) +
                ' km'),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.stairs,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Floors'),
            trailing: Text(
              timeseries_floors.last.toString().split(' ')[8].substring(0,
                  timeseries_floors.last.toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.elevationRise,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Elevation'),
            trailing: Text(
              timeseries_elevation.last.toString().split(' ')[8].substring(
                  0,
                  timeseries_elevation.last.toString().split(' ')[8].length -
                      1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fire,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Calories'),
            trailing: Text(
              timeseries_calories.last.toString().split(' ')[8].substring(0,
                  timeseries_calories.last.toString().split(' ')[8].length - 1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fireCircle,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Activity calories'),
            trailing: Text(
              timeseries_activityCalories.last
                  .toString()
                  .split(' ')[8]
                  .substring(
                      0,
                      timeseries_activityCalories.last
                              .toString()
                              .split(' ')[8]
                              .length -
                          1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.sofaSingleOutline,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes sedentary'),
            trailing: Text(
              timeseries_minutesSedentary.last
                  .toString()
                  .split(' ')[8]
                  .substring(
                      0,
                      timeseries_minutesSedentary.last
                              .toString()
                              .split(' ')[8]
                              .length -
                          1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.walk,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes lightly active'),
            trailing: Text(
              timeseries_minutesLightliActive.last
                  .toString()
                  .split(' ')[8]
                  .substring(
                      0,
                      timeseries_minutesLightliActive.last
                              .toString()
                              .split(' ')[8]
                              .length -
                          1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.run,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes fairly active'),
            trailing: Text(
              timeseries_minutesFairlyActive.last
                  .toString()
                  .split(' ')[8]
                  .substring(
                      0,
                      timeseries_minutesFairlyActive.last
                              .toString()
                              .split(' ')[8]
                              .length -
                          1),
            ),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.runFast,
              color: Color.fromARGB(131, 3, 78, 4),
            ),
            title: Text('Minutes very active'),
            trailing: Text(
              timeseries_minutesVeryActive.last
                  .toString()
                  .split(' ')[8]
                  .substring(
                      0,
                      timeseries_minutesVeryActive.last
                              .toString()
                              .split(' ')[8]
                              .length -
                          1),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              20,
              0,
              0,
            ),
            child: Text(
              'Steps of the past week',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 20, right: 5, left: 5),
            width: 350,
            height: 350,
            child: Chart(
              data: [
                {
                  'month-day': timeseries_steps.last
                      .toString()
                      .split(' ')[3]
                      .substring(5)
                      .toString(),
                  'steps': double.parse(timeseries_steps.last
                      .toString()
                      .split(' ')[8]
                      .substring(
                          0,
                          timeseries_steps.last
                                  .toString()
                                  .split(' ')[8]
                                  .length -
                              1))
                },
                {
                  'month-day': timeseries_steps[5]
                      .toString()
                      .split(' ')[3]
                      .substring(5)
                      .toString(),
                  'steps': double.parse(timeseries_steps[5]
                      .toString()
                      .split(' ')[8]
                      .substring(
                          0,
                          timeseries_steps[5].toString().split(' ')[8].length -
                              1))
                },
                {
                  'month-day': timeseries_steps[4]
                      .toString()
                      .split(' ')[3]
                      .substring(5)
                      .toString(),
                  'steps': double.parse(timeseries_steps[4]
                      .toString()
                      .split(' ')[8]
                      .substring(
                          0,
                          timeseries_steps[4].toString().split(' ')[8].length -
                              1))
                },
                {
                  'month-day': timeseries_steps[3]
                      .toString()
                      .split(' ')[3]
                      .substring(5)
                      .toString(),
                  'steps': double.parse(timeseries_steps[3]
                      .toString()
                      .split(' ')[8]
                      .substring(
                          0,
                          timeseries_steps[3].toString().split(' ')[8].length -
                              1))
                },
                {
                  'month-day': timeseries_steps[2]
                      .toString()
                      .split(' ')[3]
                      .substring(5)
                      .toString(),
                  'steps': double.parse(timeseries_steps[2]
                      .toString()
                      .split(' ')[8]
                      .substring(
                          0,
                          timeseries_steps[2].toString().split(' ')[8].length -
                              1))
                },
                {
                  'month-day': timeseries_steps[1]
                      .toString()
                      .split(' ')[3]
                      .substring(5)
                      .toString(),
                  'steps': double.parse(timeseries_steps[1]
                      .toString()
                      .split(' ')[8]
                      .substring(
                          0,
                          timeseries_steps[1].toString().split(' ')[8].length -
                              1))
                },
                {
                  'month-day': timeseries_steps[0]
                      .toString()
                      .split(' ')[3]
                      .substring(5)
                      .toString(),
                  'steps': double.parse(timeseries_steps[0]
                      .toString()
                      .split(' ')[8]
                      .substring(
                          0,
                          timeseries_steps[0].toString().split(' ')[8].length -
                              1))
                },
              ],
              variables: {
                'month-day': Variable(
                  accessor: (Map map) => map['month-day'] as String,
                ),
                'steps': Variable(
                  accessor: (Map map) => map['steps'] as num,
                ),
              },
              elements: [
                IntervalElement(
                    elevation: ElevationAttr(value: 0, updaters: {
                      'tap': {true: (_) => 5}
                    }),
                    color: ColorAttr(
                        value: Color.fromARGB(131, 3, 78, 4),
                        updaters: {
                          'tap': {false: (color) => color.withAlpha(100)}
                        }),
                    selected: {
                      'tap': {0}
                    },
                    size: SizeAttr(value: 5)),
              ],
              //coord: RectCoord(color: const Color(0xffdddddd)),
              axes: [
                Defaults.horizontalAxis,
                Defaults.verticalAxis,
              ],
              selections: {
                'touchMove': PointSelection(
                  on: {
                    GestureType.scaleUpdate,
                    GestureType.tapDown,
                    GestureType.longPressMoveUpdate
                  },
                  dim: Dim.x,
                )
              },
              tooltip: TooltipGuide(
                followPointer: [true, true],
                align: Alignment.topLeft,
                offset: const Offset(-20, -20),
              ),
              crosshair: CrosshairGuide(followPointer: [false, false]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              10,
              15,
              10,
            ),
            child: Text(
                "You have reached the 15000 steps goal ${steps_count} times this week"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Review your past week data',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _toTimeseriesPage(
                              context, '/timeseries2/', timeseries2);
                        },
                        child: Text(timeseries2[0].toString().split(' ')[3]),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(131, 3, 78, 4),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toTimeseriesPage(
                              context, '/timeseries3/', timeseries3);
                        },
                        child: Text(timeseries3[0].toString().split(' ')[3]),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(131, 3, 78, 4),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toTimeseriesPage(
                              context, '/timeseries4/', timeseries4);
                        },
                        child: Text(timeseries4[0].toString().split(' ')[3]),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(131, 3, 78, 4),
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _toTimeseriesPage(
                              context, '/timeseries5/', timeseries5);
                        },
                        child: Text(timeseries5[0].toString().split(' ')[3]),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(131, 3, 78, 4),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toTimeseriesPage(
                              context, '/timeseries6/', timeseries6);
                        },
                        child: Text(timeseries6[0].toString().split(' ')[3]),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(131, 3, 78, 4),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toTimeseriesPage(
                              context, '/timeseries6/', timeseries7);
                        },
                        child: Text(timeseries7[0].toString().split(' ')[3]),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(131, 3, 78, 4),
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ]));
  }
}

void _toTimeseriesPage(
    BuildContext context, String page_name, dati_timeseries) {
  Navigator.pushNamed(context, page_name,
      arguments: {'timeseries_data': dati_timeseries});
}
