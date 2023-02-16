import '../widgets/cards/card_bounus.dart';
import '../widgets/cards/card_number.dart';
import '../widgets/cards/card_shape.dart';
import '../widgets/cards/card_unit.dart';

List<CardUnit> fullDeckMixed() {
  List<CardUnit> result = fullDeck();
  result.shuffle();
  return result;
}

List<CardUnit> fullDeck() {
  List<CardUnit> deck = [];
  int id = 0;
  for (var i = 0; i < 3; i++) {
    for (var j = 1; j < 10; j++) {
      deck.add(CardNumber(
        number: j,
        colorIndex: i,
        idCode: id,
      ));
      id++;
    }
  }
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 4; j++) {
      deck.add(CardShape(shapeId: i, idCode: id));
      id++;
    }
  }
  deck.add(CardBonus(idCode: id));
  return deck;
}
