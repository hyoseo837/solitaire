import 'package:flutter/material.dart';
import 'package:solitaire/functions/full_deck.dart';
import 'package:solitaire/widgets/cards/card_base.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';
import 'package:solitaire/widgets/holders/one_card_holder.dart';

import '../functions/constants.dart';
import '../widgets/cards/card_empty.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardHolder> decks = [
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
  ];
  List<OneCardHolder> holders = [
    OneCardHolder(typecode: 0, idcode: 0),
    OneCardHolder(typecode: 0, idcode: 1),
    OneCardHolder(typecode: 0, idcode: 2),
  ];
  List<CardBase> targetholders = [
    const CardEmpty(),
    const CardEmpty(),
    const CardEmpty(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var holderIndex = 0; holderIndex < 3; holderIndex++)
                      DragTarget(builder: ((BuildContext context,
                          List<dynamic> candidateData,
                          List<dynamic> rejectedData) {
                        return holders[holderIndex];
                      }), onAccept: ((List<dynamic> data) {
                        setState(() {
                          holders[holderIndex] = data[0];
                        });
                      })),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var shape in shapes)
                          IconButton(
                              onPressed: (() {}), icon: Icon(shape, size: 17)),
                      ],
                    ),
                    const SizedBox(width: 30),
                    const CardEmpty(),
                    const SizedBox(width: 30),
                    for (var targetholder in targetholders) targetholder
                  ]),
            ),
          ),
          SizedBox(
            height: 253,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [for (var deck in decks) deck],
              ),
            ),
          ),
          SizedBox(
            child: Container(
              height: 27,
              decoration: const BoxDecoration(color: Color(0xff2f2f2f)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        decks = resetGame2();
                        holders = [
                          OneCardHolder(typecode: 0, idcode: 0),
                          OneCardHolder(typecode: 0, idcode: 0),
                          OneCardHolder(typecode: 0, idcode: 0),
                        ];
                        targetholders = [
                          const CardEmpty(),
                          const CardEmpty(),
                          const CardEmpty(),
                        ];
                      });
                    },
                    icon: const Icon(
                      Icons.refresh_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<CardHolder> resetGame2() {
  List<CardHolder> result = [
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
    CardHolder(typecode: 1),
  ];

  var newdeck = fullDeckMixed();
  var cnt = 0;
  for (var card in newdeck) {
    result[cnt].addCard(card);
    cnt += 1;
    if (cnt == 8) {
      cnt -= 8;
    }
  }
  return result;
}
