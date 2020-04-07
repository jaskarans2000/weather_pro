import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freeweatherpro/Model/Weatherforecastmodel.dart';
import 'package:freeweatherpro/Network/network.dart';
import 'package:freeweatherpro/UI/bottom_view.dart';
import 'package:freeweatherpro/UI/midview.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Future <WeatherForecastModel> forecastObject;
  String cityName;
  Position currentPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setI();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient:i==0? LinearGradient(colors: [Color(0xff1565c0),Color(0xff90caf9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight):LinearGradient(colors: [Color(0xff000000),Color(0xff000000)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
          ),
          child: ListView(
            children: <Widget>[
              textFieldView(),
              Container(
                child: FutureBuilder(
                    future: forecastObject,
                    builder: (context,AsyncSnapshot<WeatherForecastModel> snapShot){
                      if(snapShot.hasData){
                        return Column(
                          children: <Widget>[
                            midView(snapShot,context,i),
                            bottomView(snapShot, context,i)
                          ],
                        );
                      }
                      else{
                        return Container(
                          child: Center(
                              child: SpinKitFadingCircle(color: Colors.white),
                          ),
                        );
                      }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  textFieldView() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.search),
          hintText: "Enter City Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.all(8.0),
        ),
        onSubmitted: (value){
          if(value.isNotEmpty)
          setState(() {
            cityName=value;
            forecastObject=Network().getWeatherForecast(cityName);
          });
        },
      ),
    );
  }

  getCurrentLocation() async{
    currentPosition= await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .catchError((e) {
      print(e);
    });
    await _getAddressFromLatLng();
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        cityName=place.locality;
        forecastObject=Network().getWeatherForecast(cityName);
      });
      } catch (e) {
      print(e);
    }
  }

  void setI() {
    final currentTime = DateTime.now();
    DateFormat dateFormat = new DateFormat.Hm();

    // dateFormat.parse("06:00");
    //DateTime close = dateFormat.parse("18:00");

    if(currentTime.hour>6 && currentTime.hour<18) {
      setState(() {
        i=0;
        print(i);
      });
    }
    else{
      setState(() {
        print("hello");
        i=1;
      });
    }
  }
}
