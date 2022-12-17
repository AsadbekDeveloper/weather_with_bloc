import 'package:flutter/material.dart';
import 'package:weather_with_bloc/constants.dart';
import 'package:weather_with_bloc/models/weather_model.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;
  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    print(weather.icon);
    final bool isDay = weather.icon.contains('d');
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weather.location,
                  style: title,
                ),
                Text(
                  '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                  style: title,
                )
              ],
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.network(
                'http://openweathermap.org/img/wn/${weather.icon}@4x.png',
                fit: BoxFit.cover,
                color: isDay ? dayColor : nightColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: Text(
                weather.mood,
                style: desc,
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.wind_power_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            weather.wind,
                            style: title,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.water_drop_outlined,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            weather.humidity,
                            style: title,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${(weather.temp - 273.15).toStringAsFixed(1)}\u00B0',
                    style: tempTitle,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
