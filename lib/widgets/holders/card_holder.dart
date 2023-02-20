import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_column.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/cards/card_number.dart';
import 'package:solitaire/widgets/cards/card_shape.dart';

import '../cards/card_unit.dart';

class CardHolder extends StatefulWidget {
  List<CardUnit> cardList = [];
  int attatchedCards = 0;
  CardHolder({super.key});

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
  State<CardHolder> createState() => CardHolderState();
}

class CardHolderState<T extends CardHolder> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return widget.cardList.isEmpty
        ? const CardEmpty()
        : DragTarget<List<CardUnit>>(
            builder: ((BuildContext context, List<dynamic> candidateData,
                List<dynamic> rejectedData) {
              return holderStack();
            }),
            onWillAccept: (data) {
              var dataFirstCard = data?.first;
              var holderLastCard = widget.cardList.last;
              if (dataFirstCard?.typeCode != 1 ||
                  holderLastCard.typeCode != 1) {
                // print("wrong type");
                return false;
              }
              CardNumber? dataFirstnumCard = data?.cast<CardNumber>().first;
              CardNumber holderLastnumCard =
                  widget.cardList.cast<CardNumber>().last;
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
              setState(() {
                widget.addCard(data);
              });
            },
          );
  }

  Stack holderStack() {
    return Stack(
      children: [
        const SizedBox(height: 1000),
        for (var i = 0; i < widget.cardList.length; i++)
          Transform.translate(
              offset: Offset(0, i * 20),
              child: i >= widget.cardList.length - widget.attatchedCards
                  ? Draggable(
                      data: widget.cardList.sublist(i),
                      feedback: CardColumn(cards: widget.cardList.sublist(i)),
                      childWhenDragging: Container(),
                      child: widget.cardList[i],
                      onDragCompleted: () {
                        setState(() {
                          widget.removeCard(widget.cardList.length - i);
                        });
                      },
                    )
                  : widget.cardList[i])
      ],
    );
  }
}
