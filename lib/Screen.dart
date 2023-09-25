import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final String apiKey = '856428df1ccd4f52a4f75237231909';
  final String location = 'Chennai';

  String region = '';
  String name="";
  String Country="";
  String temperature = '';
  String weatherCondition = '';
  String localtime="";
  String icon="";

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final response = await http.get(
      Uri.parse('http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no')
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        region = data['location']['name'];
        name=data['location']['region'];
        Country=data['location']['country'];
        temperature = '${data['current']['temp_c']}°C';
        weatherCondition = data['current']['condition']['text'];
        localtime=data['location']['localtime'].toString();
        icon=data['current']['condition']['icon'];

      });
    } else {
      setState(() {
        region = 'Error';
        temperature = 'N/A';
        weatherCondition = 'N/A';

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Weather App'),
        ),
        body: Center(
          child: Column(

            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image:DecorationImage(image:NetworkImage(icon))
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Location : ',style: TextStyle(fontSize: 24),),
                  Text(
                    '$region,',
                    style: const TextStyle(fontSize: 24),
                  ),const SizedBox(width: 5,),

                  Text(
                    '$name,',
                    style: const TextStyle(fontSize: 24),
                  ),const SizedBox(width: 5,),
                  Text(
                    Country,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Date & Time : ',style : TextStyle(fontSize: 24),),
                  Text(
                    localtime,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Temperature : ',style : TextStyle(fontSize: 24),),
                  Text(
                    temperature,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Weather Condition : ',style : TextStyle(fontSize: 24),),
                  Text(
                    weatherCondition,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ),

    );
  }
}