import 'package:flutter/material.dart';
import 'package:flutter_practice_widgets/addPage.dart';
import 'package:flutter_practice_widgets/teamMembers.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TeamMembers(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: AddPage(),
      ),
    );
  }
}
