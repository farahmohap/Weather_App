import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
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
    return SizedBox(
  width: 200.0,
  height: 100.0,
  child: Shimmer(child: Center(child: CircularProgressIndicator()),gradient:  const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(170, 249, 88, 222),
                                          Color.fromARGB(183, 251, 255, 25),
                                        ],
                                      ),)
);
  }
}
