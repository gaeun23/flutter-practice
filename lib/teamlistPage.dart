import 'package:flutter/material.dart';
import 'package:flutter_practice_widgets/teamMembers.dart';
import 'package:provider/provider.dart';

class TeamListPage extends StatefulWidget {
  const TeamListPage({Key? key}) : super(key: key);

  @override
  State<TeamListPage> createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Member List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return Dismissible(
              key: ValueKey(context.watch<TeamMembers>().memberList[i]),
              onDismissed: (direction) {
                setState(() {
                  context.read<TeamMembers>().removeMember(i);
                });
              },
              child: ListTile(
                title: Text(context.watch<TeamMembers>().memberList[i]),
              ));
        },
        itemCount: context.watch<TeamMembers>().memberList.length,
      ),
    );
  }
}
