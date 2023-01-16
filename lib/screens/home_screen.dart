import 'package:flutter/material.dart';
import 'package:solitaire/widgets/card_holder.dart';
import 'package:solitaire/widgets/deck_holder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(color: Colors.red),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CardHolder(),
                  const CardHolder(),
                  const CardHolder(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: (() {}),
                          icon: const Icon(Icons.diamond_outlined)),
                      IconButton(
                          onPressed: (() {}),
                          icon: const Icon(Icons.agriculture_outlined)),
                      IconButton(
                          onPressed: (() {}),
                          icon: const Icon(Icons.account_balance_outlined))
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
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(color: Colors.green),
            child: Row(
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
      ],
    );
  }
}
