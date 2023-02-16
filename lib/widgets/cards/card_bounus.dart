import 'package:flutter/material.dart';

import 'card_unit.dart';

class CardBonus extends CardUnit {
  const CardBonus({
    super.key,
    required super.idCode,
    super.typeCode = 3,
  });

  @override
  State<CardUnit> createState() => _CardBonusState();
}

class _CardBonusState extends CardUnitState<CardBonus> {
  @override
  Container cardDesign() {
    return Container(
      child: const Text(
        "bonus",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
