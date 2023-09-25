
import 'package:flutter/material.dart';
import 'package:get_weather/Screen.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Weather(),
    );
  }
}
class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Column(
        children: [
          Container(

            child: Image.network('https://ichef.bbci.co.uk/images/ic/896x504/p04g3syn.jpg',fit: BoxFit.fill,),

            ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherApp()));
          }, child: Text('Weather Condition in Chennai')),
        ],
      ),
    );
  }
}
