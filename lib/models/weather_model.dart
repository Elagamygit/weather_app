import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data["current"]["last_updated"]),
        
        temp: jsondata['avgtemp_c'],
        maxTemp: jsondata['maxtemp_c'],
        minTemp: jsondata['mintemp_c'],
        weatherStateName: jsondata['condition']['text']);
  }
  String getimage() {
    if (weatherStateName == "Sunny") {
      return 'assets/images/day/113.png';
    } else if (weatherStateName == "Partly cloudy") {
      return "assets/images/day/116.png";
    } else if (weatherStateName == "Overcast") {
      return "assets/images/day/122.png";
    } else if (weatherStateName == "Patchy rain possible") {
      return "assets/images/day/176.png";
    } else if (weatherStateName == "Patchy snow possible") {
      return "assets/images/day/179.png";
    } else if (weatherStateName == "Patchy freezing drizzle possible") {
      return "assets/images/day/185.png";
    } else if (weatherStateName == "Light rain") {
      return "assets/images/day/296.png";
    } else if (weatherStateName == "Heavy rain") {
      return "assets/images/day/308.png";
    } else if (weatherStateName == "Light snow") {
      return "assets/images/day/326.png";
    } else if (weatherStateName == "Heavy snow") {
      return "assets/images/day/338.png";
    } else {
      return "assets/images/night/113.png";
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == "Sunny" ||
        weatherStateName == "Partly cloudy" ||
        weatherStateName == "Overcast") {
      return Colors.yellow;
    } else if (weatherStateName == "Patchy rain possible" ||
        weatherStateName == "Patchy freezing drizzle possible" ||
        weatherStateName == "Patchy snow possible") {
      return Colors.lightBlue;
    } else if (weatherStateName == "Light rain" ||
        weatherStateName == "Heavy rain" ||
        weatherStateName == "Light snow" ||
        weatherStateName == "Heavy snow") {
      return Colors.blue;
    } else {
      return Colors.purple;
    }
  }
}
