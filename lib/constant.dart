import 'package:flutter/material.dart';
import 'getlocation.dart';
import 'getdata.dart';

const kapptext=TextStyle(
  fontSize: 27,
  fontWeight: FontWeight.bold,
  color:Colors.white,
);

const kapi ='992e1f3277b524ab494dfb7efa59253c';

Future<Map<String, dynamic>> kgetresponse() async {
  Getloaction location = Getloaction();
  await location.location();
  double? lattitude = location.lattitude;
  double? longitude = location.longitude;

  var url = 'https://api.openweathermap.org/data/3.0/onecall?lat=${lattitude?.toStringAsFixed(6)}&lon=${longitude?.toStringAsFixed(6)}&appid=$kapi';
  var weatherdata = await Getdata(url).getdata();
  print('constant');
  return weatherdata;
}
