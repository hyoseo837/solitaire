import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_column.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/cards/card_number.dart';
import 'package:solitaire/widgets/cards/card_shape.dart';

import '../cards/card_unit.dart';

class CardHolder extends StatelessWidget {
  List<CardUnit> cardList = [];
  int attatchedCards = 0;
  List<int> active;
  final Function(int, int, List<int>) onChanged;

  CardHolder({super.key, required this.active, required this.onChanged});

  void handleTap(newdata) {
    onChanged(newdata);
  }

  CardUnit lastCard() {
    return cardList.last;
  }

  void gatherShape(int shapeId) {
    if (cardList.last.typeCode == 2) {
      CardShape tmp = cardList.last as CardShape;
      if (tmp.shapeId == shapeId) {
        removeCard(1);
      }
    }
  }

  void addCard(List<CardUnit> value) {
    for (var i in value) {
      cardList.add(i);
      attatchedCards += 1;
    }
  }

  void setCard(List<CardUnit> value) {
    for (var i in value) {
      cardList.add(i);
    }
  }

  void removeCard(int n) {
    cardList.removeRange(cardList.length - n, cardList.length);
    attatchedCards -= n;
    if (attatchedCards == 0 && cardList.isNotEmpty) {
      attatchedCards = 1;
    }
    setupAttatched();
  }

  void setupAttatched() {
    late CardNumber lastnum =
        const CardNumber(idCode: 0, number: 0, colorIndex: 0);
    for (var i in cardList) {
      if (i.typeCode != 1) {
        attatchedCards = 1;
      } else {
        CardNumber tmp = i as CardNumber;
        if (lastnum.typeCode != 1) {
          attatchedCards = 1;
        } else {
          if (lastnum.number - 1 == tmp.number &&
              lastnum.colorIndex != tmp.colorIndex) {
            attatchedCards += 1;
          } else {
            attatchedCards = 1;
          }
        }
        lastnum = tmp;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return cardList.isEmpty
        ? const CardEmpty()
        : DragTarget<List<CardUnit>>(
            builder: ((BuildContext context, List<dynamic> candidateData,
                List<dynamic> rejectedData) {
              return holderStack();
            }),
            onWillAccept: (data) {
              var dataFirstCard = data?.first;
              var holderLastCard = cardList.last;
              if (dataFirstCard?.typeCode != 1 ||
                  holderLastCard.typeCode != 1) {
                // print("wrong type");
                return false;
              }
              CardNumber? dataFirstnumCard = data?.cast<CardNumber>().first;
              CardNumber holderLastnumCard = cardList.cast<CardNumber>().last;
              if (dataFirstnumCard?.colorIndex ==
                  holderLastnumCard.colorIndex) {
                // print("wrong color");
                return false;
              }
              if (dataFirstnumCard!.number + 1 != holderLastnumCard.number) {
                // print("wrong number");
                return false;
              }
              return true;
            },
            onAccept: (List<CardUnit> data) {
              addCard(data);
              handleTap(cardList);
            },
          );
  }

  Stack holderStack() {
    return Stack(
      children: [
        const SizedBox(height: 1000),
        for (var i = 0; i < cardList.length; i++)
          Transform.translate(
              offset: Offset(0, i * 20),
              child: i >= cardList.length - attatchedCards
                  ? Draggable(
                      data: cardList.sublist(i),
                      feedback: CardColumn(cards: cardList.sublist(i)),
                      childWhenDragging: Container(),
                      child: cardList[i],
                      onDragCompleted: () {
                        removeCard(cardList.length - i);
                        handleTap(cardList);
                      },
                    )
                  : cardList[i])
      ],
    );
  }
}
