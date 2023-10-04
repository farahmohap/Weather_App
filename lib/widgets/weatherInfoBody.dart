import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/views/nextDaysWeather.dart';
import 'package:weather_app/widgets/weatherFeatureitem.dart';
import '../models/weather_model.dart';
import 'AnimationContainer.dart';

class WeatherInfoBody extends StatefulWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  State<WeatherInfoBody> createState() => _WeatherInfoBodyState();
}

class _WeatherInfoBodyState extends State<WeatherInfoBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 252, 249, 249),
        body: Stack(children: [
          BgAnimationContainer(),
          Column(children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                      top: height * .001,
                      child: Text(
                        widget.weatherModel.cityName,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                      top: 65,
                    ),
                    height: height * .4,
                    width: width * .8,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 249, 88, 222),
                            Color.fromARGB(255, 251, 255, 25),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.weatherModel.weatherCondition,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${widget.weatherModel.temp.round().toString()}°",
                                style: TextStyle(
                                    fontSize: 130, color: Colors.white),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Day   : ${widget.weatherModel.maxTemp.round().toString()}°",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Night: ${widget.weatherModel.minTemp.round().toString()}°",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/sunrise.png"),
                                  Text(
                                    "${widget.weatherModel.sunrise}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/sunset.png"),
                                  Text(
                                    "${widget.weatherModel.sunset}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          )
                        ]),
                  ),
                  Positioned(
                      top: height * .1 / 2.3,
                      right: width * .4,
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                            "Updated At : ${widget.weatherModel.date.hour}:${widget.weatherModel.date.minute}"),
                      )),
                  Positioned(
                    top: height * .01 - 28,
                    left: width * .4 - 10,
                    child: SizedBox(
                        height: 187, width: 190, child: addAnimation()),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 224, 224, 224).withOpacity(.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 16, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Today",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NextDaysWeather(
                                  nextDays: widget.weatherModel.nextDays,
                                  maxTemp: widget.weatherModel.maxTemp,
                                  minTemp: widget.weatherModel.minTemp,
                                  condition:
                                      widget.weatherModel.weatherCondition,
                                  animation: addAnimation,
                                );
                              }));
                            },
                            child: Text(
                              "Next Days >",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0;
                              i < widget.weatherModel.hoursWeather.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 5, bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: height * .18,
                                    width: width * .19,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${widget.weatherModel.hoursWeather[i]["temp_c"]}°",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Image.network(
                                          "https:${widget.weatherModel.hoursWeather[i]["condition"]["icon"]}",
                                          fit: BoxFit.fill,
                                          width: 100,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            widget.weatherModel
                                                .hoursWeather[i]["time"]
                                                .toString()
                                                .substring(
                                                  10,
                                                ),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
          Container(
            height: height * .15,
            margin: EdgeInsets.only(left: 40, right: 40, top: height * .53),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherFeatureItem(
                  icon: Icons.air_outlined,
                  measure:
                      "${widget.weatherModel.wind.round().toString()}km/h ",
                  feature: "Wind",
                ),
                WeatherFeatureItem(
                  icon: Icons.water_drop_outlined,
                  measure:
                      "${widget.weatherModel.humididty.round().toString()}%",
                  feature: "Humidity",
                ),
                WeatherFeatureItem(
                  icon: Icons.visibility_outlined,
                  measure:
                      "${widget.weatherModel.visibility.round().toString()}km",
                  feature: "Visibility",
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  LottieBuilder addAnimation() {
    if (widget.weatherModel.weatherCondition == "sunny") {
      return Lottie.asset("assets/animations/sunny.json");
    }
    if (widget.weatherModel.weatherCondition == "Partly cloudy" ||
        widget.weatherModel.weatherCondition == "Cloudy" ||
        widget.weatherModel.weatherCondition == "Overcast") {
      return Lottie.asset("assets/animations/cloudy.json");
    }
    if (widget.weatherModel.weatherCondition.contains("rain")) {
      return Lottie.asset("assets/animations/rainy.json");
    }
    return Lottie.asset("assets/animations/sunny.json");
  }
}




