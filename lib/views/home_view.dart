import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/newdesign.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/noWeatherBody.dart';
import 'package:weather_app/widgets/weatherInfoBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // weatherModel;//refer to gloal variable
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 35,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }));
                },
                icon: const Icon(
                  Icons.search,
                  size: 35,
                  color: Colors.orange,
                ))
          ],
        ),
        //widget  used to listen to cubit
        //5-integrate cubit
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return MyWidget(
              weatherModel: state.weatherModel,
            );
          } else {
            return Text("OPPS , ERROR");
          }
        }));
  }
}
