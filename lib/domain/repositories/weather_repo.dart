import 'package:dartz/dartz.dart';
import 'package:last_weather_app/core/error/failure.dart';
import 'package:last_weather_app/domain/entities/weather.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherEntities>> getCurrentWeather(String cityName);
}
