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
    // TabBarView 를 사용하기 위해 DefaultTabController 로 감싸주고, length 로 tab 개수 지정
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bondiBlue,
          title: const Text('Flutter Demo'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.tag_faces)),
              Tab(text: 'Menu2'),
              Tab(
                icon: Icon(Icons.info),
                text: 'Menu3',
              ),
            ],
          ),
        ),
        body: TabBarView(
          // PageView Widget 은 ViewPager 와 동일
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
        drawer: const Drawer(),
      ),
    );
  }
}
