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
  var _isChecked1 = false;
  var _isChecked2 = false;
  var _isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Title'),
            value: _isChecked1,
            onChanged: (value) {
              setState(() {
                _isChecked1 = value;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Title2'),
            value: _isChecked2,
            onChanged: (value) {
              setState(() {
                _isChecked2 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Title2'),
            value: _isChecked3,
            onChanged: (value) {
              setState(() {
                _isChecked3 = value!;
              });
            },
          ),
        ],
      ),
      drawer: const Drawer(),
    );
  }
}
