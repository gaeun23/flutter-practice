import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  static const routeName = '/chatList';

  @override
  Widget build(BuildContext context) {
    final filterName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .where('userName',
                isEqualTo: filterName) // chat -> randomString docs 내부 데이터에 접근
            .snapshots(), // snapshots() is equal .get().asStream()
        builder: (context, snapshot) {
          var docs = [];
          if (snapshot.hasData) {
            docs = snapshot.data!.docs;
          }
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return ChatListItem(
                text: docs[index]['text'],
                userName: docs[index]['userName'],
              );
            },
          );
        },
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  const ChatListItem({Key? key, required this.text, required this.userName})
      : super(key: key);
  final String text;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "$text : by $userName",
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
