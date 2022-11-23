import 'package:flutter/material.dart';
import 'package:flutter_practice_widgets/scorepage.dart';
import 'package:provider/provider.dart';
import 'scores.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Score 라는 전역State 를 사용할 수 있도록 선언
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Scores(),
        )
      ],
      // builder 말고 child 라고 사용해도 되지만, 더 안전하게 사용하기 위해 builder 로 지정
      builder: (context, child) => MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ScorePage(),
      ),
    );
  }
}
