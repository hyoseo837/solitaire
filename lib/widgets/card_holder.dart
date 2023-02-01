import 'package:flutter/material.dart';

class CardHolder extends StatelessWidget {
  const CardHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 45,
        height: 80,
      ),
    );
  }
}
