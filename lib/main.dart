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
  final _midTermController = TextEditingController();
  final _finalController = TextEditingController();
  Role _role = Role.member;
  final _pointValueList = List.generate(10, (index) => '$index');
  var _selectedPointValue = '0';
  var _lessAbsence = false;
  var _totalGrade = 'A';

  @override
  void dispose() {
    _midTermController.dispose();
    _finalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mid-term exam',
              ),
              controller: _midTermController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Final exam',
              ),
              controller: _finalController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 30,
            ),
            RadioListTile(
                title: const Text('Project Team Leader (+10)'),
                value: Role.leader,
                groupValue: _role,
                onChanged: (value) {
                  setState(() {
                    _role = value!;
                  });
                }),
            RadioListTile(
                title: const Text('Project Team Member'),
                value: Role.member,
                groupValue: _role,
                onChanged: (value) {
                  setState(() {
                    _role = value!;
                  });
                }),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Additional Point',
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton(
                      value: _selectedPointValue,
                      items: _pointValueList.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text('$value point'));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPointValue = value!;
                        });
                      })
                ],
              ),
            ),
            CheckboxListTile(
              title: const Text('Absence less than 4'),
              value: _lessAbsence,
              onChanged: (value) {
                setState(() {
                  _lessAbsence = value!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              _totalGrade,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40, color: Colors.red),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  var midTermValue =
                      double.parse(_midTermController.text.trim());
                  var finalValue = double.parse(_finalController.text.trim());
                  var roleValue = _role == Role.leader ? 10 : 0;
                  var additionalPointValue = int.parse(_selectedPointValue);

                  var totalPoint = midTermValue +
                      finalValue +
                      roleValue +
                      additionalPointValue;
                  if (_lessAbsence) {
                    _totalGrade = 'F';
                  } else if (totalPoint >= 170) {
                    _totalGrade = 'A';
                  } else if (totalPoint >= 150 && totalPoint < 170) {
                    _totalGrade = 'B';
                  } else if (totalPoint >= 130 && totalPoint < 150) {
                    _totalGrade = 'C';
                  } else if (totalPoint >= 110 && totalPoint < 130) {
                    _totalGrade = 'D';
                  } else {
                    _totalGrade = 'F';
                  }
                });
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
