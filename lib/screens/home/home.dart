import 'package:app_do_clima/assets/icons/bootstrap_icons.dart';
import 'package:app_do_clima/services/weather.dart';
import 'package:app_do_clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key, @required this.locationWeather}) : super(key: key);

  final dynamic locationWeather;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? temperatureAsInt, humidity, feelsLikeInCAsInt, windSpeedAsInt;
  double? temperature, windSpeed, feelsLikeInC;
  String? condition, cityName, newCityName;

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
      temperature = weatherData['current']['temp_c'];
      temperatureAsInt = temperature?.toInt();
      humidity = weatherData['current']['humidity'];
      cityName = weatherData['location']['name'];
      condition = weatherData['current']['condition']['text'];
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
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 100,
            child: BottomNavigationBar(
              selectedFontSize: 12,
              unselectedFontSize: 12,
              unselectedItemColor: Colors.grey.withOpacity(0.5),
              unselectedLabelStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
              ),
              backgroundColor: backgroundColorAccent,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    BootstrapIcons.houseFill,
                    size: 35,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    BootstrapIcons.search,
                    size: 35,
                  ),
                  label: 'pesquisa',
                ),
              ],
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
                    SizedBox(
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
                condition.toString(),
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                    Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/icons8-vento-48.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          '${windSpeedAsInt.toString()} km/h',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/icons8-ponto-de-orvalho-48.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          '${humidity.toString()} %',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/icons8-sensação-térmica-48.png',
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          '${feelsLikeInCAsInt.toString()} °',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
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
