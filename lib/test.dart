import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(  bottom: true,
      child: Scaffold( resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 252, 249, 249),
        body:ListView(children: [  Container(
              height: double.infinity,
              width: double.infinity,
              child: Lottie.asset("assets/animations/snowfall.json",),
              ),
              ]) ,));
  }
}