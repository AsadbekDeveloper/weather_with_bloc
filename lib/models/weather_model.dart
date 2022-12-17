// ignore_for_file: public_member_api_docs, sort_constructors_first

class WeatherModel {
  final double temp;
  final String location;
  final String icon;
  final String mood;
  final String wind;
  final String humidity;

  WeatherModel({
    required this.temp,
    required this.location,
    required this.icon,
    required this.mood,
    required this.wind,
    required this.humidity,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: double.parse(map['main']['temp'].toString()),
      location: map['name'] as String,
      icon: map['weather'][0]['icon'].toString(),
      mood: map['weather'][0]['main'].toString(),
      humidity: map['main']['humidity'].toString(),
      wind: map['wind']['speed'].toString(),
    );
  }
}
