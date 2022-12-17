import 'package:flutter/material.dart';
import 'package:weather_with_bloc/cubit/weather_cubit.dart';
import 'package:weather_with_bloc/models/weather_model.dart';
import 'package:weather_with_bloc/widgets/search_field.dart';
import 'package:weather_with_bloc/widgets/weather_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget getPage(WeatherState state) {
      if (state is WeatherInitial) {
        return const SearchField();
      } else if (state is WeatherLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WeatherLoaded) {
        return BuildLoaded(
          weather: state.weather,
        );
      }
      return const SearchField();
    }

    return Scaffold(
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff282626),
                    Color(0xff030303),
                  ]),
            ),
            alignment: Alignment.center,
            child: getPage(state),
          );
        },
      ),
    );
  }
}

class BuildLoaded extends StatelessWidget {
  final WeatherModel weather;
  const BuildLoaded({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherDisplay(
          weather: weather,
        ),
        const SearchField(),
      ],
    );
  }
}
