import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'models/weather_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     "Cairo",
        //     style: TextStyle(
        //         color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        backgroundColor: Color.fromARGB(255, 252, 249, 249),
        body: Stack(children: [
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
                            fontSize: 40, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                      top: 60,
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
                          Text(
                            "${widget.weatherModel.temp.round().toString()}°",
                            style:
                                TextStyle(fontSize: 130, color: Colors.white),
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
                    top: height * .01 - 30,
                    left: width * .4 - 10,
                    child: SizedBox(
                        height: 200, width: 190, child: addAnimation()),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 233, 229, 229),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 16, top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Next 7 Days >",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
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
                                      color: Colors.white,
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
                                        Text(
                                          widget.weatherModel.hoursWeather[i]["time"]
                                         ,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
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
            height: height * .19,
            margin: EdgeInsets.only(left: 40, right: 40, top: height * .5),
            padding: EdgeInsets.all(30),
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
          ),
        ]),
      ),
    );
  }

  TimeConverter(int i) {
    var date = DateTime.fromMicrosecondsSinceEpoch(
        widget.weatherModel.hoursWeather[i]["time"]);

    return date;
  }

  LottieBuilder addAnimation() {
    if (widget.weatherModel.weatherCondition == "sunny") {
      return Lottie.asset("assets/animations/sunny.json");
    }
    if (widget.weatherModel.weatherCondition == "Partly cloudy" ||
        widget.weatherModel.weatherCondition == "Cloudy") {
      return Lottie.asset("assets/animations/cloudy.json");
    }
    if (widget.weatherModel.weatherCondition == "Rainy") {
      return Lottie.asset("assets/animations/rainy.json");
    }
    return Lottie.asset("assets/animations/sunny.json");
  }
}

class WeatherFeatureItem extends StatelessWidget {
  WeatherFeatureItem(
      {required this.icon, required this.measure, required this.feature});
  IconData icon;
  String measure;
  String feature;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Color.fromARGB(255, 11, 105, 228),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          measure,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          feature,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        )
      ],
    );
  }
}
