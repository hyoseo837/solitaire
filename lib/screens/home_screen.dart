import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_unit.dart';
import 'package:solitaire/widgets/card_base.dart';
import 'package:solitaire/widgets/card_empty.dart';
import 'package:solitaire/widgets/deck_holder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<CardBase>> decks = [[], [], [], [], [], [], [], []];
  List<CardBase> holders = [
    const CardUnit(
      shape: "a",
      number: 1,
      idCode: 0,
    ),
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
          Flexible(
            flex: 13,
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
                    const DeckHolder(),
                    const SizedBox(width: 30),
                    for (var targetholder in targetholders) targetholder
                  ]),
            ),
          ),
          Flexible(
            flex: 27,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var deck in decks)
                    for (var card in deck) card
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(color: Color(0xff2f2f2f)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
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
