import 'package:flutter/material.dart';
import 'package:freeweatherpro/weather_forecast/weatherforecast.dart';
int i;
void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: i==0?ThemeData.light():ThemeData.dark(),
      home: WeatherForecast(),
    );
  }
}
