import 'package:solitaire/widgets/card_base.dart';
import 'full_deck.dart';

List<List<CardBase>> resetGame() {
  var stack = fullDeckMixed();
  var cnt = 0;
  List<List<CardBase>> decks = [[], [], [], [], [], [], [], []];
  for (var i in stack) {
    decks[cnt].add(i);
    cnt++;
    if (cnt == 8) cnt -= 8;
  }
  return decks;
}
