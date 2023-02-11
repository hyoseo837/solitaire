import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_base.dart';

class CardUnit extends CardBase {
  final int idCode;
  final int typeCode;
  const CardUnit({
    super.key,
    required this.idCode,
    required this.typeCode,
  });

  @override
  State<CardUnit> createState() => CardUnitState();
}

class CardUnitState<T extends CardUnit> extends State<T> {
  Color borderColor = Colors.black;
  bool isDraggable = true;
  int row = 0;

  @override
  Widget build(BuildContext context) {
    return isDraggable
        ? Draggable<List<dynamic>>(
            data: [widget, context.widget],
            feedback: SizedBox(
              width: 55,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: cardDesign(),
              ),
            ),
            childWhenDragging: Container(),
            child: SizedBox(
              width: 55,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: cardDesign(),
              ),
            ),
          )
        : SizedBox(
            width: 55,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: cardDesign(),
            ),
          );
  }

  Container cardDesign() {
    return Container(
      child: Text(
        widget.idCode.toString(),
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
