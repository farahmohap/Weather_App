//1-create states

import '../../models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {} //no weather state

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

 WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {}
