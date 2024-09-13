// lib/main.dart
// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'weather_service.dart';
import 'weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  WeatherData? _weatherData;
  String _city = 'London';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _fetchWeatherData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _fetchWeatherData() async {
    final weatherData = await _weatherService.fetchWeather(_city);
    setState(() {
      _weatherData = weatherData;
    });
  }

  void _onSearchCity(String city) {
    setState(() {
      _city = city;
    });
    _fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in $_city'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchWeatherData,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _onSearchCity,
            ),
            SizedBox(height: 20),
            _weatherData != null
                ? Column(
                    children: [
                      Text('Temperature: ${_weatherData!.temperature} °C'),
                      Text('Humidity: ${_weatherData!.humidity}%'),
                      Text('Wind Speed: ${_weatherData!.windSpeed} m/s'),

                    ],
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
