import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeweatherpro/Model/Weatherforecastmodel.dart';
import 'package:freeweatherpro/Util/convert_icon.dart';
import 'package:freeweatherpro/Util/util.dart';


Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot,BuildContext context,int index){
  var forecastList=snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formattedDate = Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt*1000));
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$city, $country",
          style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
          Text("$formattedDate",style: TextStyle(fontSize: 15.0,color: Colors.white),),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,color: Colors.white,size: 195.0,i: index),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${forecastList[0].main.temp.toStringAsFixed(0)} ℃",
                style: TextStyle(
                  fontSize: 34.0,
                  color: Colors.white
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${forecastList[0].weather[0].description}".toUpperCase(),
                    style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${forecastList[0].wind.speed} km/h",
                          style: TextStyle(color: Colors.white),),
                      ),
                      Icon(FontAwesomeIcons.wind,size: 20.0,color: Colors.white,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${forecastList[0].main.humidity} %",
                          style: TextStyle(color: Colors.white),),
                      ),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20.0,color: Colors.white,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${forecastList[0].main.tempMax.toStringAsFixed(0)} ℃",
                          style: TextStyle(color: Colors.white),),
                      ),
                      Icon(FontAwesomeIcons.temperatureHigh,size: 20.0,color:Colors.white,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}