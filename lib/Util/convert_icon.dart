import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDescription,Color color,double size,int i}){
  switch(weatherDescription){
    case "Clear":
      if(i==0)
      {return Icon(FontAwesomeIcons.solidSun,color: color,size: size,);}
      else{
        return Icon(FontAwesomeIcons.moon,color: color,size: size,);
      }
      break;
    case "Clouds":
      {return Icon(FontAwesomeIcons.cloud,color: color,size: size,);}
      break;
    case "Rain":
      {return Icon(FontAwesomeIcons.cloudRain,color: color,size: size,);}
      break;
    case "Snow":
      {return Icon(FontAwesomeIcons.snowman,color: color,size: size,);}
      break;
    default:
      if(i==0)
      {return Icon(FontAwesomeIcons.cloudSun,color: color,size: size,);}
      else{
        return Icon(FontAwesomeIcons.cloudMoon,color: color,size: size,);
      }
  }
}