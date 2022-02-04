// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  WeatherInfo({required this.text, required this.imageURL, Key? key})
      : super(key: key);

  String text, imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageURL,
          height: 50,
          width: 50,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
