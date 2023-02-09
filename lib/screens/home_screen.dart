import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_base.dart';
import 'package:solitaire/widgets/card_empty.dart';

import '../functions/reset_game.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<CardBase>> decks = [[], [], [], [], [], [], [], []];
  List<CardBase> holders = [
    const CardEmpty(),
    const CardEmpty(),
    const CardEmpty(),
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
                    for (var holder in holders) holder,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(
                              Icons.diamond,
                              size: 17,
                            )),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(
                              Icons.agriculture,
                              size: 17,
                            )),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(
                              Icons.account_balance,
                              size: 17,
                            ))
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
                children: [
                  for (var deck in decks)
                    Stack(
                      children: [
                        for (var i = 0; i < deck.length; i++)
                          Transform.translate(
                              offset: Offset(0, i * 20), child: deck[i])
                      ],
                    )
                ],
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
                        decks = resetGame();
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
