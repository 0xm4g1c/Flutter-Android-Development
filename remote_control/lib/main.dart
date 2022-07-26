import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: MyHomePage(title: 'Flutter Digital Remote Control'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(5, 50, 0, 0),
        color: Colors.blue.withOpacity(.6),
        child: Column(
          children: [
            // top bar navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.power_settings_new, color: Color.fromARGB(255, 254, 5, 117),)),
              ],
            ),
            const SizedBox(
              height: 80,
            ),

            // middle circle button
            Container(
              width: 500,
              height: 250,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.all(width: 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.expand_less)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_left)),
                      const Text('ENTER'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right)),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.expand_more)),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),

            // lower two buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 60,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.expand_less)),
                      IconButton(onPressed: () {}, icon: const Text('OK')),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.expand_more)),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 60,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add)),
                      IconButton(onPressed: () {}, icon: const Text('OK')),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

   