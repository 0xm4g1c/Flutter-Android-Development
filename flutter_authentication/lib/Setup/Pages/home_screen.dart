import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          alignment: Alignment.center,
          child: Text(
            'You\'re logged in as: ${widget.user.email}',
            style: Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}
