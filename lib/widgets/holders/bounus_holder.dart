//TODO make bonus holder
import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_function.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

class BonusHolder extends CardHolder {
  int newholderType = 2;
  BonusHolder(
      {super.key,
      required super.active,
      required super.onChanged,
      super.holderRow = 0});
  @override
  void handleTap(List<int> newdata) {
    onChanged(newholderType, holderRow, newdata);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: active.isEmpty
            ? DragTarget<List<int>>(
                builder: ((BuildContext context, List<dynamic> candidateData,
                    List<dynamic> rejectedData) {
                  return holderStack();
                }),
                onWillAccept: (data) {
                  if (data?.length == 1) {
                    if (getIdType(data![0]) == 3) {
                      return true;
                    }
                  }
                  return false;
                },
                onAccept: (List<int> data) {
                  addCard(data);
                  handleTap(active);
                },
              )
            : generateCard(active[0]));
  }
}
