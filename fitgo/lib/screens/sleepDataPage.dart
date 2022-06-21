import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:collection/collection.dart';
import 'package:fitgo/models/passi.dart';
import 'package:provider/provider.dart';

class SleepDataPage extends StatelessWidget {
  SleepDataPage({Key? key}) : super(key: key);

  static const route = '/sleep/';
  static const routename = 'SleepDataPage';

  Dati start_end_monitoring_time = Dati();

  @override
  Widget build(BuildContext context) {
    print('${SleepDataPage.routename} built');
    Map<dynamic, dynamic> sleep_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;

    dynamic todaysleepdata = sleep_data['sleep_data'].selectElement(0);

    var provider = Provider.of<Dati>(context);
    if (todaysleepdata.isNotEmpty) {
      dynamic start = todaysleepdata[0]
          .toString()
          .split(' ')[7]
          .toString()
          .substring(0,
              todaysleepdata[0].toString().split(' ')[7].toString().length - 1)
          .toString();
      dynamic end = todaysleepdata[todaysleepdata.length - 1]
          .toString()
          .split(' ')[7]
          .toString()
          .substring(
              0,
              todaysleepdata[todaysleepdata.length - 1]
                      .toString()
                      .split(' ')[7]
                      .toString()
                      .length -
                  1)
          .toString();
      final start_end = [];
      start_end.add(start);
      start_end.add(end);
      provider.startEnd = start_end;
    }

    if (todaysleepdata.isNotEmpty) {
      dynamic todayDate = todaysleepdata[0].toString().split(' ')[3].toString();
      provider.todaysleepdate = [todayDate];
    } else {
      provider.todaysleepdate = ['2022-00-01'];
    }

    //total today sleep duration
    int count_totalSleep = 0;
    if (todaysleepdata.isEmpty) {
      count_totalSleep = 0;
    } else {
      for (var i = 0; i < todaysleepdata.length; i++) {
        var currentElement_totalsleep = todaysleepdata[i];
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
    if (todaysleepdata.isEmpty) {
      count_wake = 0;
    } else {
      for (var i = 0; i < todaysleepdata.length; i++) {
        var currentElement_wake = todaysleepdata[i];
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
    if (todaysleepdata.isEmpty) {
      count_light = 0;
    } else {
      for (var i = 0; i < todaysleepdata.length; i++) {
        var currentElement_light = todaysleepdata[i];
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
    if (todaysleepdata.isEmpty) {
      count_deep = 0;
    } else {
      for (var i = 0; i < todaysleepdata.length; i++) {
        var currentElement_deep = todaysleepdata[i];
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
    if (todaysleepdata.isEmpty) {
      count_rem = 0;
    } else {
      for (var i = 0; i < todaysleepdata.length; i++) {
        var currentElement_rem = todaysleepdata[i];
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
    if (todaysleepdata.isEmpty) {
    } else {
      for (var i = 0; i < todaysleepdata.length; i++) {
        var currentelement = todaysleepdata[i];
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

// fetch e calcolo data per ogni giorno
    dynamic sleepdata2 = sleep_data['sleep_data'].selectElement(1); //yesterday
    if (sleepdata2.isNotEmpty) {
      dynamic sleepdata2_firstInstance = sleepdata2[0].toString().split(' ');
      dynamic Date2 = sleepdata2_firstInstance[3].toString();

      provider.sleepdate2 = [Date2];
    } else {
      provider.sleepdate2 = ['2022-00-02'];
    }

    dynamic sleepdata3 = sleep_data['sleep_data'].selectElement(2);
    if (sleepdata3.isNotEmpty) {
      dynamic sleepdata3_firstInstance = sleepdata3[0].toString().split(' ');
      dynamic Date3 = sleepdata3_firstInstance[3].toString();

      provider.sleepdate3 = [Date3];
    } else {
      provider.sleepdate3 = ['2022-00-03'];
    }

    dynamic sleepdata4 = sleep_data['sleep_data'].selectElement(3);
    if (sleepdata4.isNotEmpty) {
      dynamic sleepdata4_firstInstance = sleepdata4[0].toString().split(' ');
      dynamic Date4 = sleepdata4_firstInstance[3].toString();

      provider.sleepdate4 = [Date4];
    } else {
      provider.sleepdate4 = ['2022-00-04'];
    }

    dynamic sleepdata5 = sleep_data['sleep_data'].selectElement(4);
    if (sleepdata5.isNotEmpty) {
      dynamic sleepdata5_firstInstance = sleepdata5[0].toString().split(' ');
      dynamic Date5 = sleepdata5_firstInstance[3].toString();

      provider.sleepdate5 = [Date5];
    } else {
      provider.sleepdate5 = ['2022-00-05'];
    }

    dynamic sleepdata6 = sleep_data['sleep_data'].selectElement(5);
    if (sleepdata6.isNotEmpty) {
      dynamic sleepdata6_firstInstance = sleepdata6[0].toString().split(' ');
      dynamic Date6 = sleepdata6_firstInstance[3].toString();

      provider.sleepdate6 = [Date6];
    } else {
      provider.sleepdate6 = ['2022-00-06'];
    }

    dynamic sleepdata7 = sleep_data['sleep_data'].selectElement(6); //7 days ago
    if (sleepdata7.isNotEmpty) {
      dynamic sleepdata7_firstInstance = sleepdata7[0].toString().split(' ');
      dynamic Date7 = sleepdata7_firstInstance[3].toString();

      provider.sleepdate7 = [Date7];
    } else {
      provider.sleepdate7 = ['2022-00-07'];
    }

    //total yesterday sleep duration
    int count_totalSleep2 = 0;
    if (sleepdata2.isEmpty) {
      count_totalSleep2 = 0;
    } else {
      for (var i = 0; i < sleepdata2.length; i++) {
        var currentElement_totalsleep2 = sleepdata2[i];
        var currentElement_str_totalsleep2 =
            currentElement_totalsleep2.toString().split(' ');
        if (currentElement_str_totalsleep2[9]
                .substring(
                    0, currentElement_str_totalsleep2[9].toString().length - 1)
                .toString() !=
            'wake') {
          ++count_totalSleep2;
        }
      }
    }
    print(count_totalSleep2);
    double seconds_totalsleep2 = count_totalSleep2 * 30;
    double total_minutes_totalsleep2 = seconds_totalsleep2 / 60;
    double hour_totalsleep2 = total_minutes_totalsleep2 / 60;
    double resto_totalsleep2 = hour_totalsleep2 - hour_totalsleep2.toInt();
    double minutes_totalsleep2 = resto_totalsleep2 * 60;
    dynamic totalsleeps2_united = double.parse(
        hour_totalsleep2.toInt().toString() +
            '.' +
            minutes_totalsleep2.toInt().toString());

    //total 3 sleep duration
    int count_totalSleep3 = 0;
    if (sleepdata3.isEmpty) {
      count_totalSleep3 = 0;
    } else {
      for (var i = 0; i < sleepdata3.length; i++) {
        var currentElement_totalsleep3 = sleepdata3[i];
        var currentElement_str_totalsleep3 =
            currentElement_totalsleep3.toString().split(' ');
        if (currentElement_str_totalsleep3[9]
                .substring(
                    0, currentElement_str_totalsleep3[9].toString().length - 1)
                .toString() !=
            'wake') {
          ++count_totalSleep3;
        }
      }
    }
    print(count_totalSleep3);
    double seconds_totalsleep3 = count_totalSleep3 * 30;
    double total_minutes_totalsleep3 = seconds_totalsleep3 / 60;
    double hour_totalsleep3 = total_minutes_totalsleep3 / 60;
    double resto_totalsleep3 = hour_totalsleep3 - hour_totalsleep3.toInt();
    double minutes_totalsleep3 = resto_totalsleep3 * 60;
    dynamic totalsleeps3_united = double.parse(
        hour_totalsleep3.toInt().toString() +
            '.' +
            minutes_totalsleep3.toInt().toString());

    //total 4 sleep duration
    int count_totalSleep4 = 0;
    if (sleepdata4.isEmpty) {
      count_totalSleep4 = 0;
    } else {
      for (var i = 0; i < sleepdata4.length; i++) {
        var currentElement_totalsleep4 = sleepdata4[i];
        var currentElement_str_totalsleep4 =
            currentElement_totalsleep4.toString().split(' ');
        if (currentElement_str_totalsleep4[9]
                .substring(
                    0, currentElement_str_totalsleep4[9].toString().length - 1)
                .toString() !=
            'wake') {
          ++count_totalSleep4;
        }
      }
    }
    print(count_totalSleep4);
    double seconds_totalsleep4 = count_totalSleep4 * 30;
    double total_minutes_totalsleep4 = seconds_totalsleep4 / 60;
    double hour_totalsleep4 = total_minutes_totalsleep4 / 60;
    double resto_totalsleep4 = hour_totalsleep4 - hour_totalsleep4.toInt();
    double minutes_totalsleep4 = resto_totalsleep4 * 60;
    dynamic totalsleeps4_united = double.parse(
        hour_totalsleep4.toInt().toString() +
            '.' +
            minutes_totalsleep4.toInt().toString());

    //total 5 sleep duration
    int count_totalSleep5 = 0;
    if (sleepdata5.isEmpty) {
      count_totalSleep5 = 0;
    } else {
      for (var i = 0; i < sleepdata5.length; i++) {
        var currentElement_totalsleep5 = sleepdata5[i];
        var currentElement_str_totalsleep5 =
            currentElement_totalsleep5.toString().split(' ');
        if (currentElement_str_totalsleep5[9]
                .substring(
                    0, currentElement_str_totalsleep5[9].toString().length - 1)
                .toString() !=
            'wake') {
          ++count_totalSleep5;
        }
      }
    }
    print(count_totalSleep5);
    double seconds_totalsleep5 = count_totalSleep5 * 30;
    double total_minutes_totalsleep5 = seconds_totalsleep5 / 60;
    double hour_totalsleep5 = total_minutes_totalsleep5 / 60;
    double resto_totalsleep5 = hour_totalsleep5 - hour_totalsleep5.toInt();
    double minutes_totalsleep5 = resto_totalsleep5 * 60;
    dynamic totalsleeps5_united = double.parse(
        hour_totalsleep5.toInt().toString() +
            '.' +
            minutes_totalsleep5.toInt().toString());

    //total 6 sleep duration
    int count_totalSleep6 = 0;
    if (sleepdata6.isEmpty) {
      count_totalSleep6 = 0;
    } else {
      for (var i = 0; i < sleepdata6.length; i++) {
        var currentElement_totalsleep6 = sleepdata6[i];
        var currentElement_str_totalsleep6 =
            currentElement_totalsleep6.toString().split(' ');
        if (currentElement_str_totalsleep6[9]
                .substring(
                    0, currentElement_str_totalsleep6[9].toString().length - 1)
                .toString() !=
            'wake') {
          ++count_totalSleep6;
        }
      }
    }
    print(count_totalSleep6);
    double seconds_totalsleep6 = count_totalSleep6 * 30;
    double total_minutes_totalsleep6 = seconds_totalsleep6 / 60;
    double hour_totalsleep6 = total_minutes_totalsleep6 / 60;
    double resto_totalsleep6 = hour_totalsleep6 - hour_totalsleep6.toInt();
    double minutes_totalsleep6 = resto_totalsleep6 * 60;
    dynamic totalsleeps6_united = double.parse(
        hour_totalsleep6.toInt().toString() +
            '.' +
            minutes_totalsleep6.toInt().toString());

    //total 7 sleep duration
    int count_totalSleep7 = 0;
    if (sleepdata7.isEmpty) {
      count_totalSleep7 = 0;
    } else {
      for (var i = 0; i < sleepdata7.length; i++) {
        var currentElement_totalsleep7 = sleepdata7[i];
        var currentElement_str_totalsleep7 =
            currentElement_totalsleep7.toString().split(' ');
        if (currentElement_str_totalsleep7[9]
                .substring(
                    0, currentElement_str_totalsleep7[9].toString().length - 1)
                .toString() !=
            'wake') {
          ++count_totalSleep7;
        }
      }
    }
    print(count_totalSleep7);
    double seconds_totalsleep7 = count_totalSleep7 * 30;
    double total_minutes_totalsleep7 = seconds_totalsleep7 / 60;
    double hour_totalsleep7 = total_minutes_totalsleep7 / 60;
    double resto_totalsleep7 = hour_totalsleep7 - hour_totalsleep7.toInt();
    double minutes_totalsleep7 = resto_totalsleep7 * 60;
    dynamic totalsleeps7_united = double.parse(
        hour_totalsleep7.toInt().toString() +
            '.' +
            minutes_totalsleep7.toInt().toString());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Today Sleep Activity'),
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            todaysleepdata.isEmpty
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
                      SizedBox(
                        height: 10,
                      ),
                      Text('Scroll down and explore others data')
                    ],
                  )
                : Column(children: [
                    Text(
                      'Last sleep duration',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${hour_totalsleep.toInt()}h ${minutes_totalsleep.toInt()}min',
                          style:
                              TextStyle(fontSize: 48, color: Colors.deepPurple),
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
                      //fontFamily: 'WorkSansMedium'
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
          todaysleepdata.isNotEmpty
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Consumer<Dati>(builder: (context, startEnd, _) {
                    return ListTile(
                        leading: Icon(
                          MdiIcons.clockStart,
                          color: Colors.deepPurple,
                        ),
                        title: Text('Monitoring start time'),
                        trailing:
                            Text(startEnd.selectElementStartEnd(0).toString()));
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
                    trailing:
                        Text('${hour_rem.toInt()}h ${minutes_rem.toInt()}min'),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      crosshair: CrosshairGuide(followPointer: [false, false]),
                    ),
                  ),
                ])
              : SizedBox(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              20,
              0,
              0,
            ),
            child: Text(
              'Sleep duration of the past week',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin:
                  const EdgeInsets.only(top: 10, bottom: 20, right: 5, left: 5),
              width: 350,
              height: 350,
              child: Consumer<Dati>(builder: (context, todaysleepdate, _) {
                return Consumer<Dati>(builder: (context, sleepdate2, _) {
                  return Consumer<Dati>(builder: (context, sleepdate3, _) {
                    return Consumer<Dati>(builder: (context, sleepdate4, _) {
                      return Consumer<Dati>(builder: (context, sleepdate5, _) {
                        return Consumer<Dati>(
                            builder: (context, sleepdate6, _) {
                          return Consumer<Dati>(
                              builder: (context, sleepdate7, _) {
                            return Chart(
                              data: [
                                {
                                  'month-day': todaysleepdate
                                      .selectElementToday(0)
                                      .toString()
                                      .substring(
                                          5,
                                          todaysleepdate
                                              .selectElementToday(0)
                                              .toString()
                                              .length)
                                      .toString(),
                                  'duration': todaytotalsleeps_united
                                },
                                {
                                  'month-day': sleepdate2
                                      .selectElement2(0)
                                      .toString()
                                      .substring(
                                          5,
                                          sleepdate2
                                              .selectElement2(0)
                                              .toString()
                                              .length)
                                      .toString(),
                                  'duration': totalsleeps2_united
                                },
                                {
                                  'month-day': sleepdate3
                                      .selectElement3(0)
                                      .toString()
                                      .substring(
                                          5,
                                          sleepdate3
                                              .selectElement3(0)
                                              .toString()
                                              .length)
                                      .toString(),
                                  'duration': totalsleeps3_united
                                },
                                {
                                  'month-day': sleepdate4
                                      .selectElement4(0)
                                      .toString()
                                      .substring(
                                          5,
                                          sleepdate4
                                              .selectElement4(0)
                                              .toString()
                                              .length)
                                      .toString(),
                                  'duration': totalsleeps4_united
                                },
                                {
                                  'month-day': sleepdate5
                                      .selectElement5(0)
                                      .toString()
                                      .substring(
                                          5,
                                          sleepdate5
                                              .selectElement5(0)
                                              .toString()
                                              .length)
                                      .toString(),
                                  'duration': totalsleeps5_united
                                },
                                {
                                  'month-day': sleepdate6
                                      .selectElement6(0)
                                      .toString()
                                      .substring(
                                          5,
                                          sleepdate6
                                              .selectElement6(0)
                                              .toString()
                                              .length)
                                      .toString(),
                                  'duration': totalsleeps6_united
                                },
                                {
                                  'month-day': sleepdate7
                                      .selectElement7(0)
                                      .toString()
                                      .substring(
                                          5,
                                          sleepdate7
                                              .selectElement7(0)
                                              .toString()
                                              .length)
                                      .toString(),
                                  'duration': totalsleeps7_united
                                },
                              ],
                              variables: {
                                'month-day': Variable(
                                  accessor: (Map map) =>
                                      map['month-day'] as String,
                                ),
                                'duration': Variable(
                                  accessor: (Map map) => map['duration'] as num,
                                ),
                              },
                              elements: [
                                LineElement(
                                    color: ColorAttr(value: Colors.deepPurple),
                                    shape: ShapeAttr(value: BasicLineShape()))
                              ],
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
                              crosshair:
                                  CrosshairGuide(followPointer: [false, false]),
                            );
                          });
                        });
                      });
                    });
                  });
                });
              })),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                "* The value '00-0X - 0.0' refers to a night in which no data has been recorded"),
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
                    Consumer<Dati>(builder: (context, sleepdate2, _) {
                      return ElevatedButton(
                          onPressed: () {
                            _toSleepPage(context, '/sleep2/', sleepdata2);
                          },
                          child: sleepdata2.isNotEmpty
                              ? Text(sleepdate2.selectElement2(0).toString())
                              : Text('No data'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(105, 36)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                          ));
                    }),
                    Consumer<Dati>(builder: (context, sleepdate3, _) {
                      return ElevatedButton(
                          onPressed: () {
                            _toSleepPage(context, '/sleep3/', sleepdata3);
                          },
                          child: sleepdata3.isNotEmpty
                              ? Text(sleepdate3.selectElement3(0).toString())
                              : Text('No data'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(105, 36)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                          ));
                    }),
                    Consumer<Dati>(builder: (context, sleepdate4, _) {
                      return ElevatedButton(
                          onPressed: () {
                            _toSleepPage(context, '/sleep4/', sleepdata4);
                          },
                          child: sleepdata4.isNotEmpty
                              ? Text(sleepdate4.selectElement4(0).toString())
                              : Text('No data'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(105, 36)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                          ));
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<Dati>(builder: (context, sleepdate5, _) {
                      return ElevatedButton(
                          onPressed: () {
                            _toSleepPage(context, '/sleep5/', sleepdata5);
                          },
                          child: sleepdata5.isNotEmpty
                              ? Text(sleepdate5.selectElement5(0).toString())
                              : Text('No data'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(105, 36)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                          ));
                    }),
                    Consumer<Dati>(builder: (context, sleepdate6, _) {
                      return ElevatedButton(
                          onPressed: () {
                            _toSleepPage(context, '/sleep6/', sleepdata6);
                          },
                          child: sleepdata6.isNotEmpty
                              ? Text(sleepdate6.selectElement6(0).toString())
                              : Text('No data'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(105, 36)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                          ));
                    }),
                    Consumer<Dati>(builder: (context, sleepdate7, _) {
                      return ElevatedButton(
                          onPressed: () {
                            _toSleepPage(context, '/sleep7/', sleepdata7);
                          },
                          child: sleepdata7.isNotEmpty
                              ? Text(sleepdate7.selectElement7(0).toString())
                              : Text('No data'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(105, 36)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                          ));
                    }),
                  ],
                )
              ],
            ),
          )
        ]));
  }
}

void _toSleepPage(BuildContext context, String page_name, dati_sleep) {
  Navigator.pushNamed(context, page_name,
      arguments: {'sleep_data': dati_sleep});
}
