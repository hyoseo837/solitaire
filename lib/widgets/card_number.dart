import 'package:flutter/material.dart';
import 'package:solitaire/functions/constants.dart';
import 'package:solitaire/widgets/card_unit.dart';

class CardNumber extends CardUnit {
  final int number, colorIndex;
  const CardNumber({
    super.key,
    required super.idCode,
    required super.typeCode,
    required this.number,
    required this.colorIndex,
  });

  @override
  State<CardNumber> createState() => _CardNumberState();
}

class _CardNumberState extends State<CardNumber> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {},
      onTapUp: (details) {},
      child: SizedBox(
        width: 55,
        height: 100,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Text(
            widget.number.toString(),
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: colorSet[widget.colorIndex]),
          ),
        ),
      ),
    );
  }
}
