import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

import '../cards/card_shape.dart';
import '../cards/card_unit.dart';

class OneCardHolder extends CardHolder {
  int newholderType = 2;
  OneCardHolder(
      {super.key,
      required super.active,
      required super.onChanged,
      required super.holderRow});

  @override
  void handleTap(List<int> newdata) {
    onChanged(newholderType, holderRow, newdata);
  }

  bool isEmpty() {
    return super.cardList.isEmpty;
  }

  @override
  CardUnit lastCard() {
    return super.cardList.last;
  }

  @override
  void gatherShape(int shapeId) {
    if (super.cardList.last.typeCode == 2) {
      CardShape tmp = cardList.last as CardShape;
      if (tmp.shapeId == shapeId) {
        removeCard(1);
        handleTap(cardsInInt());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardList.isEmpty
          ? DragTarget<List<CardUnit>>(
              builder: ((BuildContext context, List<dynamic> candidateData,
                  List<dynamic> rejectedData) {
                return const CardEmpty();
              }),
              onWillAccept: (data) {
                if (data?.length == 1) {
                  return true;
                } else {
                  return false;
                }
              },
              onAccept: ((data) {
                addCard(data);
                handleTap(cardsInInt());
              }),
            )
          : Draggable(
              data: cardList.sublist(0),
              feedback: cardList[0],
              childWhenDragging: const CardEmpty(),
              child: cardList[0],
              onDragCompleted: () {
                removeCard(1);
                handleTap(cardsInInt());
              },
            ),
    );
  }
}
