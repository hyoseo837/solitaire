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
  State<CardUnit> createState() => _CardNumberState();
}

class _CardNumberState extends CardUnitState<CardNumber> {
  @override
  Container cardDesign() {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Text(
              widget.number.toString(),
              style:
                  TextStyle(fontSize: 20, color: colorSet[widget.colorIndex]),
            )
          ],
        )
      ]),
    );
  }
}
