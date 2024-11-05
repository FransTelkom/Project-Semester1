// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:weather_app/Utils/staticFile.dart';
import 'package:weather_app/model/weatherModel.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  List<WeatherModel> weatherModel = [];

  Search({required this.weatherModel});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                height: myHeight * 0.06,
              ),
              Text(
                'Pick Location',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: myHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
                child: Column(
                  children: [
                    Text(
                      'find the area or city that you want to know',
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.5)),
                    ),
                    Text(
                      'the detailed weather info at this time',
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: myHeight * 0.05,
              ),
              SizedBox(
                height: myHeight * 0.04,
              ),
              Expanded(
                  child: GridView.custom(
                      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
                      gridDelegate: SliverStairedGridDelegate(
                          mainAxisSpacing: 13,
                          startCrossAxisDirectionReversed: false,
                          pattern: [
                            StairedGridTile(0.5, 3 / 2.2),
                            StairedGridTile(0.5, 3 / 2.2),
                          ]),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: widget.weatherModel.length,
                        (context, indeex) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: myWidth * 0.03),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: StaticFile.myLocation ==
                                          widget.weatherModel[indeex].name
                                              .toString()
                                      ? null
                                      : Colors.white.withOpacity(0.05),
                                  gradient: StaticFile.myLocation ==
                                          widget.weatherModel[indeex].name
                                              .toString()
                                      ? LinearGradient(colors: [
                                          Color.fromARGB(255, 21, 85, 169),
                                          Color.fromARGB(255, 44, 102, 246),
                                        ])
                                      : null,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget
                                                  .weatherModel[indeex]
                                                  .weeklyWeather[indeex]
                                                  .mainTemp
                                                  .toString()
                                                  .replaceAll('C', ''),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: myHeight * 0.01,
                                            ),
                                            Text(
                                              weather_state[indeex].toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                            )
                                          ],
                                        ),
                                        Image.asset(
                                          widget.weatherModel[indeex]
                                              .weeklyWeather[indeex].mainImg
                                              .toString(),
                                          height: myHeight * 0.06,
                                          width: myWidth * 0.15,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.weatherModel[indeex].name
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }

  List<String> weather_state = [
    "Rainny",
    "Rainny",
    "Rainny",
    "Cloudy",
    "Sunny",
    "Sunny",
  ];
}
