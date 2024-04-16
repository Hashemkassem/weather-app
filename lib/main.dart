import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_weather_app/injection_container.dart';
import 'package:last_weather_app/presntation/bloc/weather_bloc.dart';
import 'package:last_weather_app/presntation/pages/weather_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<WeatherBloc>(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WeatherPage(),
        ));
  }
}
