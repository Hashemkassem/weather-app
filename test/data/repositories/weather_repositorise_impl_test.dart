// ignore_for_file: unused_import

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:last_weather_app/core/error/exception.dart';
import 'package:last_weather_app/core/error/failure.dart';
import 'package:last_weather_app/data/models/weather_model.dart';
import 'package:last_weather_app/data/repositories/weather_repositorise_impl.dart';
import 'package:last_weather_app/domain/entities/weather.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(
      weatherRemoteDataSource: mockWeatherRemoteDataSource,
    );
  });

  const testWeatherEntity = WeatherEntities(
    cityname: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    tempreture: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testWeatherModel = WeatherModel(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testCityName = 'New York';

  group('get current weather', () {
    test(
      'should return current weather when a call to data source is successful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenAnswer((_) async => testWeatherModel);

        // act
        final result =
            await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(result, equals(const Right(testWeatherEntity)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenThrow(ServerException());

        // act
        final result =
            await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(result, equals(Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenThrow(
                const SocketException('Failed to connect to the network'));

        // act
        final result =
            await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(
            result,
            equals(
                Left(ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });
}
