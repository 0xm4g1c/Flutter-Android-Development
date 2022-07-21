// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors

import 'package:bmi_calculator/views/result_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selectable_container/selectable_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightValue = 0;
  double _weightValue = 0;

  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;

  Color avatarsBackground = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          elevation: 0,
          title: const Text(
            'Health Tracker',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 15.0,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(13.0),
          //color: const Color.fromARGB(245, 163, 74, 74),
          height: double.infinity,
          child: Column(
            // title and subtitle
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'BMI Calculator',
                    style: TextStyle(fontSize: 18.0),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Body Mass Index (BMI) is a measure of body fat based on height and weight that appplies to adult men and women ',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
    
              // Person Avatars
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableContainer(
                        unselectedOpacity: 1,
                        borderSize: 3,
                        padding: 5,
                        unselectedBorderColor: Colors.white,
                        selectedBorderColor: Color.fromARGB(255, 73, 64, 36),
                        selectedBackgroundColor: Colors.grey,
                        onValueChanged: (newValue) {
                          setState(() {
                            _isMaleSelected = newValue;
                          });
                        },
                        selected: _isMaleSelected,
                        child: Image.asset(
                          'assets/male.png',
                          width: 100,
                        )),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SelectableContainer(
                        unselectedOpacity: 1,
                        borderSize: 3,
                        padding: 5,
                        unselectedBorderColor: Colors.white,
                        selectedBorderColor: Color.fromARGB(255, 73, 64, 36),
                        selectedBackgroundColor: Colors.grey,
                        onValueChanged: (newValue) {
                          setState(() {
                            _isFemaleSelected = newValue;
                          });
                        },
                        selected: _isFemaleSelected,
                        child: Image.asset(
                          'assets/female.png',
                          width: 100,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
    
              // Height and Weight sliders
              Container(
                child: Column(children: [
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                          AssetImage('assets/height.png'),
                          size: 40,
                        ),
                        Expanded(
                          child: Slider(
                              activeColor: Color.fromARGB(255, 9, 88, 162),
                              thumbColor: Color.fromARGB(255, 9, 88, 162),
                              divisions: 100,
                              min: 0.0,
                              max: 500.0,
                              value: _heightValue,
                              onChanged: (value) {
                                setState(() {
                                  _heightValue = value;
                                });
                              }),
                        ),
                        Text(
                          '$_heightValue',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                          AssetImage('assets/weight.png'),
                          size: 40,
                        ),
                        Expanded(
                          child: Slider(
                              activeColor: Color.fromARGB(255, 9, 88, 162),
                              thumbColor: Color.fromARGB(255, 9, 88, 162),
                              divisions: 100,
                              min: 0.0,
                              max: 1000.0,
                              value: _weightValue,
                              onChanged: (value) {
                                setState(() {
                                  _weightValue = value;
                                });
                              }),
                        ),
                        Text(
                          '$_weightValue',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
    
              const SizedBox(
                height: 50,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ResultPage(height: _heightValue, weight: _weightValue, selectedFemale: _isFemaleSelected, selectedMale: _isMaleSelected,);
                      }));
                    },
                    child: const Text('Calculate your BMI'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
