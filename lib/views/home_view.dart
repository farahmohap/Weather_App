import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/WeatherInfoBody.dart';
import 'package:weather_app/widgets/noWeatherBody.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // weatherModel;//refer to gloal variable
    return SafeArea(
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 35,
            title: Text(
              "World Weather",
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            actions: [
              AnimSearchBar(
                searchIconColor: Colors.orange,
                textFieldIconColor: Colors.orange,
                closeSearchOnSuffixTap: true,
                rtl: true,
                helpText: "Search for a city",
                width: 300,
                textController: TextEditingController(),
                onSubmitted: (value) async {
                  //6-trigger cubit
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                      context); //= getweather object
                  getWeatherCubit.getWeather(CityName: value);
                },
                onSuffixTap: () {},
              )
            ],
          ),
          //widget  used to listen to cubit
          //5-integrate cubit
          body: BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
            if (state is WeatherInitialState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weatherModel: state.weatherModel,
              );
            } else {
              return Text("Opps , There Is An Error");
            }
          })),
    );
  }
}
