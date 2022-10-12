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
  List list = List.generate(20, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Using Key'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),

        // ListView 의 필수 속성 : itemBuilder 와 itemCount
        // ReorderableListView 의 필수 속성 : onReorder
        // ReorderableListView 의 모든 item은 반드시 key를 가져야 함.

        // Dismissible widget은 반드시 key를 가져야 함
        body: ReorderableListView.builder(
          itemBuilder: (context, i) {
            return Dismissible(
              key: ValueKey(list[i]),
              background: Container(
                color: Colors.orange,
              ),
              child: ListTile(
                title: Text('Students ${list[i]}'),
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.navigate_next),
              ),
              onDismissed: (direction) {
                setState(() {
                  list.removeAt(i);
                });
              },
            );
          },
          itemCount: list.length,
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              list.insert(newIndex, list.removeAt(oldIndex));
            });
          },
        ));
  }
}
