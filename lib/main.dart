import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Qatar World Cup 2022'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _goalOfKorea = 0;
  int _goalOfKorea1 = 0;
  int _goalOfKorea2 = 0;
  int _goalOfKorea3 = 0;
  int _goalOfGhana = 0;
  int _goalOfPortugal = 0;
  int _goalOfUruguay = 0;

  void _addGoalKorea1() {
    setState(() {
      _goalOfKorea1++;
      _goalOfKorea++;
    });
  }

  void _addGoalKorea2() {
    setState(() {
      _goalOfKorea2++;
      _goalOfKorea++;
    });
  }

  void _addGoalKorea3() {
    setState(() {
      _goalOfKorea3++;
      _goalOfKorea++;
    });
  }

  void _addGoalGhana() {
    setState(() {
      _goalOfGhana++;
    });
  }

  void _addGoalPortugal() {
    setState(() {
      _goalOfPortugal++;
    });
  }

  void _addGoalUruguay() {
    setState(() {
      _goalOfUruguay++;
    });
  }

  void _resetAllGoals() {
    setState(() {
      _goalOfKorea = 0;
      _goalOfKorea1 = 0;
      _goalOfKorea2 = 0;
      _goalOfKorea3 = 0;
      _goalOfUruguay = 0;
      _goalOfPortugal = 0;
      _goalOfGhana = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _addGoalKorea1, child: const Text('Goal')),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Image.asset(
                    'assets/korea.png',
                    width: 50.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  '$_goalOfKorea1',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Text(
                  ':',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '$_goalOfUruguay',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Image.asset(
                    'assets/uruguay.png',
                    width: 50.0,
                    fit: BoxFit.fill,
                  ),
                ),
                ElevatedButton(
                    onPressed: _addGoalUruguay, child: const Text('Goal')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _addGoalKorea2, child: const Text('Goal')),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Image.asset(
                    'assets/korea.png',
                    width: 50.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  '$_goalOfKorea2',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Text(
                  ':',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '$_goalOfGhana',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Image.asset(
                    'assets/ghana.png',
                    width: 50.0,
                    fit: BoxFit.fill,
                  ),
                ),
                ElevatedButton(
                    onPressed: _addGoalGhana, child: const Text('Goal')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _addGoalKorea3, child: const Text('Goal')),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Image.asset(
                    'assets/korea.png',
                    width: 50.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  '$_goalOfKorea3',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Text(
                  ':',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '$_goalOfPortugal',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Image.asset(
                    'assets/portugal.png',
                    width: 50.0,
                    fit: BoxFit.fill,
                  ),
                ),
                ElevatedButton(
                    onPressed: _addGoalPortugal, child: const Text('Goal')),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              child: const Text(
                'Total Korean Goals:',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text(
              '$_goalOfKorea',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetAllGoals,
        tooltip: 'Reset',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
