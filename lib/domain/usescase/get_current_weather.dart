import 'package:dartz/dartz.dart';
import 'package:last_weather_app/core/error/failure.dart';
import 'package:last_weather_app/domain/entities/weather.dart';
import 'package:last_weather_app/domain/repositories/weather_repo.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepo weatherRepo;
  GetCurrentWeatherUseCase(this.weatherRepo);
  Future<Either<Failure, WeatherEntities>> execute(String cityName) {
    return weatherRepo.getCurrentWeather(cityName);
  }
}
