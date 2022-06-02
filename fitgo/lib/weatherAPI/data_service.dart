import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fitgo/weatherAPI/models.dart';

class DataService{
  Future<WeatherResponse> getWeather(String city) async{
// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

final queryParameters={'q': city,'appid':'4f563e145112f2db1ea9f2f60b78e148', 'units':'metric' };

final uri= Uri.https('api.openweathermap.org','/data/2.5/weather', queryParameters);

final response = await http.get(uri);

print(response.body);
final json=jsonDecode(response.body);
return WeatherResponse.fromJson(json);
  }
}