import 'package:flutter/material.dart';

import '../../../functions/constants.dart';

Widget generateCard(int idCode) {
  Widget result = Container();

  if (idCode < 27) {
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
            (idCode % 10 + 1).toString(),
            style: TextStyle(fontSize: 20, color: clr),
          ),
        ),
      ),
    );
  } else if (idCode < 39) {
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
                Icon(shapes[(idCode - 27) ~/ 4]),
              ],
            )
          ]),
        ),
      ),
    );
  } else if (idCode == 42) {
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
  }
  return result;
}
