import 'package:flutter/material.dart';
import 'package:solitaire/functions/constants.dart';

import 'card_unit.dart';

class CardNumber extends CardUnit {
  final int number, colorIndex;
  const CardNumber({
    super.key,
    required super.idCode,
    super.typeCode = 1,
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
