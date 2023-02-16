import 'package:flutter/material.dart';

import '../../functions/constants.dart';
import 'card_unit.dart';

class CardShape extends CardUnit {
  final int shapeId;
  const CardShape({
    super.key,
    required super.idCode,
    super.typeCode = 2,
    required this.shapeId,
  });

  @override
  State<CardUnit> createState() => _CardShapeState();
}

class _CardShapeState extends CardUnitState<CardShape> {
  @override
  Container cardDesign() {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Icon(shapes[widget.shapeId]),
          ],
        )
      ]),
    );
  }
}
