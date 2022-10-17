import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // change to 1500
  final int _duration = 1500;
  final CountDownController _controller = CountDownController();

  // animate container
  double width = 10;
  double height = 80;
  Color color = Colors.transparent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'POMOFOCUS',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: CircularCountDownTimer(
                  // Countdown duration in Seconds.
                  duration: _duration,

                  // Countdown initial elapsed Duration in Seconds.
                  initialDuration: 0,

                  // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                  controller: _controller,

                  // Width of the Countdown Widget.
                  width: MediaQuery.of(context).size.width / 1.2,

                  // Height of the Countdown Widget.
                  height: MediaQuery.of(context).size.height / 2,

                  // Ring Color for Countdown Widget.
                  ringColor: Colors.grey[500]!,

                  // Ring Gradient for Countdown Widget.
                  ringGradient: null,

                  // Filling Color for Countdown Widget.
                  fillColor: Colors.blue[400]!,

                  // Filling Gradient for Countdown Widget.
                  fillGradient: null,

                  // Background Color for Countdown Widget.
                  backgroundColor: Colors.black,

                  // Background Gradient for Countdown Widget.
                  backgroundGradient: null,

                  // Border Thickness of the Countdown Ring.
                  strokeWidth: 11.0,

                  // Begin and end contours with a flat edge and no extension.
                  strokeCap: StrokeCap.round,

                  // Text Style for Countdown Text.
                  textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),

                  // Format for the Countdown Text.
                  textFormat: CountdownTextFormat.MM_SS,

                  // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                  isReverse: false,

                  // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                  isReverseAnimation: false,

                  // Handles visibility of the Countdown Text.
                  isTimerTextShown: true,

                  // Handles the timer start.
                  autoStart: false,

                  // This Callback will execute when the Countdown Starts.
                  onStart: () {
                    // Here, do whatever you want
                    //debugPrint('Countdown Started');
                  },

                  // This Callback will execute when the Countdown Ends.
                  onComplete: () {
                    // Here, do whatever you want
                    //debugPrint('Countdown Ended');
                    playSound();
                  },

                  // This Callback will execute when the Countdown Changes.
                  onChange: (String timeStamp) {
                    // Here, do whatever you want
                    //debugPrint('Countdown Changed to $timeStamp');
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                _button(
                    size: 45,
                    icon: const Icon(Icons.pause),
                    onPressed: () => _controller.pause(),
                    color: Colors.green),
                const SizedBox(
                  width: 10,
                ),
                _button(
                  size: 80,
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    setState(() {
                      color = Colors.teal;
                      _borderRadius = BorderRadius.circular(30);
                      const BoxDecoration(
                        shape: BoxShape.circle,
                      );

                      _controller.resume();
                    });
                  },
                  color: Colors.blue[400],
                ),
                const SizedBox(
                  width: 10,
                ),
                _button(
                    size: 45,
                    icon: const Icon(Icons.restart_alt),
                    onPressed: () => _controller.restart(duration: _duration),
                    color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(
      {required Icon icon,
      VoidCallback? onPressed,
      required double? size,
      Color? color}) {
    return Expanded(
      child: AnimatedContainer(
        width: width,
        height: height,
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(color: color, borderRadius: _borderRadius),
        curve: Curves.fastOutSlowIn,
        child: IconButton(
          //iconSize: size,
          color: Colors.black,

          onPressed: onPressed,
          icon: icon,
          //style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

AudioCache player = AudioCache();

void playSound() {
  player.load('alert.mp3');
}
