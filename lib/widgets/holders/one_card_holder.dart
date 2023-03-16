import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_function.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

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
    return super.active.isEmpty;
  }

  @override
  void gatherShape(int shapeId) {
    if (getIdType(super.active.last) == 2) {
      if (getIdDetail(active.last)["shapeIndex"] == shapeId) {
        removeCard(1);
        handleTap(active);
      }
    }
  }

  @override
  void addCard(List<int> value) {
    active[0] = value[0];
    print(active);
    handleTap(active);
  }

  @override
  void removeCard(int n) {
    active[0] = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: active[0] == -1
          ? DragTarget<List<int>>(
              builder: ((BuildContext context, List<dynamic> candidateData,
                  List<dynamic> rejectedData) {
                return generateCard(-1);
              }),
              onWillAccept: (data) {
                if (data?.length == 1) {
                  return true;
                }
                return false;
              },
              onAccept: ((data) {
                addCard(data);
                // handleTap(active);
              }),
            )
          : Draggable(
              data: active,
              feedback: generateCard(active[0]),
              childWhenDragging: generateCard(-1),
              child: generateCard(active[0]),
              onDragCompleted: () {
                removeCard(1);
                handleTap(active);
              },
            ),
    );
  }
}
