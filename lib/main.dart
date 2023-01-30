import 'package:flutter/material.dart';
import 'package:solitaire/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Center(
            child: SizedBox(
              height: 400,
              width: 750,
              child: HomeScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
