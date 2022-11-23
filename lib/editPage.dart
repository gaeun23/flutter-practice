import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Scores'),
      ),
      body: const EditPanel(),
    );
  }
}

class EditPanel extends StatelessWidget {
  const EditPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: const Text(
                'Mid-Term',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            const Text(
              '0',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                '+',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: const Text(
                'Final',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            const Text(
              '0',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                '+',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
