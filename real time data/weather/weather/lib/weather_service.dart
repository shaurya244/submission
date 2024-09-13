import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  final String apiKey = '68b4bad725bfde9def9080cc52c65fc9';

  Future<WeatherData?> fetchWeather(String city) async {
    try {
      final weatherResponse = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=68b4bad725bfde9def9080cc52c65fc9&units=metric',
      ));



      if (weatherResponse.statusCode == 200 ) {
        final weatherData = json.decode(weatherResponse.body);
        

        // Combine both data
        
        return WeatherData.fromJson(weatherData);
      } else {
        print('Failed to fetch weather data');
        return null;
      }
    } catch (e) {
      print('Error fetching weather data: $e');
      return null;
    }
  }
}