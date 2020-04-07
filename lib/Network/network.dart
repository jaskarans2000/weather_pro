import 'dart:convert';

import 'package:freeweatherpro/Model/Weatherforecastmodel.dart';
import 'package:freeweatherpro/Util/util.dart';
import 'package:http/http.dart';

class Network{
  Future <WeatherForecastModel> getWeatherForecast(String cityName) async {
    var finalURL="http://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Util.appID}&units=metric";
    final response =await get(Uri.encodeFull(finalURL));
    if(response.statusCode==200){
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error in fetching data");
    }
  }
}