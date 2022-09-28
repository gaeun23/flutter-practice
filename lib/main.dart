import 'package:flutter/material.dart';
import 'package:flutter_practice_layout/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The MaterialApp widget sets the default settings for the app.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Cabin',
        primarySwatch: Colors.brown,
      ),
      // Home 속성은 pages 를 할당
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final items = List.generate(100, (index) => index).toList();

  @override
  Widget build(BuildContext context) {
    // Scaffold 의 default 속성은 appBar(title part) 와 body(main part) 속성이 있음.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bondiBlue,
        title: const Text('Flutter Demo'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        // Column 보다 ListBody 위젯으로 children 을 감싸주면 텍스트 영역 말고 부모 전체 영역으로 스크롤 가능
        child: ListBody(
          children: items.map((i) => Text('$i')).toList(),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
