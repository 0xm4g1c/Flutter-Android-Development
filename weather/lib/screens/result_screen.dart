// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';

class ResultScreen extends StatefulWidget {
  final String placeToSearch;
  const ResultScreen({Key? key, required this.placeToSearch}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var currentDate = DateTime.now();
  late Future<WeatherData?> finalResponse;

  @override
  void initState() {
    super.initState();
    finalResponse = getWeather();
  }

  Future<WeatherData> getWeather() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.placeToSearch}&appid=${apiKey}&units=metric';

    final response = await http.get(Uri.parse(url));
    //final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
      //
    } 
      
      //throw 'Failed to load API';
    
    throw(response.statusCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    //final Future<String> apiResponse = getWeather().toString();
    return FutureBuilder<WeatherData?>(
        future: finalResponse,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child: Column(
                  children: [
                    // top part
                    Text(
                      widget.placeToSearch,
                      style: GoogleFonts.cairo(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 1.5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${DateFormat('EEEE').format(currentDate).toUpperCase()} ${currentDate.hour}:${currentDate.minute}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    SizedBox(
                      height: 200,
                      //color: Colors.red,
                      child: Image.network(
                        "http://openweathermap.org/img/w/${snapshot.data!.weather[0].icon}.png",
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "${snapshot.data!.main.temp.toString()} °C",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(
                      height: 90,
                    ),

                    // wind, pressure and humidity part
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/icons/wind.png',
                              width: 50,
                              height: 20,
                            ),
                            Text('Wind'),
                            Text(
                              snapshot.data!.wind.speed.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 10,
                          thickness: 20,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/icons/pressure.png',
                              width: 50,
                              height: 20,
                            ),
                            const Text('Pressure'),
                            Text(snapshot.data!.main.pressure.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        Divider(
                          height: 10,
                          thickness: 20,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/icons/humidity.png',
                              width: 50,
                              height: 20,
                            ),
                            const Text('Humidity'),
                            Text(
                              snapshot.data!.main.humidity.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text('${snapshot.error}')));
          }

          return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: const CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 5,
              ));
        });
  }
}
