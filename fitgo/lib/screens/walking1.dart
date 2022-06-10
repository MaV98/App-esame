// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class WalkingPage1 extends StatelessWidget {
  const WalkingPage1({Key? key}) : super(key: key);

  static const route = '/walking1/';
  static const routename = 'Walk 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2196F3),
          title: Text(WalkingPage1.routename),
        ),
        body: ListView(
          children: [
            Container(
                height: 230,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Mettere un'immagine?",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ],
                )),
            ListTile(
              title: Text('Leonardo'),
              trailing: Text('7,9 km', style: TextStyle(fontSize: 26.0)),
              subtitle: Text('04/05/2022  13:24'),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                8.0,
                0,
                8.0,
                0,
              ),
              //padding: const EdgeInsets.all(8.0),
              child: Table(
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 237, 232, 232),
                        ),
                        children: <Widget>[
                          Column(
                            //Center(
                            //child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text('00:20:29',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('Tempo di allenamento',
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Center(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text("15'45''",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('Passo medio'),
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
                              Text('96',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('Calorie bruciate'),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ))
                        ]),
                    TableRow(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 237, 232, 232),
                        ),
                        children: <Widget>[
                          Center(
                              widthFactor: 100000,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('109',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('Frequenza cardiaca media',
                                      textAlign: TextAlign.center),
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
                              Text('1669',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('passi'),
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
                              Text('81',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('cadenza'),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ))
                        ])
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text('Frequenza cardiaca',
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold))),
            Container(
              margin:
                  const EdgeInsets.only(top: 10, bottom: 20, right: 5, left: 5),
              width: 350,
              height: 350,
              child: Chart(
                data: [
                  {'time': '1', 'bpm': 90},
                  {'time': '2', 'bpm': 115},
                  {'time': '2', 'bpm': 115},
                  {'time': '3', 'bpm': 94},
                  {'time': '4', 'bpm': 104},
                  {'time': '5', 'bpm': 134},
                  {'time': '6', 'bpm': 140},
                  {'time': '7', 'bpm': 115},
                  {'time': '8', 'bpm': 120},
                  {'time': '9', 'bpm': 99},
                  {'time': '10', 'bpm': 101},
                  {'time': '11', 'bpm': 103},
                  {'time': '12', 'bpm': 105},
                  {'time': '13', 'bpm': 119},
                  {'time': '14', 'bpm': 110},
                  {'time': '15', 'bpm': 111},
                  {'time': '16', 'bpm': 106},
                  {'time': '17', 'bpm': 107},
                  {'time': '18', 'bpm': 120},
                  {'time': '19', 'bpm': 120},
                  {'time': '20', 'bpm': 99},
                ],
                variables: {
                  'time': Variable(
                    accessor: (Map map) => map['time'] as String,
                  ),
                  'bpm': Variable(
                    accessor: (Map map) => map['bpm'] as num,
                  ),
                },
                elements: [
                  LineElement(
                      shape:
                          ShapeAttr(value: BasicLineShape())) //dash: [5, 2])))
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
            )
          ],
        ));
  }
}
