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
        stream: FirebaseFirestore.instance.collection('chat').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          final filteredDos = docs
              .where((field) => field['userName'] == filterName)
              .map((e) => e.data())
              .toList();

          return ListView.builder(
            itemCount: filteredDos.length,
            itemBuilder: (context, index) {
              return ChatListItem(
                text: filteredDos[index]['text'],
                userName: filteredDos[index]['userName'],
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
