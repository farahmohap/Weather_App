import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../services/weather_servie.dart';

//2-create cubit
class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  //3-create Function -> The Logic that control the states

  getWeather({required CityName}) async {
    try {
      // ignore: unused_local_variable
      WeatherModel weatherModel =
          await WeatherService(Dio()).getCurrentWeather(CityName: CityName);
      //emit(WeatherLoadedState());
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }

    //log(weatherModel!.cityName);
  }
}


