// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;

  Future<String?> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}