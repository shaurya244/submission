class WeatherData {
  final double temperature;
  final int humidity;
  final double windSpeed;


  WeatherData({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
   
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weather = json['main'];
    final wind = json['wind'];
 

    return WeatherData(
      temperature: weather['temp'],
      humidity: weather['humidity'],
      windSpeed: wind['speed'],
     
    );
  }
}