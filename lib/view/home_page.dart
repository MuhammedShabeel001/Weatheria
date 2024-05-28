import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:weatherio/controller/weather_service.dart';
import 'package:weatherio/controller/weather_servise.dart';
import 'package:weatherio/model/weather_model.dart';
import 'package:weatherio/view/current_weather.dart';
import 'package:weatherio/view/weather_details.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather? _weather;
  final _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      log('$e');
      setState(() {});
    }
  }

  Weather? get weather => _weather;
  WeatherService get weatherService => _weatherService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // backgroundColor: Colors.black,
      body: Container(
        // padding: EdgeInsets.all(),
        child: Center(
          child: _weather == null
              ? CircularProgressIndicator()
              : Column(
                children: [
                  Flexible(flex: 2, child: CurrentWeather(weather: weather,)),
                  Flexible(flex: 1, child: WeatherDetails(weather: weather,))
                ],
              )
        //       : Column(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             // Lottie.asset('assets/animation/Animation - weather.rainy.json'),
        //             // SizedBox(height: 40,),
        //             // Text(
        //             //   _weather?.name ?? "Loading city...",
        //             //   style: TextStyle(
        //             //     fontWeight: FontWeight.bold,
        //             //     // color: Colors.white,
        //             //     fontSize: 20,
        //             //   ),
        //             // ),
        //             // Text(
        //             //   '${_weather?.main.temp.round() ?? 0}°C',
        //             //   style: TextStyle(
        //             //     fontWeight: FontWeight.bold,
        //             //     // color: Colors.white,
        //             //     fontSize: 20,
        //             //   ),
        //             // ),
        //             Card(
                      
        // // margin: EdgeInsets.all(20),
        // color: Colors.amber,
        // child: Column(
        //   children: [
        //     Text(
        //               'Feels like: ${_weather?.main.feelsLike.round() ?? 0}°C',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 18,
        //               ),
        //             ),
        //             Text(
        //               'Min: ${_weather?.main.tempMin.round() ?? 0}°C, Max: ${_weather?.main.tempMax.round() ?? 0}°C',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 18,
        //               ),
        //             ),
        //             Text(
        //               'Humidity: ${_weather?.main.humidity ?? 0}%',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 18,
        //               ),
        //             ),
        //             Text(
        //               'Wind Speed: ${_weather?.wind.speed ?? 0} m/s',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 18,
        //               ),
        //             ),
        //             Text(
        //               'Visibility: ${_weather?.visibility ?? 0} meters',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 18,
        //               ),
        //             ),
        //             Text(
        //               'Sunrise: ${DateTime.fromMillisecondsSinceEpoch((_weather?.sys.sunrise ?? 0) * 1000)}',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 18,
        //               ),
        //             ),
        //             Text(
        //               'Sunset: ${DateTime.fromMillisecondsSinceEpoch((_weather?.sys.sunset ?? 0) * 1000)}',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 18,
        //               ),
        //             ),
        //   ],
        // ),
        //             )
        //             // Text(
        //             //   'Feels like: ${_weather?.main.feelsLike.round() ?? 0}°C',
        //             //   style: TextStyle(
        //             //     color: Colors.white,
        //             //     fontSize: 18,
        //             //   ),
        //             // ),
        //             // Text(
        //             //   'Min: ${_weather?.main.tempMin.round() ?? 0}°C, Max: ${_weather?.main.tempMax.round() ?? 0}°C',
        //             //   style: TextStyle(
        //             //     color: Colors.white,
        //             //     fontSize: 18,
        //             //   ),
        //             // ),
        //             // Text(
        //             //   'Humidity: ${_weather?.main.humidity ?? 0}%',
        //             //   style: TextStyle(
        //             //     color: Colors.white,
        //             //     fontSize: 18,
        //             //   ),
        //             // ),
        //             // Text(
        //             //   'Wind Speed: ${_weather?.wind.speed ?? 0} m/s',
        //             //   style: TextStyle(
        //             //     color: Colors.white,
        //             //     fontSize: 18,
        //             //   ),
        //             // ),
        //             // Text(
        //             //   'Visibility: ${_weather?.visibility ?? 0} meters',
        //             //   style: TextStyle(
        //             //     color: Colors.white,
        //             //     fontSize: 18,
        //             //   ),
        //             // ),
        //             // Text(
        //             //   'Sunrise: ${DateTime.fromMillisecondsSinceEpoch((_weather?.sys.sunrise ?? 0) * 1000)}',
        //             //   style: TextStyle(
        //             //     color: Colors.white,
        //             //     fontSize: 18,
        //             //   ),
        //             // ),
        //             // Text(
        //             //   'Sunset: ${DateTime.fromMillisecondsSinceEpoch((_weather?.sys.sunset ?? 0) * 1000)}',
        //             //   style: TextStyle(
        //             //     color: Colors.white,
        //             //     fontSize: 18,
        //             //   ),
        //             // ),
        //           ],
        //         ),
        ),
      ),
    );
  }
}
