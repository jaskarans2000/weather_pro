import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeweatherpro/Model/Weatherforecastmodel.dart';

import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot,BuildContext context,int i){
  var forecastList=snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text("5-DAY WEATHER FORECAST",
      style: TextStyle(fontSize: 14.0,color: Colors.white),),
      Container(
        height: 170.0,
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  height: 160.0,
                  child: forecastCard(snapshot,index),
                  decoration: BoxDecoration(
                    gradient: i==1?LinearGradient(colors: [Color(0xff6a1b9a),Color(0xffab47bc)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight):LinearGradient(colors: [Color(0xff001970),Color(0xffaab6fe)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                  ),
                ),
              );
            },
            separatorBuilder: (context,index)=>SizedBox(width: 8.0,),
            itemCount: 5),
      )
    ],
  );
}