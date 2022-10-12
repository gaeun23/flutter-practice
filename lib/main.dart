import 'package:flutter/material.dart';

enum Role { leader, member }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  double squareside = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Using Key'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 이 외에도 다양한 애니메이션 구현은 https://docs.flutter.dev/development/ui/widgets/animation 참고

            GestureDetector(
              child: AnimatedContainer(
                width: squareside,
                height: squareside,
                color: Colors.green,
                duration: const Duration(seconds: 1),
              ),
              onTap: () {
                setState(() {
                  if (text.isEmpty) {
                    text = 'Hello World';
                  } else {
                    text = '';
                  }
                });
              },
              onLongPress: () {
                setState(() {
                  if (squareside > 75) {
                    squareside = 50;
                    text = 'This is small box';
                  } else {
                    squareside = 100;
                    text = 'This is large box';
                  }
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
