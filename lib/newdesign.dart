import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

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
                      top: height * .04,
                      child: Text(
                        "Cairo",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                      top: 100,
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
                            "Sunny",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Text(
                            "30°",
                            style:
                                TextStyle(fontSize: 130, color: Colors.white),
                          )
                        ]),
                  ),
                  Positioned(
                      top: height * .1,
                      right: width * .28,
                      child: Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text("Monday,12:30"))),
                  Positioned(
                    top: height * .01,
                    left: width * .4,
                    child: SizedBox(
                        height: 200,
                        width: 190,
                        child: Lottie.asset("assets/animations/sunny.json")),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 233, 229, 229),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 16.0, left: 16, top: 88),
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
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < 10; i++)
                            Container(
                              height: height * .14,
                              width: width * .18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "26°",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Image.asset("assets/images/sun.png"),
                                  Text(
                                    "11:00",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )
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
            margin: EdgeInsets.only(left: 40, right: 40, top: height * .56),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherFeatureItem(
                  icon: Icons.air_outlined,
                  measure: "9km/h",
                  feature: "Wind",
                ),
                WeatherFeatureItem(
                  icon: Icons.water_drop_outlined,
                  measure: "9km/h",
                  feature: "Humidity",
                ),
                WeatherFeatureItem(
                  icon: Icons.visibility_outlined,
                  measure: "9km/h",
                  feature: "Visibility",
                ),
              ],
            ),
          ),
        ]),
      ),
    );
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
