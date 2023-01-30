import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card.dart';
import 'package:solitaire/widgets/card_holder.dart';
import 'package:solitaire/widgets/deck_holder.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  List<List<PlayingCard>> decks = [[], [], [], [], [], [], [], []];
  List<PlayingCard> holders = [];
  List<PlayingCard> targetholders = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    const CardHolder(),
                    const CardHolder(),
                    const CardHolder(),
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
                    const CardHolder(),
                    const CardHolder(),
                    const CardHolder(),
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
                  Column(
                    children: const [CardHolder()],
                  ),
                  Column(
                    children: const [CardHolder()],
                  ),
                  Column(
                    children: const [CardHolder()],
                  ),
                  Column(
                    children: const [CardHolder()],
                  ),
                  Column(
                    children: const [CardHolder()],
                  ),
                  Column(
                    children: const [CardHolder()],
                  ),
                  Column(
                    children: const [CardHolder()],
                  ),
                  Column(
                    children: const [CardHolder()],
                  ),
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
