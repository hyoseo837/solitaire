List<int> fullDeckMixed() {
  List<int> result = fullDeck();
  result.shuffle();
  return result;
}

List<int> fullDeck() {
  List<int> deck = [];
  for (var i = 0; i < 40; i++) {
    deck.add(i);
  }
  return deck;
}
