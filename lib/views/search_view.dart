import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_servie.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search City")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
            child: TextField(
          // onChanged: (value){
          //   //trigger continuasly
          //   //used for search as example
          // },
          onSubmitted: (value) async {
            weatherModel =
                await WeatherService(Dio()).getCurrentWeather(CityName: value);
            Navigator.of(context).pop(); //Navigator.pop(context);
            log(weatherModel!.cityName);
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 32), //to control width&height
              label: const Text("Search"),
              hintText: "Enter City Name",
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.green))),
        )),
      ),
    );
  }
}

WeatherModel? weatherModel;//Globaaaaal Variable
