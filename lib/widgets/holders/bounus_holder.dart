//TODO make bonus holder
import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

import '../cards/card_unit.dart';

class BonusHolder extends CardHolder {
  BonusHolder(
      {super.key,
      required super.active,
      required super.onChanged,
      super.holderRow = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: cardList.isEmpty
            ? DragTarget<List<CardUnit>>(
                builder: ((BuildContext context, List<dynamic> candidateData,
                    List<dynamic> rejectedData) {
                  return holderStack();
                }),
                onWillAccept: (data) {
                  if (data?.length == 1) {
                    if (data?[0].typeCode == 3) {
                      return true;
                    }
                  }
                  return false;
                },
                onAccept: (List<CardUnit> data) {
                  addCard(data);
                  handleTap(cardsInInt());
                },
              )
            : cardList[0]);
  }
}
