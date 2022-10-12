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
  StudentResult studentResult = StudentResult(0, 0, 0, 0, false);
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
                    value: index,
                    child: const Text('Choose the additional point'),
                  );
                }
                return DropdownMenuItem(
                  value: index,
                  child: Text('${index - 1} point'),
                );
              }),
              onChanged: (value) {
                setState(() {
                  studentResult.additionalPoint = value! - 1;
                });
              },
              validator: (value) {
                if (value == 0) {
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
                value: studentResult.attendance,
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

class StudentResult {
  int midTermExam;
  int finalTermExam;
  int teamLeaderPoint;
  int additionalPoint;
  bool attendance;

  StudentResult(this.midTermExam, this.finalTermExam, this.teamLeaderPoint,
      this.additionalPoint, this.attendance);

  @override
  String toString() {
    return '('
        '$midTermExam, '
        '$finalTermExam, '
        '$teamLeaderPoint, '
        '$additionalPoint, '
        '$attendance)';
  }
}
