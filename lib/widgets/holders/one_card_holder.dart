import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

import '../cards/card_shape.dart';
import '../cards/card_unit.dart';

class OneCardHolder extends CardHolder {
  final int idcode;

  OneCardHolder({
    super.key,
    required this.idcode,
  });

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
      }
    }
  }

  @override
  State<CardHolder> createState() => _OneCardHolderState();
}

class _OneCardHolderState extends CardHolderState<OneCardHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.cardList.isEmpty
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
                setState(() {
                  widget.addCard(data);
                });
              }),
            )
          : Draggable(
              data: widget.cardList.sublist(0),
              feedback: widget.cardList[0],
              childWhenDragging: const CardEmpty(),
              child: widget.cardList[0],
              onDragCompleted: () {
                setState(() {
                  widget.removeCard(1);
                });
              },
            ),
    );
  }
}
