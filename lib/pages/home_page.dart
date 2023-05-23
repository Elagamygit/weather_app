// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Searchpage(
                              updateUi: updateUi,
                            )));
              },
              icon: Icon(Icons.search))
        ],
        title: Text("Weather App"),
      ),
      body:weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "there is no weather 😔 start",
                    style: TextStyle(fontSize: 27),
                  ),
                  Text(
                    "searching now 🔍",
                    style: TextStyle(fontSize: 27),
                  ),
                ],
              ),
            )
          : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                weatherData!.getThemeColor()[800]!,
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[100]!,
              ],
               begin: Alignment.topCenter,
               end:Alignment.bottomCenter,
              )
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2),
                  Text(
                   Provider.of<WeatherProvider>(context).cityname!,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getimage()),
                      Text(
                        "${weatherData!.temp.toInt()}",
                        style: TextStyle(fontSize: 25),
                      ),
                      Column(
                        children: [
                          Text("mintemp ${weatherData!.minTemp.toInt()}"),
                          Text("maxtemp ${weatherData!.maxTemp.toInt()}"),
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Text(
                    "${weatherData!.weatherStateName}",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 5)
                ],
              ),
            ),
    );
  }
}
