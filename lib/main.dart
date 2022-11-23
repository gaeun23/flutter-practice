import 'package:flutter/material.dart';
import 'package:flutter_practice_widgets/scorepage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ScorePage(),
    );
  }
}
