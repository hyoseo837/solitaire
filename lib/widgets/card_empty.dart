import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_base.dart';

class CardEmpty extends CardBase {
  const CardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
