class WeatherSchema {

  final int _errorCondition = 999999;

  WeatherSchema._(this.temperature, this.condition, this.cityName);

  factory WeatherSchema.error() {

    return WeatherSchema._(0, 999999, "");
  }

  factory WeatherSchema(dynamic weatherData) {
    double temp = weatherData['main']['temp'];
    int temperature = temp.toInt();
    int condition = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];
    return WeatherSchema._(temperature, condition, cityName);
  }

  int temperature;
  int condition;
  String cityName;

  String getWeatherIcon() {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else if (condition == _errorCondition) {
      return "Error";
    } else {
      return '๐คทโ';
    }
  }

  String getMessage() {
    if (condition == _errorCondition) {
      return "Unable to get weather data";
    } else {
      return "${_getTemperatureMessage()} in $cityName";
    }
  }

  String _getTemperatureMessage() {
    if (temperature > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temperature > 20) {
      return 'Time for shorts and ๐';
    } else if (temperature < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
