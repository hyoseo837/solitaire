import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_base.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/cards/card_number.dart';

import '../cards/card_unit.dart';

class CardHolder extends StatefulWidget {
  List<CardBase> cardList = [const CardEmpty()];
  List<bool> areDraggable = [false];
  CardHolder({super.key});

  void addCard(CardUnit value) {
    if (cardList.last.runtimeType == const CardEmpty().runtimeType) {
      cardList[cardList.length - 1] = value;
      areDraggable[cardList.length - 1] = true;
    } else {
      cardList.add(value);
      areDraggable[areDraggable.length - 1] = false;
      areDraggable.add(true);
    }
  }

  List<CardBase> removeCard(int n) {
    List<CardBase> result = cardList.sublist(cardList.length - n);
    if (cardList.length == 1) {
      cardList = [const CardEmpty()];
      areDraggable = [false];
      return result;
    } else {
      cardList.removeRange(cardList.length - n, cardList.length);
      areDraggable.removeRange(cardList.length - n, cardList.length);
      return result;
    }
  }

  void update() {}

  @override
  State<CardHolder> createState() => CardHolderState();
}

class CardHolderState<T extends CardHolder> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return widget.cardList[widget.cardList.length - 1].typeCode == 1
        ? DragTarget<CardUnit>(
            builder: ((BuildContext context, List<dynamic> candidateData,
                List<dynamic> rejectedData) {
              return holderStack();
            }),
            onWillAccept: (data) {
              if (data?.typeCode == 1) {
                final CardNumber holderLastCard =
                    widget.cardList.cast<CardNumber>().last;
                final CardNumber dataFirstCard = data as CardNumber;
                if (holderLastCard.colorIndex == dataFirstCard.colorIndex) {
                  // print("wrong color");
                  return false;
                }
                if (holderLastCard.number - 1 == dataFirstCard.number) {
                  return true;
                } else {
                  // print("wrong number");
                  return false;
                }
              } else {
                // print("wrong type");
                return false;
              }
            },
            onAccept: (CardUnit data) {
              setState(() {
                widget.addCard(data);
              });
            },
          )
        : holderStack();
  }

  Stack holderStack() {
    return Stack(
      children: [
        const SizedBox(height: 1000),
        for (var i = 0; i < widget.cardList.length; i++)
          Transform.translate(
            offset: Offset(0, i * 20),
            child: widget.areDraggable[i]
                ? Draggable(
                    data: widget.cardList[i],
                    feedback: widget.cardList[i],
                    childWhenDragging: Container(),
                    child: widget.cardList[i],
                    onDragCompleted: () {
                      setState(() {
                        widget.removeCard(1);
                      });
                    },
                  )
                : widget.cardList[i],
          )
      ],
    );
  }
}
