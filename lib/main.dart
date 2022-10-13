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
  StudentInfo studentInfo = StudentInfo('', 0, 0);
  final _formKey = GlobalKey<FormState>();
  late List<Widget> studentList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Grade Calculator'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          bottom: const TabBar(
            tabs: [Tab(text: 'Information'), Tab(text: 'List')],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter student name';
                          } else if (int.tryParse(value) != null) {
                            return 'Please enter some string, not a number.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            studentInfo.name = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Project point'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter project point.';
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter some integer.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          studentInfo.point = int.parse(value!);
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
                        items: List.generate(11, (index) {
                          if (index == 0) {
                            return DropdownMenuItem(
                                value: index,
                                child:
                                    const Text('Choose the additional point'));
                          }
                          return DropdownMenuItem(
                              value: index, child: Text('${index - 1} point'));
                        }),
                        value: 0,
                        onChanged: (value) {
                          studentInfo.additionalPoint = value! - 1;
                        },
                        validator: (value) {
                          if (value == 0) {
                            return 'Please select the point';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          color: Colors.indigo,
                          child: const Center(
                            child: Text(
                              'Enter',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Information update complete'),
                              ));
                              _formKey.currentState!.save();
                              studentList.add(ListTile(
                                title: Text(studentInfo.toString()),
                                leading: const Icon(Icons.home),
                              ));
                              print(studentInfo);
                              print(studentList);
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Tab(
              child: ReorderableListView.builder(
                itemBuilder: (context, i) {
                  return Dismissible(
                    key: ValueKey(studentList[i]),
                    background: Container(
                      color: Colors.purple,
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        studentList.removeAt(i);
                      });
                    },
                    child: studentList[i],
                  );
                },
                itemCount: studentList.length,
                onReorder: (int oldIndex, int newIndex) {
                  if (studentList.length > 2) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    studentList.insert(
                        newIndex, studentList.removeAt(oldIndex));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StudentInfo {
  String name;
  int point;
  int additionalPoint;

  StudentInfo(this.name, this.point, this.additionalPoint);

  @override
  String toString() {
    return '$name: ${point + additionalPoint}';
  }
}
