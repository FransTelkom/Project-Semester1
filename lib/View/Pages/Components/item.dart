import 'package:flutter/material.dart';
import 'package:weather_app/model/weatherModel.dart';

// ignore: must_be_immutable
class Item extends StatelessWidget {
  WeeklyWeather? item;
  int? day;
  Item({required this.item, this.day});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: myHeight * 0.015, horizontal: myWidth * 0.07),
      child: Container(
        height: myHeight * 0.11,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item!.day.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  day.toString() + ' November',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  item!.mainTemp.toString().replaceAll('°C', ''),
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '°C',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text('')
                  ],
                ),
              ],
            ),
            Image.asset(
              item!.mainImg.toString(),
              height: myHeight * 0.06,
              width: myWidth * 0.2,
            )
          ],
        ),
      ),
    );
  }
}
