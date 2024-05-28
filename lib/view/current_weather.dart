import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherio/model/weather_model.dart';

class CurrentWeather extends StatefulWidget {
  final Weather? weather;
  const CurrentWeather({Key? key, this.weather}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
          child: Container(
        width: double.infinity,
        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(),
            Lottie.asset('assets/animation/Animation - weather.sunny.json'),
            SizedBox(height: 20,),
            Text(
              widget.weather?.name ?? "loading",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text('${widget.weather?.main.temp.round() ?? 0}°C',
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      )),
    );
  }
}
