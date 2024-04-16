import 'package:last_weather_app/data/repositories/weather_repositorise_impl.dart';
import 'package:last_weather_app/data/source/remote_data_source.dart';
import 'package:last_weather_app/domain/repositories/weather_repo.dart';
import 'package:last_weather_app/domain/usescase/get_current_weather.dart';
import 'package:last_weather_app/presntation/bloc/weather_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepo>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
