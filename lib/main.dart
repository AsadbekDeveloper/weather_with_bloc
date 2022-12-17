import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cubit/weather_cubit.dart';
import 'screens/home_page.dart';

void main(List<String> args) {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: HomePage(),
    );
  }
}
