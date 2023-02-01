import 'package:flutter/material.dart';

class DeckHolder extends StatelessWidget {
  const DeckHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 45,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.grey,
        ),
      ),
    );
  }
}
