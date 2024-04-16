import 'package:dartz/dartz.dart';
import 'package:last_weather_app/domain/entities/weather.dart';
import 'package:last_weather_app/domain/usescase/get_current_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  late MockWeatherRepo mockWeatherRepo;

  setUp(() {
    mockWeatherRepo = MockWeatherRepo();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepo);
  });
  const testWeatherDetail = WeatherEntities(
    cityname: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    tempreture: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testCityName = 'New York';

  test('should get current weather from the repo ', () async {
    // arrange
    when(mockWeatherRepo.getCurrentWeather(testCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));

    // act
    final result = await getCurrentWeatherUseCase.execute(testCityName);

    // assert
    expect(result, const Right(testWeatherDetail));
  });
}
