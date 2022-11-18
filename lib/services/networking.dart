import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  final _baseUrl = "api.openweathermap.org";
  final _weatherPath = "data/2.5/weather";
  final _appId = "b8f5b9f81ce4148af6173c5c76531568";
  final _units = "metric";

  Future<dynamic> getWeatherByCity(String cityName) async {
    Map<String, String> parameters = {
      "q": cityName,
      "units": _units,
      "appid": _appId
    };
    Uri uri = Uri.http(_baseUrl, _weatherPath, parameters);
    Response data = await get(uri);
    return jsonDecode(data.body);
  }

  Future<dynamic> getWeatherByLocation(String lat, String lon) async {
    Map<String, String> parameters = {
      "lat": lat,
      "lon": lon,
      "units": _units,
      "appid": _appId
    };
    Uri uri = Uri.http(_baseUrl, _weatherPath, parameters);

    Response data = await get(uri);

    return jsonDecode(data.body);
  }
}
