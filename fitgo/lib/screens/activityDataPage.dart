import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:fitgo/models/passi.dart';
import 'package:provider/provider.dart';

class ActivityDataPage extends StatelessWidget {
  ActivityDataPage({Key? key}) : super(key: key);

  static const route = '/activity/';
  static const routename = 'ActivityDataPage';

  @override
  Widget build(BuildContext context) {
    print('${ActivityDataPage.routename} built');
    Map<dynamic, dynamic> activity_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;

    dynamic todayactivitydata =
        activity_data['activity_data'].selectElementActivity(0);
    dynamic activitydata2 =
        activity_data['activity_data'].selectElementActivity(1);
    dynamic activitydata3 =
        activity_data['activity_data'].selectElementActivity(2);
    dynamic activitydata4 =
        activity_data['activity_data'].selectElementActivity(3);
    dynamic activitydata5 =
        activity_data['activity_data'].selectElementActivity(4);
    dynamic activitydata6 =
        activity_data['activity_data'].selectElementActivity(5);
    dynamic activitydata7 =
        activity_data['activity_data'].selectElementActivity(6);
    print(activitydata7);

    int activity_number = todayactivitydata.length +
        activitydata2.length +
        activitydata3.length +
        activitydata4.length +
        activitydata5.length +
        activitydata6.length +
        activitydata7.length;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Activity'),
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Number of activities carried out last week',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  activity_number.toString(),
                  style: TextStyle(fontSize: 48, color: Colors.orange),
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
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.black12,
                          Colors.orange,
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
                      color: Colors.orange,
                      fontSize: 15.0,
                      //fontFamily: 'WorkSansMedium'
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.orange,
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          todayactivitydata.isEmpty
              ? SizedBox()
              : Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: todayactivitydata.length,
                      itemBuilder: (context, index) {
                        final activity_one_elemnent = todayactivitydata[index];
                        final activity =
                            activity_one_elemnent.toString().split(',');
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            8.0,
                            10,
                            8.0,
                            10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activity[4].substring(
                                        18, activity[4].length - 13) +
                                    ' - ' +
                                    activity[10].substring(7),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 219, 165),
                                        ),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                activity[5].substring(14) == ''
                                                    ? Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        activity[5]
                                                            .substring(14),
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                Text('Description'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[11].substring(23,
                                                    activity[11].length - 4),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Start time'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                        ]),
                                  ]),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 219, 165)),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  activity[7].substring(11),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('Duration'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[6].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Distance'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[3].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Calories'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ))
                                        ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                ),
          activitydata2.isEmpty
              ? SizedBox()
              : Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: activitydata2.length,
                      itemBuilder: (context, index) {
                        final activity_one_elemnent = activitydata2[index];
                        final activity =
                            activity_one_elemnent.toString().split(',');
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            8.0,
                            10,
                            8.0,
                            10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activity[4].substring(
                                        18, activity[4].length - 13) +
                                    ' - ' +
                                    activity[10].substring(7),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 219, 165),
                                        ),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                activity[5].substring(14) == ''
                                                    ? Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        activity[5]
                                                            .substring(14),
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                Text('Description'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[11].substring(23,
                                                    activity[11].length - 4),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Start time'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                        ]),
                                  ]),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 219, 165)),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  activity[7].substring(11),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('Duration'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[6].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Distance'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[3].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Calories'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ))
                                        ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                ),
          activitydata3.isEmpty
              ? SizedBox()
              : Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: activitydata3.length,
                      itemBuilder: (context, index) {
                        final activity_one_elemnent = activitydata3[index];
                        final activity =
                            activity_one_elemnent.toString().split(',');
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            8.0,
                            10,
                            8.0,
                            10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activity[4].substring(
                                        18, activity[4].length - 13) +
                                    ' - ' +
                                    activity[10].substring(7),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 219, 165),
                                        ),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                activity[5].substring(14) == ''
                                                    ? Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        activity[5]
                                                            .substring(14),
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                Text('Description'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[11].substring(23,
                                                    activity[11].length - 4),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Start time'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                        ]),
                                  ]),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 219, 165)),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  activity[7].substring(11),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('Duration'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[6].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Distance'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[3].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Calories'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ))
                                        ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                ),
          activitydata4.isEmpty
              ? SizedBox()
              : Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: activitydata4.length,
                      itemBuilder: (context, index) {
                        final activity_one_elemnent = activitydata4[index];
                        final activity =
                            activity_one_elemnent.toString().split(',');
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            8.0,
                            10,
                            8.0,
                            10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activity[4].substring(
                                        18, activity[4].length - 13) +
                                    ' - ' +
                                    activity[10].substring(7),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 219, 165),
                                        ),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                activity[5].substring(14) == ''
                                                    ? Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        activity[5]
                                                            .substring(14),
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                Text('Description'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[11].substring(23,
                                                    activity[11].length - 4),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Start time'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                        ]),
                                  ]),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 219, 165)),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  activity[7].substring(11),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('Duration'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[6].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Distance'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[3].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Calories'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ))
                                        ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                ),
          activitydata5.isEmpty
              ? SizedBox()
              : Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: activitydata5.length,
                      itemBuilder: (context, index) {
                        final activity_one_elemnent = activitydata5[index];
                        final activity =
                            activity_one_elemnent.toString().split(',');
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            8.0,
                            10,
                            8.0,
                            10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activity[4].substring(
                                        18, activity[4].length - 13) +
                                    ' - ' +
                                    activity[10].substring(7),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 219, 165),
                                        ),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                activity[5].substring(14) == ''
                                                    ? Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        activity[5]
                                                            .substring(14),
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                Text('Description'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[11].substring(23,
                                                    activity[11].length - 4),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Start time'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                        ]),
                                  ]),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 219, 165)),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  activity[7].substring(11),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('Duration'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[6].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Distance'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[3].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Calories'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ))
                                        ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                ),
          activitydata6.isEmpty
              ? SizedBox()
              : Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: activitydata6.length,
                      itemBuilder: (context, index) {
                        final activity_one_elemnent = activitydata6[index];
                        final activity =
                            activity_one_elemnent.toString().split(',');
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            8.0,
                            10,
                            8.0,
                            10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activity[4].substring(
                                        18, activity[4].length - 13) +
                                    ' - ' +
                                    activity[10].substring(7),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 219, 165),
                                        ),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                activity[5].substring(14) == ''
                                                    ? Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        activity[5]
                                                            .substring(14),
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                Text('Description'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[11].substring(23,
                                                    activity[11].length - 4),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Start time'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                        ]),
                                  ]),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 219, 165)),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  activity[7].substring(11),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('Duration'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[6].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Distance'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[3].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Calories'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ))
                                        ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                ),
          activitydata7.isEmpty
              ? SizedBox()
              : Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: activitydata7.length,
                      itemBuilder: (context, index) {
                        final activity_one_elemnent = activitydata7[index];
                        final activity =
                            activity_one_elemnent.toString().split(',');
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            8.0,
                            10,
                            8.0,
                            10,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                activity[4].substring(
                                        18, activity[4].length - 13) +
                                    ' - ' +
                                    activity[10].substring(7),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 219, 165),
                                        ),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                activity[5].substring(14) == ''
                                                    ? Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        activity[5]
                                                            .substring(14),
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                Text('Description'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[11].substring(23,
                                                    activity[11].length - 4),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Start time'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                        ]),
                                  ]),
                              Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 219, 165)),
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  activity[7].substring(11),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('Duration'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[6].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Distance'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                          Center(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                activity[3].substring(11),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text('Calories'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ))
                                        ]),
                                  ]),
                            ],
                          ),
                        );
                      }),
                ),
        ]));
  }
}
