import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeweatherpro/Model/Weatherforecastmodel.dart';
import 'package:freeweatherpro/Util/convert_icon.dart';
import 'package:freeweatherpro/Util/util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot,int index){
  var forecastlist=snapshot.data.list;
  var dayofweek="";
  int currentindex=index>0?8*index-1:0;
  var fullDate=Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(forecastlist[currentindex+1].dt*1000));
  dayofweek=fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayofweek,style: TextStyle(color: Colors.white),),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastlist[currentindex].weather[0].main,color: Colors.pinkAccent,size: 40),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Text("${forecastlist[currentindex].main.tempMin.toStringAsFixed(0)} ℃",
                      style: TextStyle(color: Colors.white),),
                    Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white,size: 17.0,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Text("${forecastlist[currentindex].main.tempMax.toStringAsFixed(0)} ℃",
                      style: TextStyle(color: Colors.white),),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white,size: 17.0,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Text("${forecastlist[currentindex].main.humidity.toStringAsFixed(0)} %",
                      style: TextStyle(color: Colors.white),),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white,size: 17.0,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Text("${forecastlist[currentindex].wind.speed.toStringAsFixed(0)} km/h",
                    style: TextStyle(color: Colors.white),),
                    Icon(FontAwesomeIcons.wind,color: Colors.white,size: 17.0,)
                  ],
                ),
              ),
            ],
          )
        ],
      )
    ],
  );
}