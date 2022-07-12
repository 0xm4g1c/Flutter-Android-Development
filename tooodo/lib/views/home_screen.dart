// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tooodo/views/task_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'tooodo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              'assets/tasks.png',
              height: 300,
            ),
            SizedBox(
              height: 25.0,
            ),
            const Text(
              'Manage Your Tasks',
              style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              textAlign: TextAlign.center,
              'Manage your daily tasks and increase your productivity by seeing all of your progress.',
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 80.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TasksScreen()));
              },
              
               child: Text('Get started'),
            ),
          ],
        ),
      ),
    );
  }
}
