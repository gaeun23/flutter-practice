import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scores.dart';

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
                onPressed: () {
                  // 함수를 가져와 쓰기 때문에 watch 보다는 read 사용. callback function 을 불러올 때는 read 사용
                  context.read<Scores>().decreaseMidTerm();
                },
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              context.watch<Scores>().midTermExam.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                context.read<Scores>().increaseMidTerm();
              },
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
                onPressed: () {
                  context.read<Scores>().decreaseFinal();
                },
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              context.watch<Scores>().finalExam.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                context.read<Scores>().increaseFinal();
              },
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
