import 'package:last_weather_app/domain/entities/weather.dart';

class WeatherModel extends WeatherEntities {
  const WeatherModel({
    required String cityName,
    required String main,
    required String description,
    required String iconCode,
    required double temperature,
    required int pressure,
    required int humidity,
  }) : super(
            cityname: cityName,
            main: main,
            description: description,
            iconCode: iconCode,
            tempreture: temperature,
            pressure: pressure,
            humidity: humidity);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': tempreture,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': cityname,
      };

  WeatherEntities toEntity() => WeatherEntities(
        cityname: cityname,
        main: main,
        description: description,
        iconCode: iconCode,
        tempreture: tempreture,
        pressure: pressure,
        humidity: humidity,
      );
}
