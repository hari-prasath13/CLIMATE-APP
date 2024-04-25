import 'dart:ffi';
import 'package:climate/getdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'getlocation.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  Homepage(this.response);
  final response;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? top;
  var temp;
  var tempy;
  var pressure;
  var wind;
  var uvi;
  var visibility;
  var windtemp;
  var humidity;
  var location;
  var values;
  var ficon;
  var sicon;
  var siconone;
  var sicontwo;
  var siconthree;
  var siconfour;
  var siconfive;
  var siconsix;
  var siconseven;
  var main;
  var mainone;
  var maintwo;
  var mainthree;
  var mainfour;
  var mainfive;
  var mainsix;
  var mainseven;


  DateTime today = DateTime.now();


  String day = DateFormat('EEEE').format(DateTime.now());
  String dayone = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 1)));
  String daytwo = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 2)));
  String daythree = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 3)));
  String dayfour = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 4)));
  String dayfive = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 5)));
  String daysix = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 6)));
  String dayseven = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 7)));
  String dayeight = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 8)));
  String date = DateFormat('d MMMM yyyy').format(DateTime.now());
  String dateone = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 1)));
  String datetwo = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 2)));
  String datethree = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 3)));
  String datefour = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 4)));
  String datefive = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 5)));
  String datesix = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 6)));
  String dateseven = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 7)));
  String dateeight = DateFormat('d MMMM yyyy').format(DateTime.now().add(Duration(days: 8)));

  @override
  void initState() {
    super.initState();
    print("hhh");
    updateui(widget.response);
    print(dateeight);
  }

  void updateui(dynamic data) async {
    setState(() {
      values = widget.response;
      top = data['current']['weather'][0]['main'];
      temp = data['current']['temp'];
      tempy = temp.round();
      print(tempy);
      pressure = data['current']['pressure'];
      wind = data['current']['wind_speed'];
      uvi = data['current']['uvi'];
      visibility = data['current']['visibility'] / 1000;
      windtemp = data['current']['wind_deg'];
      humidity = data['current']['humidity'];
      location =data['timezone'];
      ficon =data['current']['weather'][0]['icon'];
      sicon =values['daily'][0]['weather'][0]['icon'];
      siconone =values['daily'][1]['weather'][0]['icon'];
      sicontwo =values['daily'][2]['weather'][0]['icon'];
      siconthree =values['daily'][3]['weather'][0]['icon'];
      siconfour =values['daily'][4]['weather'][0]['icon'];
      siconfive =values['daily'][5]['weather'][0]['icon'];
      siconsix =values['daily'][6]['weather'][0]['icon'];
      siconseven =values['daily'][7]['weather'][0]['icon'];
      main =values['daily'][0]['weather'][0]['main'];
      mainone =values['daily'][1]['weather'][0]['main'];
      maintwo =values['daily'][2]['weather'][0]['main'];
      mainthree =values['daily'][3]['weather'][0]['main'];
      mainfour =values['daily'][4]['weather'][0]['main'];
      mainfive =values['daily'][5]['weather'][0]['main'];
      mainsix =values['daily'][6]['weather'][0]['main'];
      mainseven =values['daily'][7]['weather'][0]['main'];
    });
  }

  void iconvale(int i) async{

    return values['daily'][i]['weather'][0]['icon'];

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(primary: Color(0xFF1f1f1f)),
        scaffoldBackgroundColor: Color(0xFF1f1f1f),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF1f1f1f),
        appBar: AppBar(
          title: Center(
            child: Text(
              'WEATHER APP',
              // Ensure that kapptext is defined somewhere in your code.
              style: kapptext,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherIcon(
                      iconCode: "$ficon",
                      locate: '$location',
                    ),
                    // Icon(Icons.cloud,size: 140,),
                    SizedBox(width: 5,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$top',
                          style: TextStyle(fontSize: 28),
                        ),
                        Text(
                          '$tempy °c',
                          style: TextStyle(fontSize: 28),
                        ),
                        Row(
                          children: [
                            Text(
                              '$day',
                              style: TextStyle(fontSize: 19),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '$date',
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF292929),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconcolumn(
                              icon: FontAwesomeIcons.gaugeSimple,
                              first: '$pressure Pa',
                              second: 'PRESSURE'),
                          iconcolumn(
                              icon: FontAwesomeIcons.wind,
                              first: '$wind Km/h',
                              second: 'WINDSPEED'),
                          iconcolumn(
                              icon: FontAwesomeIcons.sun,
                              first: '$uvi ',
                              second: 'UV'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconcolumn(
                              icon: FontAwesomeIcons.eye,
                              first: '$visibility Km',
                              second: 'VISIBILITY'),
                          iconcolumn(
                              icon: FontAwesomeIcons.temperatureFull,
                              first: '$windtemp K',
                              second: 'WIND TEMP'),
                          iconcolumn(
                              icon: FontAwesomeIcons.droplet,
                              first: '$humidity ',
                              second: 'HUMIDITY'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    minitabs(
                        icon: '$sicon',
                        day: '$dayone',
                        date: '$dateone',
                        may: '$main'),

                    minitabs(
                        icon: '$siconone',
                        day: '$daytwo',
                        date: '$datetwo',
                        may: '$mainone'),

                    minitabs(
                        icon: '$sicontwo',
                        day: '$daythree',
                        date: '$datethree',
                        may: '$maintwo'),

                    minitabs(
                        icon: '$siconthree',
                        day: '$dayfour',
                        date: '$datefour',
                        may: '$mainthree'),

                    minitabs(
                        icon: '$siconfour',
                        day: '$dayfive',
                        date: '$datefive',
                        may: '$mainfour'),

                    minitabs(
                        icon: '$siconfive',
                        day: '$daysix',
                        date: '$datesix',
                        may: '$mainfive'),

                    minitabs(
                        icon: '$siconsix',
                        day: '$dayseven',
                        date: '$dateseven',
                        may: '$mainsix'),

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

class iconcolumn extends StatelessWidget {
  iconcolumn({required this.icon, required this.first, required this.second});

  final IconData icon;
  String first;
  String second;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 37,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$first',
          style: TextStyle(fontSize: 18),
        ),
        Text('$second'),
      ],
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String iconCode;
  final String locate;

  WeatherIcon({
    required this.iconCode,
    required this.locate,
  });

  @override
  Widget build(BuildContext context) {
    String iconUrl = "http://openweathermap.org/img/wn/$iconCode.png";
    return Container(
        child: Column(
            children: [
          Image.network(
          iconUrl,
          height: 110,
          width: 170,
          fit: BoxFit.contain,
        ),
         Text("$locate", ),
        ],
        ),
    );
  }
}

class weeklyicon extends StatelessWidget {
  weeklyicon({required this.iconcode});
final String iconcode;

  @override
  Widget build(BuildContext context) {
    String iconUrl = "http://openweathermap.org/img/wn/$iconcode.png";
    return Image.network(
      iconUrl,
      height: 110,
      width: 140,
      fit: BoxFit.contain,
    );
  }
}

class minitabs extends StatelessWidget {
  minitabs({required this.icon,required this.day,required this.date,required this.may});
   String icon;
   String day;
   String date;
   String may;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 110,
      color: Color(0xFF292929),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          weeklyicon(iconcode: '$icon'),
          Text('$may',style: TextStyle(fontSize: 19),),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$day',style: TextStyle(fontSize: 19),),
              Text('$date',style: TextStyle(fontSize: 19),),
            ],
          ),

        ],
      ),
    ) ;
  }
}



