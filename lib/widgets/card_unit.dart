import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_base.dart';

class CardUnit extends CardBase {
  final int idCode;
  final int typeCode;
  const CardUnit({super.key, required this.idCode, required this.typeCode});

  @override
  State<CardUnit> createState() => _CardUnitState();
}

class _CardUnitState extends State<CardUnit> {
  Color borderColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          borderColor = Colors.blue;
        });
      },
      onTapUp: ((details) {
        setState(() {
          borderColor = Colors.black;
        });
      }),
      child: SizedBox(
        width: 55,
        height: 100,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Text(
            widget.idCode.toString(),
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
