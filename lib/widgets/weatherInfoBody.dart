import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';


// ignore: must_be_immutable
class WeatherInfoBody extends StatelessWidget {
  WeatherInfoBody({required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    // var weatherModel =
    //     BlocProvider.of<GetWeatherCubit>(context).weatherModel; //passing data
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
         // "Updated At :${stringToDateTime(weatherModel.date).hour}",
         "Updated At :${weatherModel.date.hour}:${weatherModel.date.minute}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                // weatherModel.image.contains("https")
                "https:${weatherModel.image}",
              ),
              Text(
                weatherModel.temp.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    "MAX TEMP :${weatherModel.maxTemp.round()}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "MIN TEMP :${weatherModel.minTemp.round()}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}

// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);
// }
