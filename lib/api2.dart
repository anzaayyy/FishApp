import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Weather> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=-8.442355490501155&lon=114.3445271090245&appid=b3a593c0c9ac7e655f33047f8dae476e'));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather');
  }
}

class Weather {
  final double lat;
  final double lon;
  final String main;
  final String country;
  final String name;
  final double temp;

  Weather({
    required this.lat,
    required this.lon,
    required this.main,
    required this.country,
    required this.name,
    required this.temp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lat: (json['coord']['lat'] as double?) ?? 0.0,
      lon: (json['coord']['lon'] as double?) ?? 0.0,
      main: json['weather'][0]['main'] ?? '',
      country: json['sys']['country'] ?? '',
      name: json['name'] ?? '',
      temp: json ['main'] ['temp'] ?? ''
      
    );
  }
  double getTemperatureInCelsius() {
    return (temp - 273.15);
  }
}

void main() => runApp(Api());

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Api> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FISHAPP'),
        ),
        body: Center(
          child: FutureBuilder<Weather>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Latitude: ${snapshot.data!.lat}'),
                    Text('Longitude: ${snapshot.data!.lon}'),
                    Text('Weather: ${snapshot.data!.main}'),
                    Text('Country: ${snapshot.data!.country}'),
                    Text('Kawasan : ${snapshot.data!.name}'),
                    Text('Suhu : ${snapshot.data!.getTemperatureInCelsius()}°C')
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
