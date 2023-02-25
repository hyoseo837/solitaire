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
  List<bool> holderActiveList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> oneActiveList = [
    false,
    false,
    false,
  ];
  bool bonusActive = false;

  void _handleChanged(bool yes) {
    for (var i in holderActiveList) {
      setState(() {
        i != i;
      });
    }
    for (var i in oneActiveList) {
      setState(() {
        i != i;
      });
    }
    setState(() {
      bonusActive != bonusActive;
    });
  }

  void _handleHolderChanged0(bool newValue) {
    setState(() {
      holderActiveList[0] = newValue;
    });
  }

  void _handleHolderChanged1(bool newValue) {
    setState(() {
      holderActiveList[1] = newValue;
    });
  }

  void _handleHolderChanged2(bool newValue) {
    setState(() {
      holderActiveList[2] = newValue;
    });
  }

  void _handleHolderChanged3(bool newValue) {
    setState(() {
      holderActiveList[3] = newValue;
    });
  }

  void _handleHolderChanged4(bool newValue) {
    setState(() {
      holderActiveList[4] = newValue;
    });
  }

  void _handleHolderChanged5(bool newValue) {
    setState(() {
      holderActiveList[5] = newValue;
    });
  }

  void _handleHolderChanged6(bool newValue) {
    setState(() {
      holderActiveList[6] = newValue;
    });
  }

  void _handleHolderChanged7(bool newValue) {
    setState(() {
      holderActiveList[7] = newValue;
    });
  }

  void _handleOneHolderChanged0(bool newValue) {
    setState(() {
      oneActiveList[0] = newValue;
    });
  }

  void _handleOneHolderChanged1(bool newValue) {
    setState(() {
      oneActiveList[1] = newValue;
    });
  }

  void _handleOneHolderChanged2(bool newValue) {
    setState(() {
      oneActiveList[2] = newValue;
    });
  }

  void _handleBonusHolderChanged(bool newValue) {
    setState(() {
      bonusActive = newValue;
    });
  }

  late List<CardHolder> decks = [
    CardHolder(
      active: holderActiveList[0],
      onChanged: _handleChanged,
    ),
    CardHolder(
      active: holderActiveList[1],
      onChanged: _handleChanged,
    ),
    CardHolder(
      active: holderActiveList[2],
      onChanged: _handleChanged,
    ),
    CardHolder(
      active: holderActiveList[3],
      onChanged: _handleChanged,
    ),
    CardHolder(
      active: holderActiveList[4],
      onChanged: _handleChanged,
    ),
    CardHolder(
      active: holderActiveList[5],
      onChanged: _handleChanged,
    ),
    CardHolder(
      active: holderActiveList[6],
      onChanged: _handleChanged,
    ),
    CardHolder(
      active: holderActiveList[7],
      onChanged: _handleChanged,
    ),
  ];
  late List<OneCardHolder> holders = [
    OneCardHolder(
      idcode: 0,
      active: oneActiveList[0],
      onChanged: _handleChanged,
    ),
    OneCardHolder(
      idcode: 1,
      active: oneActiveList[1],
      onChanged: _handleChanged,
    ),
    OneCardHolder(
      idcode: 2,
      active: oneActiveList[2],
      onChanged: _handleChanged,
    ),
  ];
  late BonusHolder bonusHolder = BonusHolder(
    active: bonusActive,
    onChanged: _handleChanged,
  );
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
    decks = [
      CardHolder(
        active: holderActiveList[0],
        onChanged: _handleHolderChanged0,
      ),
      CardHolder(
        active: holderActiveList[1],
        onChanged: _handleHolderChanged1,
      ),
      CardHolder(
        active: holderActiveList[2],
        onChanged: _handleHolderChanged2,
      ),
      CardHolder(
        active: holderActiveList[3],
        onChanged: _handleHolderChanged3,
      ),
      CardHolder(
        active: holderActiveList[4],
        onChanged: _handleHolderChanged4,
      ),
      CardHolder(
        active: holderActiveList[5],
        onChanged: _handleHolderChanged5,
      ),
      CardHolder(
        active: holderActiveList[6],
        onChanged: _handleHolderChanged6,
      ),
      CardHolder(
        active: holderActiveList[7],
        onChanged: _handleHolderChanged7,
      ),
    ];
    holders = [
      OneCardHolder(
        idcode: 0,
        active: oneActiveList[0],
        onChanged: _handleOneHolderChanged0,
      ),
      OneCardHolder(
        idcode: 1,
        active: oneActiveList[1],
        onChanged: _handleOneHolderChanged1,
      ),
      OneCardHolder(
        idcode: 2,
        active: oneActiveList[2],
        onChanged: _handleOneHolderChanged2,
      ),
    ];
    targetholders = [
      const CardEmpty(),
      const CardEmpty(),
      const CardEmpty(),
    ];

    var newdeck = fullDeckMixed();
    var cnt = 0;
    for (var card in newdeck) {
      decks[cnt].setCard([card]);
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
