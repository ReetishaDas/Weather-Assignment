import 'package:weather_assignment/src_weather/location.dart';
import 'package:weather_assignment/src_weather/networking.dart';

const apiKey = 'a5da03527972e03f03668804c1e8e1df';
const openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getTopCitiesWeather(String cityName) async {
    List<String> cityName = ['London', "Paris", "Mumbai", "Delhi", "Chennai"];
    cityName.forEach((c) {
      getCityWeather(c);
    });
  }

  //getting City weather
  Future<dynamic> getCityWeather(String cityName) async {
    var urlCity = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(urlCity);
    var cityWeatherData = await networkHelper.getData();
    return cityWeatherData;
  }

// getting current weather using long lat
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int id) {
    if (id < 300) {
      return '🌩';
    } else if (id < 400) {
      return '🌧';
    } else if (id < 600) {
      return '☔️';
    } else if (id < 700) {
      return '☃️';
    } else if (id < 800) {
      return '🌫';
    } else if (id == 800) {
      return '☀️';
    } else if (id <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
