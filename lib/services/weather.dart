import 'package:app_do_clima/utilities/constants.dart';

import 'location.dart';
import 'network.dart';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    ComunicationWithAPI comunicationWithAPI = ComunicationWithAPI(
      url:
          "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=${location.latitude},${location.longitude}&aqi=no&lang=pt",
    );
    dynamic weatherData = await comunicationWithAPI.getData();
    return weatherData;
  }

    Future<dynamic> getCityWeather(String? cityName) async {

    ComunicationWithAPI comunicationWithAPI = ComunicationWithAPI(
      url:
          "$weatherApiURL?key=$apiKey&q=$cityName=&aqi=no&lang=pt",
    );
    dynamic weatherData = await comunicationWithAPI.getData();
    return weatherData;
  }
  

  String? changeEmoji(int conditionCode) {
    if (conditionCode == 1000) {
      return "lib/assets/images/icons8-summer-96.png";
    } else if (conditionCode >= 1003 && conditionCode <= 1063) {
      return "lib/assets/images/icons8-fog-96.png";
    } else if (conditionCode >= 1180 && conditionCode <= 1201) {
      return "lib/assets/images/icons8-torrential-rain-96.png";
    } else {
      return "lib/assets/images/icons8-windy-weather-96.png";
    }
  }
}
