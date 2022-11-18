import 'package:clima_flutter/schema/weather_schema.dart';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    WeatherSchema data = await WeatherModel().getWeatherByCurrentLocation();
    _toLocationScreen(data);
  }

  void _toLocationScreen(WeatherSchema weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
