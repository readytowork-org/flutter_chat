import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/widgets/chat/messages.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          DropdownButton(
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Row(children: const [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.black45,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Logout")
                ]),
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const Expanded(child: Messages()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/R2M0dLKRhaLgsUkzqjgp/messages')
              .add({"text": "Added from floating button"});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
