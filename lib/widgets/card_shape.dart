import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_unit.dart';
import '../functions/constants.dart';

class CardShape extends CardUnit {
  final int shapeId;
  const CardShape(
      {super.key,
      required super.idCode,
      required super.typeCode,
      required this.shapeId});

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
