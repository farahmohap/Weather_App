import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class NoWeatherBody extends StatefulWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  State<NoWeatherBody> createState() => _NoWeatherBodyState();
}

class _NoWeatherBodyState extends State<NoWeatherBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          "Search For A City",
          style: TextStyle(
              color: Color.fromARGB(255, 19, 30, 85),
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
      ),
      Center(child: Lottie.asset("assets/animations/world.json")),
      Padding(
        padding: const EdgeInsets.only(left: 40, top: 80, bottom: 50),
        child: SizedBox(
          width: 320,
          height: 50,
          child: TextField(
            onSubmitted: (value) async {
              //6-trigger cubit
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                  context); //= getweather object
              getWeatherCubit.getWeather(CityName: value);
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 32), //to control width&height
                //label: const Text("Search"),
                hintText: "Enter City Name",
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 231, 72, 36)))),
          ),
        ),
      ),
    ]);
  }
}
