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
        // Bottom Navi 의 Selected Color 는 primarySwatch 값으로 지정
        primarySwatch: Colors.blue,
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
          // TabBarView 의 children 으로는 Tab widget 으로 감싸주는 것이 좋음
          children: [
            Tab(
              // Card 위젯 : 깔끔한 박스 위젯, 그림자, radius 지정 가능
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4.0,
                child: const SizedBox(
                  width: 100,
                  height: 100,
                ),
              ),
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
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
          ],
        ),
      ),
    );
  }
}
