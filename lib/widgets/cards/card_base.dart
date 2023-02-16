import 'package:flutter/material.dart';

class CardBase extends StatefulWidget {
  final int typeCode;
  const CardBase({super.key, required this.typeCode});

  @override
  State<CardBase> createState() => CardBaseState();
}

class CardBaseState<T extends CardBase> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 55,
      height: 100,
    );
  }
}
