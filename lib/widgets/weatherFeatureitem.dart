import 'package:flutter/material.dart';

class WeatherFeatureItem extends StatelessWidget {
  WeatherFeatureItem(
      {required this.icon, required this.measure, required this.feature});
  final IconData icon;
  final String measure;
  final String feature;
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
