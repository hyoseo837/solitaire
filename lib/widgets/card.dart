import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  final String shape;
  final int number;
  int order, deck;

  PlayingCard({
    super.key,
    required this.shape,
    required this.number,
    required this.order,
    required this.deck,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$shape $number",
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
