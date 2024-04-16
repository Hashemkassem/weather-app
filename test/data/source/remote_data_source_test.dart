import 'package:flutter_test/flutter_test.dart';
import 'package:last_weather_app/core/constant/constant.dart';
import 'package:last_weather_app/core/error/exception.dart';
import 'package:last_weather_app/data/models/weather_model.dart';
import 'package:last_weather_app/data/source/remote_data_source.dart';
import 'package:mockito/mockito.dart';

import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testCityName = 'New York';

  group('get current weather', () {
    test('should return weather model when the response code is 200', () async {
      //arrange
      when(mockHttpClient
              .get(Uri.parse(Urls.currentWeatherByName(testCityName))))
          .thenAnswer((_) async => http.Response(
              readJson('helper/dummy_data/dummy_weather_response.json'), 200));

      //act
      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

      //assert
      expect(result, isA<WeatherModel>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient
              .get(Uri.parse(Urls.currentWeatherByName(testCityName))),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result =
            weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
