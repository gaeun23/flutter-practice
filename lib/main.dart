import 'package:flutter/material.dart';
import 'package:flutter_practice_layout/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Cabin',
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final items = List.generate(100, (index) => index).toList();
  final dogItems = List.generate(16, (index) => index).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.lightGreen,
          title: const Text('My Flutter App'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.tag_faces),
                text: 'Students',
              ),
              Tab(icon: Icon(Icons.photo), text: 'Album'),
              Tab(
                icon: Icon(Icons.info),
                text: 'Info',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: SingleChildScrollView(
                child: ListBody(
                  children: items
                      .map((i) => ListTile(
                            leading: const Icon(Icons.home),
                            title: Text('Students ${i + 1}'),
                            trailing: const Icon(Icons.navigate_next),
                            onTap: () {},
                          ))
                      .toList(),
                ),
              ),
            ),
            Tab(
              child: GridView.count(
                crossAxisCount: 3,
                children: dogItems
                    .map((i) => Image.asset('dog_${i + 1}.jpeg'))
                    .toList(),
              ),
            ),
            Tab(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset(
                        'warning.jpeg',
                        width: 300,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('This page dose not include contents.'),
                      const Text(
                          'Please insert contents by pressing the Button.'),
                      Container(
                        margin: const EdgeInsets.only(top: 24.0),
                        child: FloatingActionButton(
                          onPressed: () {},
                          tooltip: 'Add',
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
