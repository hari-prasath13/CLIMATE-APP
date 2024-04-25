import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Getloaction{

  double? lattitude;
  double? longitude;
  bool access = true;

  Future<void> location() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        access = false;
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      access = false;
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    lattitude = position.latitude;
    longitude = position.longitude;

  }

}