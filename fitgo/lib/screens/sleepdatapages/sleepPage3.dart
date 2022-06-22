import 'package:fitgo/models/passi.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SleepDataPage3 extends StatelessWidget {
  SleepDataPage3({Key? key}) : super(key: key);

  static const route = '/sleep3/';
  static const routename = 'SleepDataPage3';

  @override
  Widget build(BuildContext context) {
    print('${SleepDataPage3.routename} built');
    Map<dynamic, dynamic> sleep_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    dynamic sleepdata3 = sleep_data['sleep_data'];

    var provider = Provider.of<Dati>(context);
    if (sleepdata3.isNotEmpty) {
      dynamic start = sleepdata3[0]
          .toString()
          .split(' ')[7]
          .toString()
          .substring(
              0, sleepdata3[0].toString().split(' ')[7].toString().length - 5)
          .toString();
      dynamic end = sleepdata3[sleepdata3.length - 1]
          .toString()
          .split(' ')[7]
          .toString()
          .substring(
              0,
              sleepdata3[sleepdata3.length - 1]
                      .toString()
                      .split(' ')[7]
                      .toString()
                      .length -
                  5)
          .toString();
      final start_end = [];
      start_end.add(start);
      start_end.add(end);
      provider.startEnd = start_end;
    }

    if (sleepdata3.isNotEmpty) {
      dynamic todayDate = sleepdata3[0].toString().split(' ')[3].toString();
      provider.todaysleepdate = [todayDate];
    } else {
      provider.todaysleepdate = ['2022-00-01'];
    }

    //total sleep3 duration
    int count_totalSleep = 0;
    if (sleepdata3.isEmpty) {
      count_totalSleep = 0;
    } else {
      for (var i = 0; i < sleepdata3.length; i++) {
        var currentElement_totalsleep = sleepdata3[i];
        var currentElement_str_totalsleep =
            currentElement_totalsleep.toString().split(' ');
        if (currentElement_str_totalsleep[9]
                .substring(
                    0, currentElement_str_totalsleep[9].toString().length - 1)
                .toString() !=
            'wake') {
          ++count_totalSleep;
        }
      }
    }

    double seconds_totalsleep = count_totalSleep * 30;
    double total_minutes_totalsleep = seconds_totalsleep / 60;
    double hour_totalsleep = total_minutes_totalsleep / 60;
    double resto_totalsleep = hour_totalsleep - hour_totalsleep.toInt();
    double minutes_totalsleep = resto_totalsleep * 60;
    dynamic todaytotalsleeps_united = double.parse(
        hour_totalsleep.toInt().toString() +
            '.' +
            minutes_totalsleep.toInt().toString());

    //wake
    int count_wake = 0;
    if (sleepdata3.isEmpty) {
      count_wake = 0;
    } else {
      for (var i = 0; i < sleepdata3.length; i++) {
        var currentElement_wake = sleepdata3[i];
        var currentElement_str_wake = currentElement_wake.toString().split(' ');
        if (currentElement_str_wake[9]
                .substring(0, currentElement_str_wake[9].toString().length - 1)
                .toString() ==
            'wake') {
          ++count_wake;
        }
      }
    }

    double seconds_wake = count_wake * 30;
    double total_minutes_wake = seconds_wake / 60;
    double hour_wake = total_minutes_wake / 60;
    double resto_wake = hour_wake - hour_wake.toInt();
    double minutes_wake = resto_wake * 60;

    //light
    int count_light = 0;
    if (sleepdata3.isEmpty) {
      count_light = 0;
    } else {
      for (var i = 0; i < sleepdata3.length; i++) {
        var currentElement_light = sleepdata3[i];
        var currentElement_str_light =
            currentElement_light.toString().split(' ');
        if (currentElement_str_light[9]
                .substring(0, currentElement_str_light[9].toString().length - 1)
                .toString() ==
            'light') {
          ++count_light;
        }
      }
    }

    double seconds_light = count_light * 30;
    double total_minutes_light = seconds_light / 60;
    double hour_light = total_minutes_light / 60;
    double resto_light = hour_light - hour_light.toInt();
    double minutes_light = resto_light * 60;

    //deep
    int count_deep = 0;
    if (sleepdata3.isEmpty) {
      count_deep = 0;
    } else {
      for (var i = 0; i < sleepdata3.length; i++) {
        var currentElement_deep = sleepdata3[i];
        var currentElement_str_deep = currentElement_deep.toString().split(' ');
        if (currentElement_str_deep[9]
                .substring(0, currentElement_str_deep[9].toString().length - 1)
                .toString() ==
            'deep') {
          ++count_deep;
        }
      }
    }

    double seconds_deep = count_deep * 30;
    double total_minutes_deep = seconds_deep / 60;
    double hour_deep = total_minutes_deep / 60;
    double resto_deep = hour_deep - hour_deep.toInt();
    double minutes_deep = resto_deep * 60;

    //rem
    int count_rem = 0;
    if (sleepdata3.isEmpty) {
      count_rem = 0;
    } else {
      for (var i = 0; i < sleepdata3.length; i++) {
        var currentElement_rem = sleepdata3[i];
        var currentElement_str_rem = currentElement_rem.toString().split(' ');
        if (currentElement_str_rem[9]
                .substring(0, currentElement_str_rem[9].toString().length - 1)
                .toString() ==
            'rem') {
          ++count_rem;
        }
      }
    }

    double seconds_rem = count_rem * 30;
    double total_minutes_rem = seconds_rem / 60;
    double hour_rem = total_minutes_rem / 60;
    double resto_rem = hour_rem - hour_rem.toInt();
    double minutes_rem = resto_rem * 60;

    dynamic data = [
      {'time': '', 'level': ''}
    ];
    if (sleepdata3.isEmpty) {
    } else {
      for (var i = 0; i < sleepdata3.length; i++) {
        var currentelement = sleepdata3[i];
        var currentelement_ = currentelement.toString().split(' ');
        var currentelement_time = currentelement_[7]
            .toString()
            .substring(0, currentelement_[7].toString().length - 1)
            .toString();
        var currentelement_level = currentelement_[9]
            .toString()
            .substring(0, currentelement_[9].toString().length - 1)
            .toString();
        dynamic data_map = {
          'time': currentelement_time,
          'level': currentelement_level
        };
        data.add(data_map);
      }
    }

    return Consumer<Dati>(builder: (context, sleepdate3, _) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: sleepdata3.isNotEmpty
                  ? Text(sleepdate3.selectElement3(0).toString() +
                      ' Sleep Activity')
                  : Text('No data')),
          body: ListView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              sleepdata3.isEmpty
                  ? Column(
                      children: [
                        Text(
                          'No sleep activity registered',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Device on charge',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : Column(children: [
                      Text(
                        'Last sleep duration',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${hour_totalsleep.toInt()}h ${minutes_totalsleep.toInt()}min',
                            style: TextStyle(
                                fontSize: 48, color: Colors.deepPurple),
                          ),
                        ],
                      ),
                    ])
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
                            Colors.deepPurple,
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
                        color: Colors.deepPurple,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            Colors.deepPurple,
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
            sleepdata3.isNotEmpty
                ? Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        15,
                        0,
                        0,
                        0,
                      ),
                      child: Text(
                        'Sleep activity data in details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Consumer<Dati>(builder: (context, startEnd, _) {
                      return ListTile(
                          leading: Icon(
                            MdiIcons.clockStart,
                            color: Colors.deepPurple,
                          ),
                          title: Text('Monitoring start time'),
                          trailing: Text(
                              startEnd.selectElementStartEnd(0).toString()));
                    }),
                    Consumer<Dati>(builder: (context, startEnd, _) {
                      return ListTile(
                        leading: Icon(
                          MdiIcons.clockEnd,
                          color: Colors.deepPurple,
                        ),
                        title: Text('Monitoring end time'),
                        trailing:
                            Text(startEnd.selectElementStartEnd(1).toString()),
                      );
                    }),
                    ListTile(
                      leading: Icon(
                        MdiIcons.sleepOff,
                        color: Colors.deepPurple,
                      ),
                      title: Text('Wake level duration'),
                      trailing: Text(
                          '${hour_wake.toInt()}h ${minutes_wake.toInt()}min'),
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.sleep,
                        color: Colors.deepPurple,
                      ),
                      title: Text('Light level duration'),
                      trailing: Text(
                          '${hour_light.toInt()}h ${minutes_light.toInt()}min'),
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.powerSleep,
                        color: Colors.deepPurple,
                      ),
                      title: Text('Rem level duration'),
                      trailing: Text(
                          '${hour_rem.toInt()}h ${minutes_rem.toInt()}min'),
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.bellSleepOutline,
                        color: Colors.deepPurple,
                      ),
                      title: Text('Deep level duration'),
                      trailing: Text(
                          '${hour_deep.toInt()}h ${minutes_deep.toInt()}min'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        15,
                        20,
                        0,
                        0,
                      ),
                      child: Text(
                        'Sleep graph',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 20, right: 5, left: 5),
                      width: 350,
                      height: 350,
                      child: Chart(
                        data: data,
                        variables: {
                          'time': Variable(
                            accessor: (Map map) => map['time'] as String,
                          ),
                          'level': Variable(
                            accessor: (Map map) => map['level'] as String,
                          ),
                        },
                        elements: [
                          IntervalElement(
                              elevation: ElevationAttr(value: 0, updaters: {
                                'tap': {true: (_) => 5}
                              }),
                              color: ColorAttr(value: Colors.purple, updaters: {
                                'tap': {false: (color) => color.withAlpha(100)}
                              }),
                              selected: {
                                'tap': {0}
                              },
                              size: SizeAttr(value: 0.3)),
                        ],
                        axes: [
                          Defaults.horizontalAxis..label = null,
                          Defaults.verticalAxis
                        ],
                        selections: {
                          'tap': PointSelection(on: {
                            GestureType.scaleUpdate,
                            GestureType.tapDown,
                            GestureType.longPressMoveUpdate
                          }, dim: Dim.x)
                        },
                        tooltip: TooltipGuide(
                          followPointer: [true, true],
                          align: Alignment.topLeft,
                          offset: const Offset(-20, -20),
                        ),
                        crosshair:
                            CrosshairGuide(followPointer: [false, false]),
                      ),
                    ),
                  ])
                : Lottie.asset('assets/86045-no-data-found-json.json')
          ]));
    });
  }
}
