import 'package:flutter/material.dart';
import 'package:solitaire/widgets/cards/card_function.dart';

Widget generateCardColumn(List<int> idCodes) {
  return Stack(
    children: [
      for (var i = 0; i < idCodes.length; i++)
        Transform.translate(
          offset: Offset(0, i * 20),
          child: generateCard(idCodes[i]),
        )
    ],
  );
}
