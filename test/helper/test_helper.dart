import 'package:last_weather_app/data/source/remote_data_source.dart';
import 'package:last_weather_app/domain/usescase/get_current_weather.dart';
import 'package:mockito/annotations.dart';
import 'package:last_weather_app/domain/repositories/weather_repo.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [WeatherRepo, WeatherRemoteDataSource, GetCurrentWeatherUseCase],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
