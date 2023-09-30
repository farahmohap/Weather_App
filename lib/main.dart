import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/newdesign.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/noWeatherBody.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //4-provide cubit
    return BlocProvider(
      //المكاناللي هوفر فيه كيوبيت لكل الinherited widgets
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        //new context
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return const MaterialApp(
              // theme: ThemeData(
              //     primarySwatch: getThemeColor(
              //         BlocProvider.of<GetWeatherCubit>(context)
              //             .weatherModel
              //             ?.weatherCondition)),
                debugShowCheckedModeBanner: false,
              home:HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;
  return Colors.orange;
}
