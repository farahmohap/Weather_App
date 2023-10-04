import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BgAnimationContainer extends StatelessWidget {
  const BgAnimationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child:
            Lottie.asset("assets/animations/snowfall.json", fit: BoxFit.fill));
  }
}
