import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/cards/card_unit.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

class OneCardHolder extends CardHolder {
  final int idcode;

  OneCardHolder({
    super.key,
    required super.typecode,
    required this.idcode,
  });

  @override
  State<CardHolder> createState() => _OneCardHolderState();
}

class _OneCardHolderState extends CardHolderState<OneCardHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.cardList[0].runtimeType == const CardEmpty().runtimeType
          ? DragTarget(
              builder: ((BuildContext context, List<dynamic> candidateData,
                  List<dynamic> rejectedData) {
                return widget.cardList[0];
              }),
              onAccept: ((CardUnit data) {
                setState(() {
                  widget.addCard(data);
                });
              }),
            )
          : widget.areDraggable[0]
              ? Draggable(
                  data: widget.cardList[0],
                  feedback: widget.cardList[0],
                  childWhenDragging: const CardEmpty(),
                  child: widget.cardList[0],
                  onDragCompleted: () {
                    setState(() {
                      widget.removeCard(1);
                    });
                  },
                )
              : widget.cardList[0],
    );
  }
}
