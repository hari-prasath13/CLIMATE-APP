import 'package:flutter/material.dart';
import 'getlocation.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Getdata{
  Getdata(this.url);
  String url;

  Future getdata() async {

    final response = await get(Uri.parse('$url'));
    if(response.statusCode == 200){
      String data =response.body;
      print('getdataroshan');

      return jsonDecode(data);
    }
    else{
      print(response.statusCode);
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }

  }
}

// temp= decoder['current']['temp'] - 273.15;
// main=decoder['current']['weather'][0]['main'];
// print(main);

