import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/views/home_view.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(children: [
          Image.asset(
            "assets/images/intro.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 120,
              left: 50,
              right: 50,
              child: Lottie.asset("assets/animations/intro.json")),
          Positioned(
              top: 60,
              right: 50,
              child: Image.asset("assets/images/cloud.png")),
          Positioned(
              top: 60, left: 50, child: Image.asset("assets/images/rain.png")),
          Positioned(
              top: 160,
              left: 60,
              child: Image.asset("assets/images/cloud-computing.png")),
          Positioned(
              top: 420,
              left: 30,
              child: Text(
                "Prepare to",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 7, 91, 160)),
              )),
          Positioned(
              top: 428,
              left: 180,
              child: Text(
                "be amazed",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 7, 91, 160)),
              )),
          Positioned(
              top: 460,
              left: 50,
              child: Text(
                "by our weather",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 7, 91, 160)),
              )),
          Positioned(
              top: 500,
              left: 70,
              child: Text(
                "app's",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 7, 91, 160)),
              )),
          Positioned(
              top: 495,
              left: 125,
              child: Text(
                "precision",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 7, 91, 160)),
              )),
          Positioned(
              top: 550,
              left: 30,
              child: Text(
                "Stay informed and prepared with accurate ",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 7, 91, 160).withOpacity(.52)),
              )),
          Positioned(
              top: 580,
              left: 80,
              child: Text(
                "forecast at your fingertips",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 7, 91, 160).withOpacity(.52)),
              )),
          Positioned(
              top: 630,
              right: 30,
              child: GestureDetector(
                onTap: () async {
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                      context); //= getweather object
                  List<Placemark> placemarks =
                      await placemarkFromCoordinates(30.54760410, 31.00843690);
                  print(placemarks[0].locality);
                  getWeatherCubit.getWeather(CityName: placemarks[0].locality);

                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return HomeView();
                  }));
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.red)],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber.withOpacity(.9)),
                  child: Text(
                    "Explore",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 7, 91, 160),
                        fontWeight: FontWeight.bold,
                        fontSize: 38),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}

