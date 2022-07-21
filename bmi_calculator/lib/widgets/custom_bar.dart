import 'package:flutter/material.dart';

class WeightBar extends StatelessWidget {
  const WeightBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thin',
              style: TextStyle(color: Colors.blue.withOpacity(0.3)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                width: 100,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  color: Colors.blue.withOpacity(0.3),
                )),
            const SizedBox(
              height: 15,
            ),
            const Text('16.0')
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Normal',
                style: TextStyle(color: Colors.green.withOpacity(0.3))),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 100,
              height: 10,
              color: Colors.green.withOpacity(0.3),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('18.5'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('overweight',style: TextStyle(color: Colors.red.withOpacity(0.3))),
            const SizedBox(
              height: 15,
            ),
            Container(
                width: 120,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: Colors.red.withOpacity(0.3),
                )),
            const SizedBox(
              height: 15,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [ const Text('25.0'), const SizedBox(width: 40), const Text('40.0')],
            ),
          ],
        ),
      ],
    );
  }
}
