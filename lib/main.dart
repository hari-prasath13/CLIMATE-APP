import'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'getdata.dart';
import 'getlocation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



void main() {
  runApp(MaterialApp(
    home: Apibrain(),
  ));
}

class Apibrain extends StatefulWidget {
  @override
  State<Apibrain> createState() => _ApibrainState();
}

class _ApibrainState extends State<Apibrain> {
  double? lattitude;
  double? longitude;
  String? top;
  @override
  void initState() {
    super.initState();
    // Perform initialization tasks here
    getloaction();
  }

  Future getloaction() async{
    Getloaction location = Getloaction();
    await location.location();
    lattitude= location.lattitude;
    longitude= location.longitude;

    var url = 'https://api.openweathermap.org/data/3.0/onecall?lat=${lattitude?.toStringAsFixed(6)}&lon=${longitude?.toStringAsFixed(6)}&appid=$kapi&units=metric';

    var weatherdata= await Getdata(url).getdata();
    print("done");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {return Homepage(weatherdata);}),
    );

    print("finish");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 50.0,

        ),
      ),
    );
  }
}