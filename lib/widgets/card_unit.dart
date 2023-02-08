import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_base.dart';

class CardUnit extends CardBase {
  final int idCode;
  final int typeCode;

  const CardUnit(this.idCode, this.typeCode, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 80,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$idCode",
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
