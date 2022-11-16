import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';

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
          children: const [
            BubbleElement(isMe: true, text: "text", userName: "userName"),
            NewMessage(),
          ],
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

class BubbleElement extends StatelessWidget {
  const BubbleElement(
      {Key? key,
      required this.isMe,
      required this.text,
      required this.userName})
      : super(key: key);
  final bool isMe;
  final String text;
  final String userName;

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return ChatBubble(
        clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 20),
        backGroundColor: Colors.blue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            children: [
              Text(
                userName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    } else {
      return ChatBubble(
        clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
        backGroundColor: const Color(0xffE7E7ED),
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            children: [
              Text(
                userName,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      );
    }
  }
}
