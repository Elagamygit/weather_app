import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseurl = "http://api.weatherapi.com/v1";
  String apikey = "afb4e895f4b6444aaba190415231203";
  Future<WeatherModel> getweather({required String cityname}) async {
      Uri url =
          Uri.parse("$baseurl/forecast.json?key=$apikey&q=$cityname&days=7");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
