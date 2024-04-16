import 'dart:io';

import 'package:last_weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:last_weather_app/data/source/remote_data_source.dart';
import 'package:last_weather_app/domain/entities/weather.dart';
import 'package:last_weather_app/domain/repositories/weather_repo.dart';

import '../../core/error/exception.dart';

class WeatherRepositoryImpl extends WeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntities>> getCurrentWeather(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
