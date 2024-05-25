import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weatherio/controller/weather_servise.dart';
import 'package:weatherio/model/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // final _weatherService = WeatherService('');
  final _weatherService = WeatherService('7019850e36da4a7ee49e283c8850d620');
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      log('$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "Loading city.."),
            Text('${_weather?.temperature.round() }°c')
          ],
        ),
      ),
    );
  }
}
