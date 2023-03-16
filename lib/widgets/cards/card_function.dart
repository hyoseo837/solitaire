import 'package:flutter/material.dart';

import '../../functions/constants.dart';

Widget generateCard(int idCode) {
  Widget result = Container();

  if (getIdType(idCode) == 1) {
    Color clr = colorSet[idCode ~/ 9];

    result = SizedBox(
      width: 55,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Container(
          child: Text(
            (idCode % 9 + 1).toString(),
            style: TextStyle(fontSize: 20, color: clr),
          ),
        ),
      ),
    );
  } else if (getIdType(idCode) == 2) {
    result = SizedBox(
      width: 55,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Container(
          child: Column(children: [
            Row(
              children: [
                getIdDetail(idCode)["icon"],
              ],
            )
          ]),
        ),
      ),
    );
  } else if (getIdType(idCode) == 3) {
    result = SizedBox(
      width: 55,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  } else if (getIdType(idCode) == -1) {
    result = Container(
      width: 55,
      height: 100,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
    );
  }
  return result;
}

int getIdType(int idcode) {
  if (idcode >= 0 && idcode <= 39) {
    if (idcode < 27) {
      return 1;
    } else if (idcode < 39) {
      return 2;
    } else {
      return 3;
    }
  } else {
    return -1;
  }
}

Map<String, dynamic> getIdDetail(int idcode) {
  Map<String, dynamic> result = {};
  result["type"] = getIdType(idcode);
  if (getIdType(idcode) == 1) {
    result["colorIndex"] = idcode ~/ 9;
    result["color"] = colorSet[idcode ~/ 9];
    result["number"] = (idcode % 9 + 1);
  } else if (getIdType(idcode) == 2) {
    result["shapeIndex"] = (idcode - 27) ~/ 4;
    result["icon"] = Icon(shapes[(idcode - 27) ~/ 4]);
  }
  return result;
}
