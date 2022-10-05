import 'package:flutter/material.dart';

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
        primarySwatch: Colors.purple,
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
  final _valueList = List.generate(10, (index) => 'Student $index');
  var _selectedValue = 'Student 0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: DropdownButton(
        value: _selectedValue,
        items: _valueList.map(
          (value) {
            return DropdownMenuItem(value: value, child: Text(value));
          },
        ).toList(),
        onChanged: (value) {
          setState(() {
            _selectedValue = value!;
          });
        },
      ),
      drawer: const Drawer(),
    );
  }
}
