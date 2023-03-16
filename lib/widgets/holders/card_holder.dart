import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_function.dart';

import '../cards/card_column.dart';

class CardHolder extends StatelessWidget {
  int attatchedCards = 0;
  List<int> active;
  int holderType = 1;
  int holderRow;
  final Function(int, int, List<int>) onChanged;

  CardHolder(
      {super.key,
      required this.active,
      required this.onChanged,
      required this.holderRow});

  void handleTap(List<int> newdata) {
    onChanged(holderType, holderRow, newdata);
  }

  void gatherShape(int shapeId) {
    if (getIdType(active.last) == 2) {
      if (getIdDetail(active.last)["shapeIndex"] == shapeId) {
        removeCard(1);
      }
    }
  }

  void addCard(List<int> value) {
    for (var i in value) {
      active.add(i);
      attatchedCards += 1;
    }
  }

  void setCard(List<int> value) {
    for (var i in value) {
      active.add(i);
    }
  }

  void removeCard(int n) {
    active.removeRange(active.length - n, active.length);
    attatchedCards -= n;
    if (attatchedCards == 0 && active.isNotEmpty) {
      attatchedCards = 1;
    }
    setupAttatched();
  }

  void setupAttatched() {
    int lastnum = 0;
    for (var i in active) {
      if (getIdType(i) != 1) {
        attatchedCards = 1;
      } else {
        if (getIdType(lastnum) != 1) {
          attatchedCards = 1;
        } else {
          if (getIdDetail(lastnum)["number"] - 1 == getIdDetail(i)["number"] &&
              getIdDetail(lastnum)["colorIndex"] !=
                  getIdDetail(i)["colorIndex"]) {
            attatchedCards += 1;
          } else {
            attatchedCards = 1;
          }
        }
        lastnum = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return active.isEmpty
        ? generateCard(-1)
        : DragTarget<List<int>>(
            builder: ((BuildContext context, List<dynamic> candidateData,
                List<dynamic> rejectedData) {
              return holderStack();
            }),
            onWillAccept: (data) {
              var dataFirstId = data?.first;
              var holderLastId = active.last;
              if (getIdType(dataFirstId!) != 1 ||
                  getIdType(holderLastId) != 1) {
                // print("wrong type");
                return false;
              }
              if (getIdDetail(dataFirstId)["colorIndex"] ==
                  getIdDetail(holderLastId)["colorIndex"]) {
                // print("wrong color");
                return false;
              }
              if (getIdDetail(dataFirstId)["number"] + 1 !=
                  getIdDetail(holderLastId)["number"]) {
                // print("wrong number");
                return false;
              }
              return true;
            },
            onAccept: (List<int> data) {
              addCard(data);
              handleTap(active);
            },
          );
  }

  Stack holderStack() {
    return Stack(
      children: [
        const SizedBox(height: 1000),
        for (var i = 0; i < active.length; i++)
          Transform.translate(
              offset: Offset(0, i * 20),
              child: i >= active.length - attatchedCards
                  ? Draggable(
                      data: active.sublist(i),
                      feedback: generateCardColumn(active.sublist(i)),
                      childWhenDragging: Container(),
                      child: generateCard(active[i]),
                      onDragCompleted: () {
                        removeCard(active.length - i);
                        handleTap(active);
                      },
                    )
                  : generateCard(active[i]))
      ],
    );
  }
}
