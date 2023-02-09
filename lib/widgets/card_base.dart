import 'package:flutter/material.dart';

class CardBase extends StatefulWidget {
  const CardBase({super.key});

  @override
  State<CardBase> createState() => _CardBaseState();
}

class _CardBaseState extends State<CardBase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 100,
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
