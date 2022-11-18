import 'package:clima_flutter/screens/city_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';

import '../schema/weather_schema.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weather});

  final WeatherSchema weather;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  late WeatherSchema weather;

  @override
  void initState() {
    super.initState();
    _updateWeather(widget.weather);
  }

  void _updateWeather(WeatherSchema weatherSchema) {
    setState(() {
      weather = weatherSchema;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () async {
                        WeatherSchema weather =
                            await WeatherModel().getWeatherByCurrentLocation();
                        _updateWeather(weather);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        _toCityScreen();
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '${weather.temperature}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weather.getWeatherIcon(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  weather.getMessage(),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toCityScreen() async {
    var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const CityScreen();
    }));

    if (cityName != null && cityName is String && cityName.isNotEmpty) {
      WeatherSchema weather =
      await WeatherModel().getWeatherByCityName(cityName);

      _updateWeather(weather);
    }
  }
}
