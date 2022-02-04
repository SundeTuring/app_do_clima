// ignore_for_file: sized_box_for_whitespace

import 'package:app_do_clima/assets/icons/bootstrap_icons.dart';
import 'package:app_do_clima/screens/home/components/weather_info.dart';
import 'package:app_do_clima/screens/search/search.dart';
import 'package:app_do_clima/services/weather.dart';
import 'package:app_do_clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key, @required this.locationWeather}) : super(key: key);

  final dynamic locationWeather;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? temperatureAsInt,
      humidity,
      feelsLikeInCAsInt,
      windSpeedAsInt,
      conditionCode;
  double? temperature, windSpeed, feelsLikeInC;
  String? climateCondition, cityName, newCityName;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      feelsLikeInC = weatherData['current']['feelslike_c'];
      feelsLikeInCAsInt = feelsLikeInC?.toInt();
      windSpeed = weatherData['current']['wind_kph'];
      windSpeedAsInt = windSpeed?.toInt();
      conditionCode = weatherData['current']['condition']['code'];
      temperature = weatherData['current']['temp_c'];
      temperatureAsInt = temperature?.toInt();
      humidity = weatherData['current']['humidity'];
      cityName = weatherData['location']['name'];
      climateCondition = weatherData['current']['condition']['text'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            child: BottomAppBar(
              color: backgroundColorAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          BootstrapIcons.houseFill,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );

                      if (typedName != null) {
                        var weatherData =
                            await WeatherModel().getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          BootstrapIcons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 32,
                    ),
                    Row(
                      children: [
                        Text(
                          cityName.toString(),
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            BootstrapIcons.geoAltFill,
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        dynamic weatherData =
                            await WeatherModel().getWeatherData();
                        updateUI(
                          weatherData,
                        );
                      },
                      icon: const Icon(
                        BootstrapIcons.arrowClockwise,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: Text(
                  'Clima de hoje',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                climateCondition.toString(),
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                WeatherModel().changeEmoji(conditionCode!.toInt()).toString(),
              ),
              RichText(
                text: TextSpan(
                  text: "${temperatureAsInt.toString()} ",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: '°',
                      style: TextStyle(
                        color: blue,
                        fontSize: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherInfo(
                      text: '${windSpeedAsInt.toString()} km/h',
                      imageURL: 'lib/assets/images/icons8-vento-48.png',
                    ),
                    WeatherInfo(
                      text: '${humidity.toString()} %',
                      imageURL:
                          'lib/assets/images/icons8-ponto-de-orvalho-48.png',
                    ),
                    WeatherInfo(
                      text: '${feelsLikeInCAsInt.toString()} °',
                      imageURL:
                          'lib/assets/images/icons8-sensação-térmica-48.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
