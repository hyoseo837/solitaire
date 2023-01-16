import 'package:flutter/material.dart';

class CardHolder extends StatelessWidget {
  const CardHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: const SizedBox(
          width: 100,
          height: 200,
        ),
      ),
    );
  }
}
