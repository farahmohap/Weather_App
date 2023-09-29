import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1"; //https+domain+path
  final String apiKey = "d8c4f6667cdb4203af6220104231709";

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String CityName}) async {
    try {
      Response response = await dio.get(
          //forecast is the method or endpoint
          //after '?' is thr query
          "$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessgae = e.response?.data["error"]["message"] ??
          "OPPS There is an Error,Try Later";
      throw Exception(errorMessgae);
    } catch (e) {
      log(e.toString()); //log from developer not math pkg
      throw Exception("Error");
    }
  }
}


/*if (response.statusCode == 201) {
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } else {
      String errorMessage = response.data["error"]["message"];
      throw Exception(errorMessage);
    } */
