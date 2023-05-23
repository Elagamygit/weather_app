// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: weatherapp()));
}

class weatherapp extends StatelessWidget {
  weatherapp({super.key});
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).weatherData == null
                  ? Colors.blueGrey
                  : Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
