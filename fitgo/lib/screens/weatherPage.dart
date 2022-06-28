import 'package:flutter/material.dart';
//import 'dart:html';
import 'package:flutter/material.dart';

import 'package:fitgo/weatherAPI/data_service.dart';
import 'package:fitgo/weatherAPI/models.dart';
import 'package:fitgo/screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

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
      backgroundColor: Color.fromARGB(255, 120, 202, 210),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 105, 140),
        title: Text('Weather'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                15,
                0,
                15,
                0,
              ),
              child: buildweatherCard(),
            ),
            _response != null
                ? Column(
                    children: [
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.tempInfo.temperature}°',
                        style: TextStyle(fontSize: 48),
                      ),
                      Text(_response.weatherInfo.description)
                    ],
                  )
                : Lottie.asset('assets/4801-weather-partly-shower.json',
                    width: 280, height: 280)
          ]),
        ),
      ),
    );
  } //build

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }

  Widget buildweatherCard() => Card(
        shadowColor: Color.fromARGB(255, 120, 202, 210),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                Text('Select city',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center),
                ElevatedButton(
                    onPressed: _search,
                    child: Text('Search'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 105, 140),
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
}
