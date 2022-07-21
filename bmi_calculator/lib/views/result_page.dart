// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/custom_bar.dart';

class ResultPage extends StatefulWidget {
  final double height, weight;
  final bool selectedMale, selectedFemale;
  const ResultPage(
      {Key? key,
      required this.height,
      required this.weight,
      required this.selectedFemale,
      required this.selectedMale})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double getBMI() {
    num k = pow(widget.height / 100, 2);
    // bmi value
    double bmi = widget.weight / k;
    if (bmi.isNaN) {
      return (0);
    } else {
      return (bmi);
    }
  }

  String getGenderRange() {
    double bmi = getBMI();
    bool selectedMale = true;
    if (selectedMale) {
      if (bmi < 18.5) {
        return ("Underweight");
      } else if (bmi >= 18.5 && bmi < 25) {
        return ('Normal');
      } else if (bmi >= 25 && bmi < 30) {
        return ('Overweight');
      } else if (bmi >= 40) {
        return ('Obese ');
      } else {
        return ('');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Result',
          style: TextStyle(color: Colors.blueGrey),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'WEIGHT',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('${widget.weight}',
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                      Text(
                        'Kilogram',
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text('HEIGHT'),
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('${widget.height}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500)),
                      Text('CentiMeters',
                          style: TextStyle(fontWeight: FontWeight.w200)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 80,
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            getBMI().toString(),
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent),
                          
                                overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'kg/m²',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(getGenderRange()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  WeightBar(),
                  SizedBox(
                    height: 50,
                  ),
                  IconButton(
                    iconSize: 80,
                    color: Colors.lightBlueAccent,
                    icon: Icon(
                      Icons.arrow_left_sharp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
