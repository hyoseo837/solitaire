import 'package:flutter/material.dart';

class CardBase extends StatelessWidget {
  const CardBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
    );
  }
}
