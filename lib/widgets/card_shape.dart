import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_unit.dart';

import '../functions/constants.dart';

class CardShape extends CardUnit {
  final int shapeId;

  const CardShape(this.shapeId,
      {super.key, required super.idCode, required super.typeCode});

  @override
  State<CardShape> createState() => _CardShapeState();
}

class _CardShapeState extends State<CardShape> {
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
            child: Icon(
              shapes[widget.shapeId],
            )),
      ),
    );
  }
}
