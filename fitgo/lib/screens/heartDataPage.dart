import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HeartDataPage extends StatelessWidget {
  HeartDataPage({Key? key}) : super(key: key);

  static const route = '/heart/';
  static const routename = 'HeartDataPage';

  @override
  Widget build(BuildContext context) {
    print('${HeartDataPage.routename} built');
    Map<dynamic, dynamic> heart_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    dynamic todayheartdata = heart_data['heart_data'].subList(192, null);
    dynamic heartdata2 = heart_data['heart_data'].subList(160, 192);
    dynamic heartdata3 = heart_data['heart_data'].subList(128, 160);
    dynamic heartdata4 = heart_data['heart_data'].subList(96, 128);
    dynamic heartdata5 = heart_data['heart_data'].subList(64, 96);
    dynamic heartdata6 = heart_data['heart_data'].subList(32, 64);
    dynamic heartdata7 = heart_data['heart_data'].subList(0, 32);

    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          backgroundColor: Colors.red,
          title: Text('Today Heart Activity'),
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
                  todayheartdata[30]
                      .substring(0, todayheartdata[30].toString().length - 1)
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
            trailing: Text(double.parse(todayheartdata[6]
                    .substring(0, todayheartdata[6].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the out of active range'),
            trailing: Text(double.parse(todayheartdata[8]
                    .substring(0, todayheartdata[8].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent out of active range'),
            trailing: Text(double.parse(todayheartdata[10]
                    .substring(0, todayheartdata[10].toString().length - 1)
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
            trailing: Text(double.parse(todayheartdata[12]
                    .substring(0, todayheartdata[12].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the fat burn range'),
            trailing: Text(double.parse(todayheartdata[14]
                    .substring(0, todayheartdata[14].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent in the fat burn range'),
            trailing: Text(double.parse(todayheartdata[16]
                    .substring(0, todayheartdata[16].toString().length - 1)
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
            trailing: Text(double.parse(todayheartdata[18]
                    .substring(0, todayheartdata[18].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the cardio range'),
            trailing: Text(double.parse(todayheartdata[20]
                    .substring(0, todayheartdata[20].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent in the cardio range'),
            trailing: Text(double.parse(todayheartdata[22]
                    .substring(0, todayheartdata[22].toString().length - 1)
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
            trailing: Text(double.parse(todayheartdata[24]
                    .substring(0, todayheartdata[24].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.arrowDownBoldOutline,
              color: Colors.red,
            ),
            title: Text('Minimum value of the peak range'),
            trailing: Text(double.parse(todayheartdata[26]
                    .substring(0, todayheartdata[26].toString().length - 1)
                    .toString())
                .toStringAsFixed(2)),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.clockOutline,
              color: Colors.red,
            ),
            title: Text('Minutes spent in the peak range'),
            trailing: Text(double.parse(todayheartdata[28]
                    .substring(0, todayheartdata[28].toString().length - 1)
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
              'Resting heart rate of the past week',
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
                  'month-day': todayheartdata[3]
                      .substring(5, todayheartdata[3].toString().length)
                      .toString(),
                  'bpm': double.parse(todayheartdata[30]
                      .substring(0, todayheartdata[30].toString().length - 1)
                      .toString())
                },
                {
                  'month-day': heartdata2[3]
                      .substring(5, heartdata2[3].toString().length)
                      .toString(),
                  'bpm': double.parse(heartdata2[30]
                      .substring(0, heartdata2[30].toString().length - 1)
                      .toString())
                },
                {
                  'month-day': heartdata3[3]
                      .substring(5, heartdata3[3].toString().length)
                      .toString(),
                  'bpm': double.parse(heartdata3[30]
                      .substring(0, heartdata3[30].toString().length - 1)
                      .toString())
                },
                {
                  'month-day': heartdata4[3]
                      .substring(5, heartdata4[3].toString().length)
                      .toString(),
                  'bpm': double.parse(heartdata4[30]
                      .substring(0, heartdata4[30].toString().length - 1)
                      .toString())
                },
                {
                  'month-day': heartdata5[3]
                      .substring(5, heartdata5[3].toString().length)
                      .toString(),
                  'bpm': double.parse(heartdata5[30]
                      .substring(0, heartdata5[30].toString().length - 1)
                      .toString())
                },
                {
                  'month-day': heartdata6[3]
                      .substring(5, heartdata6[3].toString().length)
                      .toString(),
                  'bpm': double.parse(heartdata6[30]
                      .substring(0, heartdata6[30].toString().length - 1)
                      .toString())
                },
                {
                  'month-day': heartdata7[3]
                      .substring(5, heartdata7[3].toString().length)
                      .toString(),
                  'bpm': double.parse(heartdata7[30]
                      .substring(0, heartdata7[30].toString().length - 1)
                      .toString())
                },
              ],
              variables: {
                'month-day': Variable(
                  accessor: (Map map) => map['month-day'] as String,
                ),
                'bpm': Variable(
                  accessor: (Map map) => map['bpm'] as num,
                ),
              },
              elements: [
                LineElement(
                    color: ColorAttr(value: Colors.red),
                    shape: ShapeAttr(value: BasicLineShape())) //dash: [5, 2])))
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
                          _toHeartPage(context, '/heart2/', heartdata2);
                        },
                        child: Text(
                          heartdata2[3].toString(),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toHeartPage(context, '/heart3/', heartdata3);
                        },
                        child: Text(
                          heartdata3[3].toString(),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toHeartPage(context, '/heart4/', heartdata4);
                        },
                        child: Text(
                          heartdata4[3].toString(),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _toHeartPage(context, '/heart5/', heartdata5);
                        },
                        child: Text(
                          heartdata5[3].toString(),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toHeartPage(context, '/heart6/', heartdata6);
                        },
                        child: Text(
                          heartdata6[3].toString(),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _toHeartPage(context, '/heart7/', heartdata7);
                        },
                        child: Text(
                          heartdata7[3].toString(),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ))
                  ],
                )
              ],
            ),
          )
        ]));
  }
}

void _toHeartPage(BuildContext context, String page_name, dati_heart) {
  Navigator.pushNamed(context, page_name,
      arguments: {'heart_data': dati_heart});
}
