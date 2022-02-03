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
}
