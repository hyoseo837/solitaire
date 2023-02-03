import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_base.dart';

class CardUnit extends CardBase {
  final String shape;
  final int number;
  final int idCode;

  const CardUnit(
      {super.key,
      required this.shape,
      required this.number,
      required this.idCode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 80,
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
