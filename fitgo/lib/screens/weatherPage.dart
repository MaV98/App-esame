import 'package:flutter/material.dart';
//import 'dart:html';
import 'package:flutter/material.dart';

import 'package:fitgo/weatherAPI/data_service.dart';
import 'package:fitgo/weatherAPI/models.dart';
import 'package:fitgo/screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key? key}) : super(key: key);

  static const route = '/weather/';
  static const routename = 'WeatherPage';

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  var _response;

  @override
  Widget build(BuildContext context) {
    print('${WeatherPage.routename} built');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 202, 247),
      appBar: AppBar(
        title: Text(WeatherPage.routename),
        // actions: [
        //   IconButton(onPressed: () => _toHomePage(context), icon: Icon(Icons.edit))
        // ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (_response != null)
            Column(
              children: [
                Image.network(_response.iconUrl),
                Text(
                  '${_response.tempInfo.temperature}°',
                  style: TextStyle(fontSize: 48),
                ),
                Text(_response.weatherInfo.description)
              ],
            ),
          buildweatherCard()
        ]
            //   ElevatedButton(
            //    child: Text('To the HomePage'),
            //   onPressed: () {
            //    Navigator.pop(context);
            //  },
            // ),

            ),
      ),
    );
  } //build

  void _toHomePage(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    final pag = sp.getInt('indice');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage(index: pag)));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }

  Widget buildweatherCard() => Card(
        shadowColor: Colors.lightBlue,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select your city',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextField(
                  controller: _cityTextController,
                  decoration: InputDecoration(labelText: 'City'),
                  textAlign: TextAlign.center),
              ElevatedButton(onPressed: _search, child: Text('Search'))
            ],
          ),
        ),
      );
}
