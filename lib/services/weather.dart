import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:geolocator/geolocator.dart';

import '../schema/weather_schema.dart';

class WeatherModel {

  Future<WeatherSchema> getWeatherByCityName(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper();
    try {
      var data = await networkHelper.getWeatherByCity(cityName);

      return WeatherSchema(data);
    } catch (e) {
      print(e);
      return WeatherSchema.error();
    }
  }

  Future<WeatherSchema> getWeatherByCurrentLocation() async {
    Location location = Location();
    NetworkHelper networkHelper = NetworkHelper();
    try {
      Position position = await location.handleLocation();
      var data = await networkHelper.getWeatherByLocation(
          position.latitude.toString(), position.longitude.toString());

      return WeatherSchema(data);
    } catch (e) {
      print(e);
      return WeatherSchema.error();
    }
  }
}
