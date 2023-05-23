import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/sevices/weather_sevices.dart';

class Searchpage extends StatelessWidget {
  String? cityname;
  Searchpage({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (data) {
            cityname = data;
          },
          onSubmitted: (data) async {
            WeatherService service = WeatherService();
            WeatherModel weather =
                await service.getweather(cityname: cityname!);
            Provider.of<WeatherProvider>(context, listen: false).weatherData =
                weather;
            Provider.of<WeatherProvider>(context, listen: false).cityname =
                cityname;
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            label: Text("Search"),
            hintText: "Enter City Name",
            suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel weather =
                      await service.getweather(cityname: cityname!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityname = cityname;
                  Navigator.pop(context);
                },
                child: Icon(Icons.search)),
            border: OutlineInputBorder(),
          ),
        ),
      )),
    );
  }
}
