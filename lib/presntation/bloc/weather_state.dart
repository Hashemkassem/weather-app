part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntities result;

  const WeatherLoaded(this.result);
  @override
  List<Object> get props => [result];
}

class WeatherLoadFailure extends WeatherState {
  final String message;

  const WeatherLoadFailure(this.message);
  @override
  List<Object> get props => [message];
}
