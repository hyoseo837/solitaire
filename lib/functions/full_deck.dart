import 'package:solitaire/widgets/card_bounus.dart';
import 'package:solitaire/widgets/card_shape.dart';

import '../widgets/card_number.dart';
import '../widgets/card_unit.dart';

List<CardUnit> fullDeckMixed() {
  List<CardUnit> result = fullDeck();
  result.shuffle();
  return result;
}

List<CardUnit> fullDeck() {
  List<CardUnit> deck = [];
  const shapeList = ["a", "b", "c"];
  int id = 0;
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 9; j++) {
      deck.add(CardNumber(j, shapeList[i], id, 0));
      id++;
    }
  }
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 4; j++) {
      deck.add(CardShape(i, id, 1));
      id++;
    }
  }
  deck.add(CardBonus(id, 2));
  return deck;
}
