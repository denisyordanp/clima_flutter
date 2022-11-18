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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else if (condition == _errorCondition) {
      return "Error";
    } else {
      return '🤷‍';
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
      return 'It\'s 🍦 time';
    } else if (temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
