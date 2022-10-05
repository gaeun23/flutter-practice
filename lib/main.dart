import 'package:flutter/material.dart';

enum Language { cpp, python, dart }

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
  Language _language = Language.cpp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          RadioListTile(
            title: const Text('C++'),
            value: Language.cpp,
            groupValue: _language,
            onChanged: (value) {
              setState(() {
                _language = value!;
                print('$_language');
              });
            },
          ),
          RadioListTile(
            title: const Text('Python'),
            value: Language.python,
            groupValue: _language,
            onChanged: (value) {
              setState(() {
                _language = value!;
                print('$_language');
              });
            },
          ),
          RadioListTile(
            title: const Text('Dart'),
            value: Language.dart,
            groupValue: _language,
            onChanged: (value) {
              setState(() {
                _language = value!;
                print('$_language');
              });
            },
          ),
        ],
      ),
      drawer: const Drawer(),
    );
  }
}
