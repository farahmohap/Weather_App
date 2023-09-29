
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

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
            //6-trigger cubit
            var getWeatherCubit =
                BlocProvider.of<GetWeatherCubit>(context); //= getweather object
            getWeatherCubit.getWeather(CityName: value);
            Navigator.of(context).pop(); //Navigator.pop(context);
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

//WeatherModel? weatherModel;//Globaaaaal Variable
