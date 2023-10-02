import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class NextDaysWeather extends StatelessWidget {
  const NextDaysWeather({
    required this.nextDays,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.animation,
  });
  final double maxTemp;
  final double minTemp;
  final String condition;
  final List nextDays;
  final Widget Function() animation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "Next Days",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: height * .25,
            width: width * 2,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 249, 88, 222),
                    Color.fromARGB(255, 251, 255, 25),
                  ],
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: animation(),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tommorow",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        "${double.parse(maxTemp.toString()).round().toString()}/${double.parse(minTemp.toString()).round().toString()}°",
                        style: TextStyle(color: Colors.white, fontSize: 70),
                      ),
                      Text(
                        condition,
                        style: TextStyle(
                            color: Colors.white.withOpacity(.9), fontSize: 18),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: nextDays.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${DateFormat('EEEE').format(DateTime.parse(nextDays[index]["date"])).substring(0, 3)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(width: 25),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 70,
                                child: Image.network(
                                    "https:${nextDays[index]["day"]["condition"]["icon"]}"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(nextDays[index]["day"]["condition"]['text'])
                            ],
                          ),
                        ),
                        Text(
                            "${double.parse(nextDays[index]["day"]["maxtemp_c"].toString()).round().toString()}/${double.parse(nextDays[index]["day"]["mintemp_c"].toString()).round().toString()}°",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
