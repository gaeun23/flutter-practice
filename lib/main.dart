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
      // 슬래쉬는 가장 기본이 되는 home view 를 의미
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/result': (context) => const ResultPage(),
        '/grade': (context) => const GradePage(),
      },
      // home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Using Key'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  StudentResult studentResult = StudentResult(0, 0, 0, -1, true);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mid-Term Exam',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert some Texts';
                } else if (int.tryParse(value) == null) {
                  return 'Insert some Integer';
                }
                return null;
              },
              onSaved: (value) {
                studentResult.midTermExam = int.parse(value!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Final Exam',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert some Texts';
                } else if (int.tryParse(value) == null) {
                  return 'Insert some Integer';
                }
                return null;
              },
              onSaved: (value) {
                studentResult.finalTermExam = int.parse(value!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Additional Point',
              ),
              value: studentResult.additionalPoint,
              items: List.generate(11, (index) {
                if (index == 0) {
                  return DropdownMenuItem(
                    value: index - 1,
                    child: const Text('Choose the additional point'),
                  );
                }
                return DropdownMenuItem(
                  value: index - 1,
                  child: Text('${index - 1} point'),
                );
              }),
              onChanged: (value) {
                setState(() {
                  studentResult.additionalPoint = value!;
                });
              },
              validator: (value) {
                if (value == -1) {
                  return 'Please select the point';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RadioListTile(
                title: const Text('Team leader (+10)'),
                value: 10,
                groupValue: studentResult.teamLeaderPoint,
                onChanged: (value) {
                  setState(() {
                    studentResult.teamLeaderPoint = 10;
                  });
                }),
            RadioListTile(
                title: const Text('Team Member'),
                value: 0,
                groupValue: studentResult.teamLeaderPoint,
                onChanged: (value) {
                  setState(() {
                    studentResult.teamLeaderPoint = 0;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            CheckboxListTile(
                title: const Text('Absence less than 4'),
                value: !studentResult.attendance,
                onChanged: (value) {
                  setState(() {
                    studentResult.attendance = value!;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Processing data'),
                    ));
                    _formKey.currentState!.save();
                    studentResult.computeSum();
                    // Routing 을 하는 위젯
                    // Stack 자료구조 처럼 위에 덧붙여지게 됨
                    // 위로 생성된 페이지의 appBar 에는 자동으로 뒤로가기 버튼 생성(pop 기능)
                    Navigator.pushNamed(context, '/result');
                    print(studentResult);
                  }
                });
              },
              child: const Text('Enter'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Processing data'),
                    ));
                    _formKey.currentState!.save();
                    studentResult.computeSum();
                    Navigator.pushNamed(context, '/grade');
                    print(studentResult);
                  }
                });
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Total Sum',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '0',
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // pop 하는 코드
                  Navigator.pop(context);
                },
                child: const Text('Insert Again'))
          ],
        ),
      ),
    );
  }
}

class GradePage extends StatelessWidget {
  const GradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Grade',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '0',
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // pop 하는 코드
                  Navigator.pop(context);
                },
                child: const Text('Insert Again'))
          ],
        ),
      ),
    );
  }
}

class StudentResult {
  int midTermExam;
  int finalTermExam;
  int teamLeaderPoint;
  int additionalPoint;
  bool attendance;
  int? totalPoint;

  StudentResult(this.midTermExam, this.finalTermExam, this.teamLeaderPoint,
      this.additionalPoint, this.attendance);

  computeSum() {
    if (additionalPoint != -1) {
      totalPoint =
          midTermExam + finalTermExam + teamLeaderPoint + additionalPoint;
      if (!attendance) {
        totalPoint = 0;
      }
    }
  }

  @override
  String toString() {
    return '('
        '$totalPoint '
        '$midTermExam, '
        '$finalTermExam, '
        '$teamLeaderPoint, '
        '$additionalPoint, '
        '$attendance)';
  }
}
