import 'package:flutter/material.dart';
import 'package:solitaire/functions/full_deck.dart';
import 'package:solitaire/widgets/cards/card_base.dart';
import 'package:solitaire/widgets/cards/card_shape.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';
import 'package:solitaire/widgets/holders/one_card_holder.dart';

import '../functions/constants.dart';
import '../widgets/cards/card_empty.dart';
import '../widgets/holders/bounus_holder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<int>> holderList = [
    [-1],
    [-1],
    [-1],
    [-1],
    [-1],
    [-1],
    [-1],
    [-1]
  ];
  List<List<int>> oneHolderList = [
    [-1],
    [-1],
    [-1]
  ];
  List<int> bonusHolderList = [-1];

  void _handleChanged(int type, int row, List<int> newdata) {
    if (type == 0) {
      setState(() {
        holderList[row] = newdata;
        print("number holder, $row");
      });
    } else if (type == 1) {
      setState(() {
        oneHolderList[row] = newdata;
        print("one holder, $row");
      });
    } else if (type == 2) {
      setState(() {
        bonusHolderList = newdata;
        print("bonus holder, $row");
      });
    }
  }

  late List<CardHolder> decks = [
    for (var i = 0; i < 8; i++)
      CardHolder(
        active: holderList[i],
        onChanged: _handleChanged,
        holderRow: i,
      )
  ];
  late List<OneCardHolder> holders = [
    for (var i = 0; i < 3; i++)
      OneCardHolder(
          holderRow: i, active: oneHolderList[i], onChanged: _handleChanged),
  ];
  late BonusHolder bonusHolder =
      BonusHolder(active: bonusHolderList, onChanged: _handleChanged);
  late List<CardBase> targetholders = [
    const CardEmpty(),
    const CardEmpty(),
    const CardEmpty(),
  ];

  void update() {
    List<int> shapesShowing = [0, 0, 0];
    for (var i in decks) {
      if (i.lastCard().typeCode == 2) {
        CardShape tmp = i.lastCard() as CardShape;
        shapesShowing[tmp.shapeId] += 1;
      }
    }
    for (var i in holders) {
      if (i.isEmpty()) {
        continue;
      } else {
        if (i.lastCard().typeCode == 2) {
          CardShape tmp = i.lastCard() as CardShape;
          shapesShowing[tmp.shapeId] += 1;
        }
      }
    }
    for (var i = 0; i < 3; i++) {
      if (shapesShowing[i] == 4) {
        for (var j in decks) {
          setState(() {
            j.gatherShape(i);
          });
        }
        for (var j in holders) {
          setState(() {
            j.gatherShape(i);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        update();
      },
      child: Container(
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
                      for (var i in holders) i,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var shape in shapes)
                            IconButton(
                                onPressed: (() {}),
                                icon: Icon(shape, size: 17)),
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
                          resetGame();
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
      ),
    );
  }

  void resetGame() {
    holderList = [[], [], [], [], [], [], [], []];
    decks = [
      for (var i = 0; i < 8; i++)
        CardHolder(
          active: holderList[i],
          onChanged: _handleChanged,
          holderRow: i,
        )
    ];
    holders = [
      for (var i = 0; i < 3; i++)
        OneCardHolder(
            holderRow: i, active: oneHolderList[i], onChanged: _handleChanged),
    ];
    bonusHolder =
        BonusHolder(active: bonusHolderList, onChanged: _handleChanged);
    targetholders = [
      const CardEmpty(),
      const CardEmpty(),
      const CardEmpty(),
    ];

    var newdeck = fullDeck();
    var cnt = 0;
    for (var card in newdeck) {
      decks[cnt].setCard([card]);
      holderList[cnt].add(card.idCode);
      cnt += 1;
      if (cnt == 8) {
        cnt -= 8;
      }
    }
    for (var i in decks) {
      i.setupAttatched();
    }
  }
}
