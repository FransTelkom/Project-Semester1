// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:weather_app/Utils/staticFile.dart';
import 'package:weather_app/model/weatherModel.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  List<WeatherModel> weatherModel = [];

  Home({required this.weatherModel});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await scrollToIndex();
    });
    find_myLocation_index();
    super.initState();
  }

  find_myLocation_index() {
    for (var i = 0; i < widget.weatherModel.length; i++) {
      if (widget.weatherModel[i].name == StaticFile.myLocation) {
        setState(() {
          StaticFile.myLocationIndex = i;
          complete1 = true;
        });
        break;
      }
    }
    find_hour_index();
  }

  DateTime time = DateTime.now();
  int hour_index = 0;
  bool complete1 = false;
  bool complete2 = false;

  find_hour_index() {
    String my_time;
    my_time = time.hour.toString();
    if (my_time.length == 1) {
      my_time = '0' + my_time;
    }
    for (var i = 0;
        i <
            widget.weatherModel[StaticFile.myLocationIndex].weeklyWeather[0]
                .allTime.hour!.length;
        i++) {
      if (widget.weatherModel[StaticFile.myLocationIndex].weeklyWeather[0]
              .allTime.hour![i]
              .substring(0, 2)
              .toString() ==
          my_time) {
        setState(() {
          hour_index = i;
          complete2 = true;
        });
        break;
      }
    }
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  scrollToIndex() async {
    itemScrollController.scrollTo(
        index: hour_index,
        duration: Duration(seconds: 1),
        curve: Curves.easeInCubic);
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060720),
        body: Container(
            height: myHeight,
            width: myWidth,
            child: Column(
              children: [
                SizedBox(
                  height: myHeight * 0.05,
                ),
                Text(
                  widget.weatherModel[StaticFile.myLocationIndex].name
                      .toString(),
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
                SizedBox(
                  height: myHeight * 0.0,
                ),
                Text(
                  '6 November 2024'.toString(),
                  style: TextStyle(
                      fontSize: 17, color: Colors.white.withOpacity(0.5)),
                ),
                SizedBox(
                  height: myHeight * 0.03,
                ),
                Container(
                  height: myHeight * 0.05,
                  width: myWidth * 0.28,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 21, 85, 169),
                                  Color.fromARGB(255, 44, 102, 246),
                                ])),
                            child: Center(
                              child: Text(
                                'Forecast',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.045,
                ),
                Image.asset(
                  widget.weatherModel[StaticFile.myLocationIndex]
                      .weeklyWeather[0].mainImg
                      .toString(),
                  height: myHeight * 0.23,
                  width: myWidth * 0.8,
                ),
                SizedBox(
                  height: myHeight * 0.05,
                ),
                Container(
                  height: myHeight * 0.06,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                'Temp',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14),
                              ),
                              Text(
                                widget.weatherModel[StaticFile.myLocationIndex]
                                    .weeklyWeather[0].mainTemp
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14),
                              ),
                              Text(
                                widget.weatherModel[StaticFile.myLocationIndex]
                                    .weeklyWeather[0].mainWind
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14),
                              ),
                              Text(
                                widget.weatherModel[StaticFile.myLocationIndex]
                                    .weeklyWeather[0].mainHumidity
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.06,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'View full report',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(
                      left: myWidth * 0.03, bottom: myHeight * 0.03),
                  child: ScrollablePositionedList.builder(
                    itemScrollController: itemScrollController,
                    itemPositionsListener: itemPositionsListener,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.weatherModel[StaticFile.myLocationIndex]
                        .weeklyWeather[0].allTime.hour!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.02,
                            vertical: myHeight * 0.03),
                        child: Container(
                          width: myWidth * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: hour_index == index
                                  ? null
                                  : Colors.white.withOpacity(0.05),
                              gradient: hour_index == index
                                  ? LinearGradient(colors: [
                                      Color.fromARGB(255, 21, 85, 169),
                                      Color.fromARGB(255, 44, 102, 246),
                                    ])
                                  : null),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  widget
                                      .weatherModel[StaticFile.myLocationIndex]
                                      .weeklyWeather[0]
                                      .allTime
                                      .img![index]
                                      .toString(),
                                  height: myHeight * 0.05,
                                ),
                                SizedBox(
                                  width: myWidth * 0.02,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .weatherModel[
                                              StaticFile.myLocationIndex]
                                          .weeklyWeather[0]
                                          .allTime
                                          .hour![index]
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                    Text(
                                      widget
                                          .weatherModel[
                                              StaticFile.myLocationIndex]
                                          .weeklyWeather[0]
                                          .allTime
                                          .temps![index]
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
