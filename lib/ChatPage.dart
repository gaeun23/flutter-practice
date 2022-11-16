import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  static const routeName = '/chat';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final userEmail = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [NewMessage()],
        ),
      ),
    );
  }
}

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String newMessage = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(label: Text('New Message')),
              onChanged: (value) {
                setState(() {
                  newMessage = value;
                });
              },
            ),
          ),
        ),
        IconButton(
          color: Colors.blue,
          onPressed: newMessage.trim().isEmpty
              ? null
              : () async {
                  final currentUser = FirebaseAuth.instance.currentUser;
                  final currentUserName = await FirebaseFirestore.instance
                      .collection('user')
                      .doc(currentUser!.uid)
                      .get();

                  FirebaseFirestore.instance.collection('chat').add({
                    'text': newMessage,
                    'userName': currentUserName.data()!['userName'],
                    'timestamp': Timestamp.now(),
                    'uid': currentUser.uid,
                  });
                },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
