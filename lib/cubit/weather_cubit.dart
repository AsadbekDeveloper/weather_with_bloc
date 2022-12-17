import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_with_bloc/models/weather_model.dart';
import 'package:http/http.dart' as http;

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  Future getWeather(String city) async {
    emit(WeatherLoading());
    final url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: '/data/2.5/weather',
      queryParameters: {
        'q': city,
        'appid': '656a19d8e3782a4b2ce7313dc5e5f75c',
      },
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        emit(
          WeatherLoaded(
            jsonDecode(response.body) as Map<String, dynamic>,
          ),
        );
      } else {
        emit(
          WeatherError(
              'Network Error happened. Error code ${response.statusCode}'),
        );
      }
    } catch (e) {
      emit(
        WeatherError(
          e.toString(),
        ),
      );
    }
  }
}
