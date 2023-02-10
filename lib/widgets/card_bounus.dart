import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_unit.dart';

class CardBonus extends CardUnit {
  const CardBonus({super.key, required super.idCode, required super.typeCode});

  @override
  State<CardUnit> createState() => _CardBonusState();
}

class _CardBonusState extends CardUnitState<CardBonus> {
  @override
  Container cardDesign() {
    return Container(
      child: const Text(
        "bonus",
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
