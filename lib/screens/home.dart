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
              backgroundColor: backgroundColorAccent,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.house,
                    size: 25,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: blue,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.restart_alt_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
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
              Row(
                children: [
                  Text(
                    "${temperatureAsInt.toString()} ",
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    '°',
                    style: TextStyle(
                      color: blue,
                      fontSize: 60,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
                      const Text(
                        'data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
                      const Text(
                        'data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
