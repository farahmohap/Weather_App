import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            'Alexandria',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
           Text(
            'updated at 23:46',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
           SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image.asset(
              //   'assets/images/cloudy.png',
              // ),
               Text(
                '17',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
               Column(
                children: [
                  Text(
                    'Maxtemp: 24',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Mintemp: 16',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
           SizedBox(
            height: 32,
          ),
           Text(
            'Ligh Rain',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
