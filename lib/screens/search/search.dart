import 'package:app_do_clima/assets/icons/bootstrap_icons.dart';
import 'package:app_do_clima/services/weather.dart';
import 'package:app_do_clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      onTap: () {
                        Navigator.pop(context, cityName);
                      },
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
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: textInputDecoration,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              cityName = value;
              print(cityName);
            },
          ),
        ),
      ),
    );
  }
}
