// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, unused_element, unused_import

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:last_weather_app/domain/entities/weather.dart';
import 'package:last_weather_app/presntation/bloc/weather_bloc.dart';
import 'package:last_weather_app/presntation/pages/weather_page.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
    HttpOverrides.global = null;
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WeatherBloc>(
      create: (context) => mockWeatherBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const testWeather = WeatherEntities(
    cityname: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    tempreture: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  // testWidgets(
  //   'text field should trigger state to change from empty to loading',
  //   (widgetTester) async {
  //     //arrange
  //     when(() => mockWeatherBloc.state)
  //         .thenReturn(WeatherEmpty() as WeatherState Function());

  //     //act
  //     await widgetTester.pumpWidget(_makeTestableWidget(const WeatherPage()));
  //     var textField = find.byType(TextField);
  //     expect(textField, findsOneWidget);
  //     await widgetTester.enterText(textField, 'New York');
  //     await widgetTester.pump();
  //     expect(find.text('New York'), findsOneWidget);
  //   },
  // );

  // testWidgets(
  //   'should show progress indicator when state is loading',
  //   (widgetTester) async {
  //     //arrange
  //     when(() => mockWeatherBloc.state)
  //         .thenReturn(WeatherLoading() as WeatherState Function());

  //     //act
  //     await widgetTester.pumpWidget(_makeTestableWidget(const WeatherPage()));

  //     //assert
  //     expect(find.byType(CircularProgressIndicator), findsOneWidget);
  //   },
  // );

  // testWidgets(
  //   'should show widget contain weather data when state is weather loaded',
  //   (widgetTester) async {
  //     //arrange
  //     when(() => mockWeatherBloc.state).thenReturn(
  //         const WeatherLoaded(testWeather) as WeatherState Function());

  //     //act
  //     await widgetTester.pumpWidget(_makeTestableWidget(const WeatherPage()));

  //     //assert
  //     expect(find.byKey(const Key('weather_data')), findsOneWidget);
  //   },
  // );
}
