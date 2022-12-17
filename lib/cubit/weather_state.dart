part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  late final WeatherModel weather;
  WeatherLoaded(Map<String, dynamic> map){
    weather = WeatherModel.fromMap(map);
  }
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
