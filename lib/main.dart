import 'package:app_do_clima/screens/home.dart';
import 'package:app_do_clima/services/weather.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'utilities/constants.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "App do clima",
      home: ClimaApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ClimaApp extends StatefulWidget {
  const ClimaApp({Key? key}) : super(key: key);

  @override
  State<ClimaApp> createState() => _ClimaAppState();
}

class _ClimaAppState extends State<ClimaApp> {
  @override
  void initState() {
    super.initState();
    getInformation();
  }

  void getInformation() async {
    dynamic weatherData = await WeatherService().getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Home(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: LoadingAnimationWidget.inkDrop(
            color: blue,
            size: 50,
          ),
        ),
      ),
    );
  }
}
