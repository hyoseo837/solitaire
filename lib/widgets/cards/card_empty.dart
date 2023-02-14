import 'package:flutter/material.dart';
import 'card_base.dart';

class CardEmpty extends CardBase {
  const CardEmpty({super.key});

  @override
  State<CardEmpty> createState() => _CardEmptyState();
}

class _CardEmptyState extends State<CardEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 55,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey,
        width: 2,
      )),
    );
  }
}
