import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/ChatListPage.dart';

class FilterMessagePage extends StatefulWidget {
  const FilterMessagePage({Key? key}) : super(key: key);

  @override
  State<FilterMessagePage> createState() => _FilterMessagePageState();
}

class _FilterMessagePageState extends State<FilterMessagePage> {
  String filterName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Messages'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            filterName = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ChatListPage.routeName,
                  arguments: filterName,
                );
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
