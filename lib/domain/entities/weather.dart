// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeatherEntities extends Equatable {
  final String cityname;
  final String main;
  final String description;
  final String iconCode;
  final double tempreture;
  final int pressure;
  final int humidity;
  const WeatherEntities({
    required this.cityname,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.tempreture,
    required this.pressure,
    required this.humidity,
  });
  @override
  List<Object?> get props => [
        cityname,
        main,
        description,
        iconCode,
        tempreture,
        pressure,
        humidity,
      ];
}
