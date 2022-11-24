import 'package:flutter/material.dart';
import 'package:flutter_practice_widgets/teamMembers.dart';
import 'package:flutter_practice_widgets/teamlistPage.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Team Member'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TeamListPage()));
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The number of our team member is:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.watch<TeamMembers>().memberList.length.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const AddModal(),
                      );
                    });
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddModal extends StatefulWidget {
  const AddModal({Key? key}) : super(key: key);

  @override
  State<AddModal> createState() => _AddModalState();
}

class _AddModalState extends State<AddModal> {
  String name = '';
  String studentNo = '';

  @override
  Widget build(BuildContext context) {
    int memberListSize = context.watch<TeamMembers>().memberList.length;

    if (memberListSize >= 3) {
      return Container(
        padding: const EdgeInsets.all(60),
        child: const Text(
          'The team is already full.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('Student No:'),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        studentNo = value;
                      },
                    ),
                  ),
                  const Text('Name:'),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    context.read<TeamMembers>().addMember(name, studentNo);
                    Navigator.pop(context);
                  });
                },
                child: const Text('Enter'),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    }
  }
}
