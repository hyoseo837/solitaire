import 'package:flutter/material.dart';

import 'card_number.dart';

class CardColumn extends StatelessWidget {
  final List<CardNumber> cards;
  const CardColumn({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < cards.length; i++)
          Transform.translate(
            offset: Offset(0, i * 20),
            child: cards[i],
          )
      ],
    );
  }
}
