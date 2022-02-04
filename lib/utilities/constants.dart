import 'package:flutter/material.dart';

const String apiKey = "9220ea4fc2a44d1b963104515223001";
const String weatherApiURL = "https://api.weatherapi.com/v1/current.json";

const Color backgroundColor = Color(0xFF0b0c1e);
const Color backgroundColorAccent = Color(0xFF171829);
const Color blue = Color(0xFF0190f6);
const Color blueAccent = Color(0xFF00365C);

final InputDecoration textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
);
